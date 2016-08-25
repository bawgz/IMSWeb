package com.revature.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.revature.beans.Client;
import com.revature.beans.Product;
import com.revature.hibernate.BusinessDelegate;

@Controller
public class AjaxController {

	@RequestMapping(method=RequestMethod.GET, value="getSuppliers.do", produces="application/json")
	@ResponseBody // write return value directly to HTTP repsonse in the specified content-type
				  // (produces=content-type)
	public List<Client> getSuppliers(){
		List<Client> clients = new BusinessDelegate().getClientById(21);
		return clients;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="getRetailers.do", produces="application/json")
	@ResponseBody // write return value directly to HTTP repsonse in the specified content-type
				  // (produces=content-type)
	public List<Client> getRetailers(){
		List<Client> clients = new BusinessDelegate().getClientById(22);
		return clients;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="deleteproduct.do")
	public void deleteProduct(int upc){
		BusinessDelegate bd = new BusinessDelegate();
		bd.deleteProductByUpc(upc);
	}
}
