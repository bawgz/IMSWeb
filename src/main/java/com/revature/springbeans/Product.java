package com.revature.springbeans;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.revature.beans.ProductCategory;

public class Product {

	@NotNull
	@Size(min=1, message="Name is required")
	private String productName;
	@NotNull
	@Size(min=1, message="Description is required")
	private String productDescription;
	@NotNull
	@Size(min=1, max= 3, message="Short name is required")
	private String shortName;
	@NotNull(message="Invalid cost")
	@Min(value=0)
	private double unitCost;
	@NotNull
	@Size(min=1, message="Pack size is required")
	private String packSize;
	@NotNull(message="Invalid quanitity")
	@Min(value=0)
	private int reorderQuantity;
	@NotNull(message="Invalid threshold")
	@Min(value=0)
	private int reorderThreshold;
	@NotNull(message="Invalid quanitity")
	@Min(value=0)
	private int quantityOnHand;
	@NotNull(message="Invalid price")
	@Min(value=0)
	private double retailPrice;
	private double productWeight;
	private Blob productImage;
	@NotNull(message="Must select a category")
	private Set<ProductCategory> productCategories;
	
	public Product() {
		super();
	}

	public Product(String productName, String productDescription, String shortName, double unitCost,
			String packSize, int reorderQuantity, int reorderThreshold, int quantityOnHand, double retailPrice,
			double productWeight, Blob productImage, Set<ProductCategory> categories) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.shortName = shortName;
		this.unitCost = unitCost;
		this.packSize = packSize;
		this.reorderQuantity = reorderQuantity;
		this.reorderThreshold = reorderThreshold;
		this.quantityOnHand = quantityOnHand;
		this.retailPrice = retailPrice;
		this.productWeight = productWeight;
		this.productImage = productImage;
		productCategories = categories;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public double getUnitCost() {
		return unitCost;
	}

	public void setUnitCost(int unitCost) {
		this.unitCost = unitCost;
	}

	public String getPackSize() {
		return packSize;
	}

	public void setPackSize(String packSize) {
		this.packSize = packSize;
	}

	public int getReorderQuantity() {
		return reorderQuantity;
	}

	public void setReorderQuantity(int reorderQuantity) {
		this.reorderQuantity = reorderQuantity;
	}

	public int getReorderThreshold() {
		return reorderThreshold;
	}

	public void setReorderThreshold(int reorderThreshold) {
		this.reorderThreshold = reorderThreshold;
	}

	public int getQuantityOnHand() {
		return quantityOnHand;
	}

	public void setQuantityOnHand(int quantityOnHand) {
		this.quantityOnHand = quantityOnHand;
	}

	public double getRetailPrice() {
		return retailPrice;
	}

	public void setRetailPrice(int retailPrice) {
		this.retailPrice = retailPrice;
	}

	public double getProductWeight() {
		return productWeight;
	}

	public void setProductWeight(int productWeight) {
		this.productWeight = productWeight;
	}

	public Blob getProductImage() {
		return productImage;
	}

	public void setProductImage(Blob productImage) {
		this.productImage = productImage;
	}

	public Set<ProductCategory> getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(Set<ProductCategory> productCategories) {
		this.productCategories = productCategories;
	}
}
