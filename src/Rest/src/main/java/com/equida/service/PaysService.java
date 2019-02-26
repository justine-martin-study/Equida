package com.equida.service;

import com.equida.exception.NotFoudException;
import com.equida.bdd.entity.Pays;
import com.equida.bdd.repository.PaysRepository;
import com.equida.exception.ServiceException;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class PaysService {

	@Autowired
	private PaysRepository paysRepository;
	
	public List<Pays> getAll(PageRequest pageRequest) {
		return paysRepository.findAll(pageRequest);
	}

	public Pays getById(Long idVente) {
		Optional<Pays> pays = paysRepository.findById(idVente);
	
		if(!pays.isPresent()) {
			throw new NotFoudException("L'id du pays spécifié n'existe pas.");
		}
		
		return pays.get();
	}

	public Pays create(String libelle) {
		if(libelle == null) {
			throw new ServiceException("libelle ne doit pas être null");
		}
		
		Pays pays = new Pays();
		
		pays.setId(null);
		pays.setLibelle(libelle);
		pays.setDeleted(false);
		
		return save(pays);
	}
	
	public Pays updatePays(Long idPays, String libelle) {
		if(idPays == null) {
			throw new ServiceException("idPays ne doit pas être null");
		}
		
		if(libelle == null) {
			throw new ServiceException("libelle ne doit pas être null");
		}
		
		Pays pays = getById(idPays);
		
		pays.setLibelle(libelle);
		return save(pays);
	}
	
	public void deletePays(Long idPays) {
		if(idPays == null) {
			throw new ServiceException("idPays ne doit pas être null");
		}
		
		Pays pays = getById(idPays);
		
		pays.setDeleted(true);
		save(pays);
	}
	
	public Pays save(Pays pays) {
		return paysRepository.save(pays);
	}
	
}