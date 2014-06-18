package fr.treeptik.facturation.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fr.treeptik.facturation.datatables.DataTablesRequest;
import fr.treeptik.facturation.datatables.DataTablesResponse;
import fr.treeptik.facturation.datatables.DataTablesTO;
import fr.treeptik.facturation.modele.Facture;
import fr.treeptik.facturation.service.FactureService;

@Controller
@RequestMapping(value = "/facture")
public class FactureController {

	@Autowired
	private FactureService factureService;

	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public ModelAndView initFacture() {
		ModelAndView modelAndView = new ModelAndView("facture/home");
		return modelAndView;
	}

	@RequestMapping(value = "saisie.do", method = RequestMethod.GET)
	public ModelAndView saisieFacture(
			@ModelAttribute(value = "fa") Facture facture) {
		ModelAndView modelAndView = new ModelAndView("facture/saisie");
		modelAndView.addObject("facture", facture);
		return modelAndView;
	}

	// @RequestMapping(value = "saisie.do", method = RequestMethod.GET)
	// public @ResponseBody
	// DataTablesResponse<Object> getData(@RequestBody DataTablesRequest dtReq,
	// HttpServletResponse response) {
	// return new DataTablesResponse<Object>();
	// }

}
