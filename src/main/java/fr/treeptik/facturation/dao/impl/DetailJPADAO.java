package fr.treeptik.facturation.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import fr.treeptik.facturation.dao.DetailDAO;
import fr.treeptik.facturation.exception.DAOException;
import fr.treeptik.facturation.modele.Detail;

@Repository
public class DetailJPADAO extends GenericJPADAO<Detail, Integer> implements DetailDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	public DetailJPADAO(){
		super(Detail.class);
	}

	@Override
	public List<Detail> findByFactureId(Integer id) throws DAOException {
		
		TypedQuery<Detail> query3 = entityManager.createQuery(
				"select d from Detail d where d.facture.id = :id",
				Detail.class);
		query3.setParameter("id", id);
		
		List<Detail> resultList = query3.getResultList();
		if (resultList != null) {
			return resultList;
		}
		return null;

	}
	
}
