package fr.treeptik.facturation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.treeptik.facturation.dao.FactureDAO;
import fr.treeptik.facturation.exception.DAOException;
import fr.treeptik.facturation.exception.ServiceException;
import fr.treeptik.facturation.modele.Facture;
import fr.treeptik.facturation.service.FactureService;

@Service
public class FactureServiceImpl implements FactureService {

	@Autowired
	private FactureDAO factureDAO;

	@Override
	@Transactional
	public Facture save(Facture facture) throws ServiceException {
		try {
			return factureDAO.save(facture);
		} catch (DAOException e) {
			throw new ServiceException("Erreur save facture", e);
		}
	}

	@Override
	@Transactional
	public Facture update(Facture facture) throws ServiceException {
		try {
			return factureDAO.update(facture);
		} catch (DAOException e) {
			throw new ServiceException("Erreur update facture", e);
		}
	}

	@Override
	public void remove(Facture facture) throws ServiceException {
		try {
			factureDAO.remove(facture);
		} catch (DAOException e) {
			throw new ServiceException("Erreur remove facture", e);
		}

	}

	@Override
	public Facture findById(Integer id) throws ServiceException {
		try {
			return factureDAO.findById(id);
		} catch (DAOException e) {
			throw new ServiceException("Erreur findById facture", e);
		}
	}

	@Override
	public List<Facture> findAll() throws ServiceException {
		try {
			return factureDAO.findAll();
		} catch (DAOException e) {
			throw new ServiceException("Erreur findAll facture", e);
		}
	}
	@Override
	public Facture findWithDetail(Integer id) throws ServiceException {
		return factureDAO.findWithDetail(id);

	}

}
