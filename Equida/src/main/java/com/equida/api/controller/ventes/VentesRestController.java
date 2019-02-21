package com.equida.api.controller.ventes;

import com.equida.api.dto.FilterDto;
import com.equida.api.dto.VenteDto;
import com.equida.api.route.VentesApiRoute;
import com.equida.bdd.entity.Vente;
import com.equida.service.VenteService;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VentesRestController {
	
	@Autowired
	private VenteService venteService;
	
	@GetMapping(VentesApiRoute.RAW_URI)
	public List<VenteDto> getVentes(@Valid FilterDto filterDto) {
		List<Vente> ventes = venteService.getAll(PageRequest.of(filterDto.getOffset(), filterDto.getLimit()));
		
		List<VenteDto> ventesDto = new ArrayList<>();
		
		for(Vente v : ventes) {			
			ventesDto.add(VenteDto.convertToDto(v));
		}
		
		return ventesDto;
	}

}
