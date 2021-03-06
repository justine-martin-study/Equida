package com.equida.common.service;

import com.equida.common.bdd.entity.CategVente;
import com.equida.common.exception.NotFoundException;
import com.equida.common.bdd.repository.CategorieVenteRepository;
import com.equida.common.exception.ServiceException;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class CategorieVenteService {

	@Autowired
	private CategorieVenteRepository categorieVenteRepository;
	
	public List<CategVente> getAll() {
		return categorieVenteRepository.findAll();
	}
	
	public List<CategVente> getAll(PageRequest pageRequest) {
		return categorieVenteRepository.findAll(pageRequest);
	}

	public CategVente getById(Long idCategVente) throws NotFoundException {
		Optional<CategVente> categVente = categorieVenteRepository.findById(idCategVente);
	
		if(!categVente.isPresent()) {
			throw new NotFoundException("L'id de la catégorie de vente n'existe pas.");
		}
		
		return categVente.get();
	}
	
	public CategVente create(String libelle) {
		
		if(libelle == null) {
			throw new ServiceException("libelle ne doit pas être null");
		}
		
		CategVente categVente = new CategVente();
		
		categVente.setId(null);
		categVente.setLibelle(libelle);
		categVente.setDeleted(false);
		
		return save(categVente);
	}
	
	public CategVente updateCategVente(Long idCategVente, String libelle) throws NotFoundException {
		if(idCategVente == null) {
			throw new ServiceException("idCategVente ne doit pas être null");
		}
		
		if(libelle == null) {
			throw new ServiceException("libelle ne doit pas être null");
		}
		
		CategVente categVente = getById(idCategVente);
		
		categVente.setLibelle(libelle);
		return save(categVente);
	}
	
	public void deleteCategVente(Long idCategVente) throws NotFoundException {
		if(idCategVente == null) {
			throw new ServiceException("idCategVente ne doit pas être null");
		}
		
		CategVente categVente = getById(idCategVente);
		
		categVente.setDeleted(true);
		save(categVente);
	}
	
	public CategVente save(CategVente categVente) {
		return categorieVenteRepository.save(categVente);
	}
	
}
