
package com.springformmvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import java.util.*;
import javax.persistence.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import model.*;

@Controller
@RequestMapping("/")
public class SupplierCoffeeController {
	List<Coffee> coffees = new ArrayList<>();

	@RequestMapping(value = "/supplier", method = RequestMethod.GET)
	public String getSupplierView() {
		return "supplier";
	}

	@RequestMapping(value = "/addSupplier", method = RequestMethod.POST)
	public ModelAndView addSupplier(@RequestBody Supplier sup, ModelMap modelMap) {

		modelMap.addAttribute("sups", sup);
		supplierAdd(sup);
		return new ModelAndView("showSupplier");
	}

	void supplierAdd(Supplier sup) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAspringWebMVC0117");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(sup);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String getFirstView() {
		return "home";
	}

	@RequestMapping(value = "/addOrder", method = RequestMethod.POST)
	public ModelAndView addOrder(@RequestBody Coffee coffee, ModelMap modelMap) {
		Supplier sup = coffee.getSupplier();
		coffees.add(coffee);
		modelMap.addAttribute("coffees", coffees);
		modelMap.addAttribute("sups", sup);
		return new ModelAndView("showCoffee");
	}
}
