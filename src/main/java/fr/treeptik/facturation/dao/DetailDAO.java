package fr.treeptik.facturation.dao;

import java.util.List;

import fr.treeptik.facturation.exception.DAOException;
import fr.treeptik.facturation.modele.Detail;

public interface DetailDAO extends GenericDAO<Detail, Integer>{
	
	public List<Detail> findByFactureId(Integer id) throws DAOException;

}
