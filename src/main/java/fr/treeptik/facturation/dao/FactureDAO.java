package fr.treeptik.facturation.dao;

import fr.treeptik.facturation.modele.Facture;

public interface FactureDAO extends GenericDAO<Facture, Integer>{

	Facture findWithDetail(Integer id);

}
