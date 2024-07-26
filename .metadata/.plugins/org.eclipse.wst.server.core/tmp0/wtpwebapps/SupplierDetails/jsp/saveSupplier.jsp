<%@page import="java.util.List"%>
<%@page import="com.supplier.dao.ProductDAO"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.supplier.dao.ProductDAO" %>
<%@page import="com.supplier.hibernate.ProductDTO" %>
<!DOCTYPE html>
<html>
<head>
<script  type="text/javascript" src="/SupplierDetails/js/view.js"></script>
<script> 
    function redirectToUpdate(){
    	window.open("/SupplierDetails/jsp/editSupplier.jsp")
    }</script>
    <script> 
    function redirectTosaveProduct(){
    	window.open("/SupplierDetails/jsp/demo.jsp")
    }</script>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            padding: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
    </style>
    <body>
<div class="col-10 mt-5">

<% ProductDAO dao = new ProductDAO();
   List<ProductDTO> productList= dao.getAllProductDetails();
   %>
    <table class="table table-striped">
    <thread>
    <tr>
    <th>Id</th>
    <th>Supplier Name</th>
    <th>Product Name</th>
    <th>Price</th>
    <th>Quantity</th>
    </tr>
    </thread>
   <tbody>
   <%for(ProductDTO prod : productList){ %>
        <tr>
        	<td><label id="productId"><%=prod.getId()%></label></td>
			<td><label id="supId"><%=prod.getSupplierName()%></label></td>
			<td><label id="prodId"><%=prod.getProductName()%></label></td>
			<td><label id="priceId"><%=prod.getPrice()%></label></td>
			<td><label id="qtyId"><%=prod.getQuantity()%></label></td>

          
        </tr>
        
        <%} %>
</tbody>
    </table>
    <div class ="container text-center">
        <button class="btn btn-primary btn-sm edit" onclick="redirectToUpdate();">Edit</button>              
                <button class="btn btn-success btn-sm delete" onclick="redirectTosaveProduct();">Back</button>
         </div>
    </div>
    <!-- Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 </body>   
</head>
</html>