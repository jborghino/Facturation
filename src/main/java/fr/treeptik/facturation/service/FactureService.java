package fr.treeptik.facturation.service;

import java.util.List;

import fr.treeptik.facturation.exception.ServiceException;
import fr.treeptik.facturation.modele.Facture;

public interface FactureService {

	Facture save(Facture facture) throws ServiceException;

	Facture update(Facture facture) throws ServiceException;

	void remove(Facture facture) throws ServiceException;

	Facture findById(Integer id) throws ServiceException;

	List<Facture> findAll() throws ServiceException;
	
}
