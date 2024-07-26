<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
<%@page import="com.supplier.dao.ProductDAO"%>
<%
// Retrieve the list of IDs from the database
List<Long> productIdList = ProductDAO.getProductId();
%>

<!DOCTYPE html>
<html>
<head>
<script> 
    function redirectTosaveProduct(){
    	window.open("/SupplierDetails/jsp/saveSupplier.jsp")
    }</script>
    <meta charset="ISO-8859-1">
    <title>Edit Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            padding: 50px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group input {
	width: 500px;
	height: 40px;
}
.form-group select {
	width: 500px;
	height: 40px;
}
    </style>
    <script  type="text/javascript" src="/SupplierDetails/js/view.js"></script>    
    
</head>
<body>
<div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!-- Centered Heading -->
                <h2 class="text-center">Edit Form</h2>
                    
    <form>
    
    	<div class="form-group">
        <label for="productId">Select a Product ID:</label>
        <select class="form-control" id="productId" onchange="getProductDetailsById(this.value);">
            <% for (long id : productIdList) { %>
                <option value="<%= id %>"><%= id %></option>
            <% } %>
        </select>
    </div>
        <div class="form-group">
            <label for="supplierName">Supplier Name:</label>
            <input type="text" class="form-control" id="supplierName" name="supplierName">
        </div>
        
        <div class="form-group">
            <label for="productName">Product Name:</label>
            <input type="text" class="form-control" id="productName" name="productName">
        </div>
        
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="text" class="form-control" id="price" name="price">
        </div>
        
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="text" class="form-control" id="quantity" name="quantity">
        </div>
        <!-- <div class ="container text-center"> -->
        
        <button type="button" class="btn btn-success" onclick="updateProduct();">Update</button>
        <button type="button" class="btn btn-danger" onclick="deleteProduct()">Delete</button>
        <button type="button" class="btn btn-success" onclick="redirectTosaveProduct();">Back</button>
        
        
       <!-- <button id="viewButton" class="btn btn-primary"onclick="getAllProductDetails();">View All</button> --> 
        
    </form>
    </div>
    </div>
    </div>
    
    
    <!-- Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
