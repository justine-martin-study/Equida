package com.equida.common.service;

import com.equida.common.exception.NotFoundException;
import com.equida.common.bdd.entity.Vente;
import com.equida.common.bdd.repository.VenteRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class VenteService {

	@Autowired
	private VenteRepository venteRepository;
	
	public List<Vente> getAll() {
		return venteRepository.findAll();
	}
	
	public List<Vente> getAll(PageRequest pageRequest) {
		return getAll(null, pageRequest);
	}
	
	public List<Vente> getAll(Long idCategVente, PageRequest pageRequest) {
		if(idCategVente != null) {
			return venteRepository.findAllByIdCategVente(idCategVente, pageRequest);
		}
		
		return venteRepository.findAll(pageRequest);
	}
	
	public List<Vente> getAllByIdCategVente(Long idCategVente) {
		return venteRepository.findAllByIdCategVente(idCategVente);
	}

	public Vente getById(Long idVente) throws NotFoundException {
		Optional<Vente> vente = venteRepository.findById(idVente);
	
		if(!vente.isPresent()) {
			throw new NotFoundException("L'id de vente spécifié n'existe pas.");
		}
		
		return vente.get();
	}

	public List<Vente> get5Recents() {
		return venteRepository.find5Recents(PageRequest.of(0, 5));
	}
	
}
