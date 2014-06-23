package fr.treeptik.facturation.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

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
	
	@Override
	public Facture findWithDetail(Integer id){
		
		TypedQuery<Facture> query = entityManager.createQuery(
				"Select f From Facture f left join fetch f.details d Where f.id = :id", Facture.class);
		
		query.setParameter("id", id);
		
		return query.getSingleResult();
		
	}
}
