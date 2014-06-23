package fr.treeptik.facturation.service;

import java.util.List;

import fr.treeptik.facturation.exception.ServiceException;
import fr.treeptik.facturation.modele.Detail;

public interface DetailService {

	Detail save(Detail detail) throws ServiceException;

	Detail update(Detail detail) throws ServiceException;

	void remove(Detail detail) throws ServiceException;

	Detail findById(Integer id) throws ServiceException;

	List<Detail> findAll() throws ServiceException;
	
	public List<Detail> findByFactureId(Integer id) throws ServiceException;
	
}
