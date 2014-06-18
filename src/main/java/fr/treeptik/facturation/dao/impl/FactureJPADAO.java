package fr.treeptik.facturation.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import fr.treeptik.facturation.dao.FactureDAO;
import fr.treeptik.facturation.modele.Facture;

@Repository
public class FactureJPADAO extends GenericJPADAO<Facture, Integer> implements FactureDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	public FactureJPADAO(){
		super(Facture.class);
	}
	
}
