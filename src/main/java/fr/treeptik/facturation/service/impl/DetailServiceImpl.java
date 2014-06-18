package fr.treeptik.facturation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.treeptik.facturation.dao.DetailDAO;
import fr.treeptik.facturation.exception.DAOException;
import fr.treeptik.facturation.exception.ServiceException;
import fr.treeptik.facturation.modele.Detail;
import fr.treeptik.facturation.service.DetailService;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailDAO detailDAO;

	@Override
	@Transactional
	public Detail save(Detail detail) throws ServiceException {
		try {
			return detailDAO.save(detail);
		} catch (DAOException e) {
			throw new ServiceException("Erreur save detail", e);
		}
	}

	@Override
	@Transactional
	public Detail update(Detail detail) throws ServiceException {
		try {
			return detailDAO.update(detail);
		} catch (DAOException e) {
			throw new ServiceException("Erreur update detail", e);
		}
	}

	@Override
	public void remove(Detail detail) throws ServiceException {
		try {
			detailDAO.remove(detail);
		} catch (DAOException e) {
			throw new ServiceException("Erreur remove detail", e);
		}
		
	}

	@Override
	public Detail findById(Integer id) throws ServiceException {
		try {
			return detailDAO.findById(id);
		} catch (DAOException e) {
			throw new ServiceException("Erreur findById detail", e);
		}
	}

	@Override
	public List<Detail> findAll() throws ServiceException {
		try {
			return detailDAO.findAll();
		} catch (DAOException e) {
			throw new ServiceException("Erreur findAll detail", e);
		}
	}
	
	

	
}
