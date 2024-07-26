package com.supplier.hibernate;

public class ProductDTO {
	
		private Long id;
		private String supplierName;
		private String productName;
		private Double price;
		private Double quantity;
		
		
	public ProductDTO() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public void setPrice(Double price2) {
		this.price = price2;
	}

	public Double getQuantity() {
		return quantity;
	}

	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}

	public ProductDTO(Long id, String supplierName, String productName, Double price, Double quantity) {
		super();
		this.id = id;
		this.supplierName = supplierName;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
	}
		
}