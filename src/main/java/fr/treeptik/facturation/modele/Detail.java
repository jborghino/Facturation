package fr.treeptik.facturation.modele;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Detail implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@ManyToOne
	private Facture facture;
	
	private String ref;
	private String designation;
	private Integer nb;
	private Double prixHT;
	private Double totalHT;
	
	public Detail() {
		super();
	}
	public Detail(Integer id, String ref, String designation, Integer nb,
			Double prixHT, Double totalHT) {
		super();
		this.id = id;
		this.ref = ref;
		this.designation = designation;
		this.nb = nb;
		this.prixHT = prixHT;
		this.totalHT = totalHT;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public Integer getNb() {
		return nb;
	}
	public void setNb(Integer nb) {
		this.nb = nb;
	}
	public Double getPrixHT() {
		return prixHT;
	}
	public void setPrixHT(Double prixHT) {
		this.prixHT = prixHT;
	}
	public Double getTotalHT() {
		return totalHT;
	}
	public void setTotalHT(Double totalHT) {
		this.totalHT = totalHT;
	}
	@Override
	public String toString() {
		return "Detail [id=" + id + ", ref=" + ref + ", designation="
				+ designation + ", nb=" + nb + ", prixHT=" + prixHT
				+ ", totalHT=" + totalHT + "]";
	}
	public Facture getFacture() {
		return facture;
	}
	public void setFacture(Facture facture) {
		this.facture = facture;
	}
	
	
}
