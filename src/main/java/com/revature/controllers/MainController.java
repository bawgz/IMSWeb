package com.revature.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;

import com.revature.beans.Client;
import com.revature.beans.ClientType;
import com.revature.beans.Product;
import com.revature.beans.ProductCategory;
import com.revature.beans.PurchaseOrder;
import com.revature.hibernate.BusinessDelegate;

@Controller
public class MainController implements ServletContextAware, InitializingBean{

	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value="plist.do", method=RequestMethod.GET)
	public String plist(HttpServletRequest req, HttpServletResponse resp){
		req.setAttribute("product", new Product());
		List<ProductCategory> categories = new BusinessDelegate().getProductCategories();
		req.getSession().setAttribute("categories", categories);
		List<Product> products = new BusinessDelegate().getProducts();
		req.getSession().setAttribute("products", products);
		return "plist";
	}
	
	@RequestMapping(value="clist.do", method=RequestMethod.GET)
	public String clist(HttpServletRequest req, HttpServletResponse resp) {
		BusinessDelegate bd = new BusinessDelegate();
		req.setAttribute("client", new com.revature.beans.Client());
		List<com.revature.beans.StateAbbrv> states = bd.getStateAbbrvs();
		req.getSession().setAttribute("states", states);
		List<com.revature.beans.ClientType> clientTypes = bd.getClientTypes();
		req.getSession().setAttribute("clientTypes", clientTypes);
		req.setAttribute("address", new com.revature.beans.Address());
		return "clist";
	}
	
	@RequestMapping(value="invoice.do", method=RequestMethod.GET)
	public String invoice(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("invoice", new PurchaseOrder());
		List<ClientType> clientTypes = new BusinessDelegate().getClientTypes();
		req.setAttribute("clientTypes", clientTypes);
		return "invoice";
	}
	
	@RequestMapping(value="addproduct.do", method=RequestMethod.POST)
	public String addProduct(
			@ModelAttribute("product") @Valid Product product, 
			BindingResult bindingResult,
			HttpServletRequest req,
			HttpServletResponse resp) {
		
		BusinessDelegate bd = new BusinessDelegate();
		System.out.println("Button pressed");
		req.setAttribute("success", null);
		if(bindingResult.hasErrors()){
			List<ObjectError> errors = bindingResult.getAllErrors();
			for(ObjectError e: errors){
				System.out.println(e.getDefaultMessage());
			}
			List<Product> products = new BusinessDelegate().getProducts();
			req.getSession().setAttribute("products", products);
			return "plist";
		}
		String[] catNames = product.getCategoryNames();

		Set<ProductCategory> categories = new HashSet<>();
		List<ProductCategory> allCats = new ArrayList<ProductCategory>();
		allCats = (List<ProductCategory>) req.getSession().getAttribute("categories");
		List<String> catNamesList = new ArrayList<String>(Arrays.asList(catNames));
		for(ProductCategory cat: allCats){
			if(catNamesList.contains(cat.getCategoryDescription())) {
				categories.add(cat);
			}
		}
		product.setProductCategories(categories);
		bd.insert(product);
		req.setAttribute("success", "Product succesfully added.");
		List<Product> products = bd.getProducts();
		req.getSession().setAttribute("products", products);
		return "plist";
	}
	
	@RequestMapping(value="updateproduct.do", method=RequestMethod.POST)
	public String updateProduct(
			@ModelAttribute("product") @Valid Product product, 
			BindingResult bindingResult,
			HttpServletRequest req,
			HttpServletResponse resp) {
		
		BusinessDelegate bd = new BusinessDelegate();
		System.out.println("Button pressed");
		req.setAttribute("success", null);
		if(bindingResult.hasErrors()){
			List<ObjectError> errors = bindingResult.getAllErrors();
			for(ObjectError e: errors){
				System.out.println(e.getDefaultMessage());
			}
			List<Product> products = bd.getProducts();
			req.getSession().setAttribute("products", products);
			req.setAttribute("success", "Product not updated. Errors in input.");
			return "plist";
		}
		String[] catNames = product.getCategoryNames();

		Set<ProductCategory> categories = new HashSet<>();
		List<ProductCategory> allCats = new ArrayList<ProductCategory>();
		allCats = (List<ProductCategory>) req.getSession().getAttribute("categories");
		List<String> catNamesList = new ArrayList<String>(Arrays.asList(catNames));
		for(ProductCategory cat: allCats){
			if(catNamesList.contains(cat.getCategoryDescription())) {
				categories.add(cat);
			}
		}
		product.setProductCategories(categories);
		bd.update(product);
		req.setAttribute("success", "Product succesfully updated.");
		List<Product> products = bd.getProducts();
		req.getSession().setAttribute("products", products);
		return "plist";
	}

	@RequestMapping(value="addclient.do", method=RequestMethod.POST)
	public String addClient(@ModelAttribute("client") @Valid com.revature.beans.Client client,
			BindingResult bindingResult, HttpServletRequest req, HttpServletResponse resp) {
		new BusinessDelegate().insert(client.getAddress());
		new BusinessDelegate().insert(client);
		return "clist";
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {}
	@Override
	public void setServletContext(ServletContext ctxt) {
		this.servletContext = ctxt;
	}
	
}
