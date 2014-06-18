package fr.treeptik.facturation.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import fr.treeptik.facturation.dao.DetailDAO;
import fr.treeptik.facturation.modele.Detail;

@Repository
public class DetailJPADAO extends GenericJPADAO<Detail, Integer> implements DetailDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	public DetailJPADAO(){
		super(Detail.class);
	}
	
}
