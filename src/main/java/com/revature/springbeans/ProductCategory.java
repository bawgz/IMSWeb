package com.revature.springbeans;

import java.util.HashSet;
import java.util.Set;

import com.revature.beans.Product;

public class ProductCategory {

	private int categoryId;
	private String categoryDescription;
	private Set<Product> products;
	
	
	public ProductCategory(int categoryId, String categoryDescription) {
		super();
		this.categoryId = categoryId;
		this.categoryDescription = categoryDescription;
		products = new HashSet<Product>();
	}
	public ProductCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
}
