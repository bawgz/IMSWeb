package com.revature.controllers;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;

import com.revature.beans.Product;
import com.revature.beans.ProductCategory;
import com.revature.hibernate.BusinessDelegate;

@Controller
public class MainController implements ServletContextAware, InitializingBean{

	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value="plist.do", method=RequestMethod.GET)
	public String plist(HttpServletRequest req, HttpServletResponse resp){
		List<ProductCategory> categories = new BusinessDelegate().getProductCategories();
		req.getSession().setAttribute("categories", categories);
		return "plist";
	}
	
	@RequestMapping(value="addproduct.do", method=RequestMethod.POST)
	public String addProduct(
			@ModelAttribute("product") @Valid Product product, 
			BindingResult bindingResult,
			HttpServletRequest req,
			HttpServletResponse resp) {
		if(bindingResult.hasErrors()){
			return "plist";
		}
		new BusinessDelegate().insert(product);
		return "index";
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub
		
	}
	
}
