package com.equida.bdd.entity;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = Client.TABLE)
public class Client extends Utilisateur {
	public static final String TABLE = "CLIENT";
	
	@OneToMany(mappedBy = "client", cascade = CascadeType.ALL)
	private List<ClientCategVente> categVentes;
	
	@OneToMany(mappedBy = "client", cascade = CascadeType.ALL)
	private List<Cheval> chevaux;

	public List<ClientCategVente> getCategVentes() {
		return categVentes;
	}

	public void setCategVentes(List<ClientCategVente> categVentes) {
		this.categVentes = categVentes;
	}

	public List<Cheval> getChevaux() {
		return chevaux;
	}

	public void setChevaux(List<Cheval> chevaux) {
		this.chevaux = chevaux;
	}
		
}
