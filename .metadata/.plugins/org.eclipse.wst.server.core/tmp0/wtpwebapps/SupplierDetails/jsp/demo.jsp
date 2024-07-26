<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Supplier Form</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<style>
body {
	padding: 50px;
	display:flex;
	justify-content: center;
	align-items: center;
}


.form-group {
	margin-bottom: 15px;
}

.form-group input {
	width: 500px;
	height: 40px;
}
</style>
<script type="text/javascript" src="/SupplierDetails/js/view.js"></script>
<script>
	function redirectToproductList() {
		window.open("/SupplierDetails/jsp/saveSupplier.jsp")
	}
</script>
</head>
<body>
	<div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!-- Centered Heading -->
                <h2 class="text-center">Supplier Form</h2>
                
                

	<form>
		<div class="form-group">
			<label for="supplierName">Supplier Name:</label> <input type="text"
				class="form-control" id="supplierName" name="supplierName"
				width="5px">
		</div>

		<div class="form-group">
			<label for="productName">Product Name:</label> <input type="text"
				class="form-control" id="productName" name="productName">
		</div>

		<div class="form-group">
			<label for="price">Price:</label> <input type="text"
				class="form-control" id="price" name="price">
		</div>

		<div class="form-group">
			<label for="quantity">Quantity:</label> <input type="text"
				class="form-control" id="quantity" name="quantity">
		</div>
		<!--<div class="container text-center">  -->
			<button type="button" class="btn btn-success"
				onclick="saveProduct();">Save</button>
			<button type="button" class="btn btn-primary"
				onclick="redirectToproductList();">List</button>

			<!-- <button id="viewButton" class="btn btn-primary"onclick="getAllProductDetails();">View All</button> -->
		
	</form>
			</div>
        </div>
     </div>
	<!-- Bootstrap JS and jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
