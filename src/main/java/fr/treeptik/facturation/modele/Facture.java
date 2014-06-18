package fr.treeptik.facturation.modele;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Facture implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	private Integer numero;
	private Date date;
	private Double totalHT;

	@OneToMany(mappedBy="facture")
	private List<Detail> details;

	public Facture() {
		super();
	}

	public Facture(Integer id, Integer numero, Date date, Double totalHT,
			List<Detail> details) {
		super();
		this.id = id;
		this.numero = numero;
		this.date = date;
		this.totalHT = totalHT;
		this.details = details;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Double getTotalHT() {
		return totalHT;
	}

	public void setTotalHT(Double totalHT) {
		this.totalHT = totalHT;
	}

	public List<Detail> getDetails() {
		return details;
	}

	public void setDetails(List<Detail> details) {
		this.details = details;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Facture [id=" + id + ", numero=" + numero + ", date=" + date
				+ ", totalHT=" + totalHT + ", details=" + details + "]";
	}

}
