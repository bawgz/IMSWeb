package com.revature.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.revature.beans.Client;
import com.revature.beans.Product;
import com.revature.hibernate.BusinessDelegate;

@Controller
public class AjaxController {

	@RequestMapping(method=RequestMethod.GET, value="getSuppliers.do")
	@ResponseBody // write return value directly to HTTP repsonse in the specified content-type
				  // (produces=content-type)
	public String getSuppliers(){
		List<Client> clients = new BusinessDelegate().getClientById(1);
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = "";
		try {
			json = ow.writeValueAsString(clients);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="getRetailers.do")
	@ResponseBody // write return value directly to HTTP repsonse in the specified content-type
				  // (produces=content-type)
	public String getRetailers(){
		List<Client> clients = new BusinessDelegate().getClientById(2);
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = "";
		try {
			json = ow.writeValueAsString(clients);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="getProducts.do")
	@ResponseBody
	public String getProducts() {
		List<Product> products = new BusinessDelegate().getProducts();
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = "";
		try {
			json = ow.writeValueAsString(products);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}
	
}
