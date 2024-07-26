package com.supplier.dao;

public class SupplierDetailsBean {

	private String supplierName;
	private String productName;
	private Double price;
	private Double quantity;
	public SupplierDetailsBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SupplierDetailsBean(String supplierName, String productName, Double price, Double quantity) {
		super();
		this.supplierName = supplierName;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "SupplierDetailsBean [supplierName=" + supplierName + ", productName=" + productName + ", price=" + price
				+ ", quantity=" + quantity + "]";
	}

	
	}
