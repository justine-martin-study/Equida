package com.equida.webapp.web.controller;

import com.equida.common.exception.NotFoundException;
import com.equida.common.exception.WebException;
import com.equida.webapp.web.attribute.InputOutputAttribute;
import com.equida.webapp.web.form.IForm;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
abstract public class AbstractWebController {
		
    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(HttpServletRequest request, Exception exception) {	
		if(exception instanceof AccessDeniedException) {
			return handle403(request, exception);
		} else if(exception instanceof NotFoundException) {
			return handleNotFoundException(request, exception);
		} else if(exception instanceof WebException) {
			return handleWebException(request, exception);
		} else {
			return handleDefault(request, exception);
		}
    }
	
	public ModelAndView handle403(HttpServletRequest request, Exception exception) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(InputOutputAttribute.EXCEPTION, exception);
        modelAndView.addObject(InputOutputAttribute.URL, request.getRequestURL());
        modelAndView.setViewName("error/403");

        return modelAndView;
    }
	
	public ModelAndView handleNotFoundException(HttpServletRequest request, Exception exception) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(InputOutputAttribute.EXCEPTION, exception);
        modelAndView.addObject(InputOutputAttribute.URL, request.getRequestURL());
        modelAndView.setViewName("error/404");

        return modelAndView;
    }
	
	private ModelAndView handleWebException(HttpServletRequest request, Exception exception) {
		return handleDefault(request, exception);
	}
	
    public ModelAndView handleDefault(HttpServletRequest request, Exception exception) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(InputOutputAttribute.EXCEPTION, exception);
        modelAndView.addObject(InputOutputAttribute.URL, request.getRequestURL());
        modelAndView.setViewName("error/500");
		
		return modelAndView;
    }
	
	protected void addError(String messageError, ModelAndView modelAndView) {
		Map<String, String> errorMap = (Map<String, String>) modelAndView.getModel().get(InputOutputAttribute.ERROR_LIST);
		if(errorMap == null)
			errorMap = new HashMap<>();
		
        errorMap.put(""+errorMap.size(), messageError);
        modelAndView.addObject(InputOutputAttribute.ERROR_LIST, errorMap);
    }
	
	protected void addMessage(String message, ModelAndView modelAndView) {
		ArrayList<String> messages = (ArrayList<String>) modelAndView.getModel().get(InputOutputAttribute.MESSAGES_LIST);
		if(messages == null)
			messages = new ArrayList<>();
			
        messages.add(message);
        modelAndView.addObject(InputOutputAttribute.MESSAGES_LIST, messages);
    }

    protected void bindErrors(BindingResult bindingResult, RedirectAttributes attributes) {
		Map<String, String> errorMap = new HashMap<>();
		
		List<FieldError> fieldErrors = bindingResult.getFieldErrors();
        Iterator<FieldError> fieldErrorIterator = fieldErrors.iterator();
        while (fieldErrorIterator.hasNext()) {
            FieldError fieldError = fieldErrorIterator.next();
            errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
        }

        if (errorMap.size() > 0) {
            attributes.addFlashAttribute(InputOutputAttribute.ERROR_LIST, errorMap);
        }
    }
	
	protected void addError(String messageError, RedirectAttributes attributes) {
		Map<String, String> errorMap = (Map<String, String>) attributes.getFlashAttributes().get(InputOutputAttribute.ERROR_LIST);
		if(errorMap == null)
			errorMap = new HashMap<>();
		
        errorMap.put(""+errorMap.size(), messageError);
        attributes.addFlashAttribute(InputOutputAttribute.ERROR_LIST, errorMap);
    }
	
	protected void addMessage(String message, RedirectAttributes attributes) {
		ArrayList<String> messages = (ArrayList<String>)  attributes.getFlashAttributes().get(InputOutputAttribute.MESSAGES_LIST);
		if(messages == null)
			messages = new ArrayList<>();
		
        messages.add(message);
        attributes.addFlashAttribute(InputOutputAttribute.MESSAGES_LIST, messages);
    }
	
	public <T> void registerForm(ModelAndView modelAndView, Model model, Class<? extends IForm<T>> formClass, T entity) {		
		if(!model.containsAttribute(InputOutputAttribute.FORM)) {
			IForm form = null;
			try {
				form = formClass.newInstance();
			} catch (InstantiationException | IllegalAccessException ex) {
				ex.printStackTrace();
				return;
			}
			
			if(entity != null) {
				form.fillFromEntity(entity);
			}
			
			modelAndView.addObject(InputOutputAttribute.FORM, form);
		} else {
			modelAndView.addObject(InputOutputAttribute.FORM, model.asMap().get(InputOutputAttribute.FORM));
		}
	}
	
	public boolean checkForError(BindingResult bindingResult, RedirectAttributes attributes, IForm form) {
		if (bindingResult.hasErrors()) {
			bindErrors(bindingResult, attributes);
			attributes.addFlashAttribute(InputOutputAttribute.FORM, form);
			
			return true;
		}
		
		return false;
	}

}
