<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Logout Page</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="/LoginPage/js/view.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
.navbar {
	background-color: #333;
	padding: 10px;
}

.navbar a {
	color: white;
	text-decoration: none;
	padding: 14px 20px;
}

#hover:hover {
	background: #ddd;
	color: black;
	border-radius: 5px;
}

.navbar .nav-link, .navbar .btn {
	color: white;
	text-decoration: none;
	padding: 14px 20px;
	border: none;
	background: none;
}

.navbar .btn {
	cursor: pointer;
}

.container {
	padding: 20px;
}

.dropdown .sub-menu {
	position: absolute;
	top: calc(100% + 5px);
	left: 0;
	width: 100%;
	background-color: #30363f;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.25);
	z-index: 1;
	transform-origin: top;
	transform: scaleY(0);
	visibility: hidden;
	opacity: 0;
	transition: all 0.5s ease;
	display: flex;
	flex-direction: column;
}

.dropdown:hover .sub-menu {
	opacity: 1;
	transform: scaleY(1);
	visibility: visible;
}

.dropdown .sub-menu a {
	padding: 10px 24px;
	color: #fff;
	display: block;
}

.dropdown .sub-menu span {
	background-image: linear-gradient(#fff, #fff);
	background-size: 0 1px;
	background-repeat: no-repeat;
	background-position: 0 100%;
	transition: background-size 0.5s ease;
}

.dropdown .sub-menu li:hover>a>span {
	background-size: 100% 1px;
}

.dropdown .sub-menu i {
	transform: rotate(-90deg);
	right: 24px;
}

.sub-menu li {
	list-style-type: none;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Employee Management</a>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a id="hover" class="nav-link"
					href="employeeDetails.jsp">Add Employee</a></li>
				<li class="nav-item"><a id="hover" class="nav-link"
					href="empList.jsp">Employee List</a></li>
				<li class="nav-item dropdown"><a id="hover" class="nav-link"
					href="editEmp.jsp">Edit Employee <i class="fa-solid fa-chevron-down"></i></a>
					<ul class="sub-menu">
						<li><a id="hover" href="updateEmp.jsp"><span>Update</span></a></li>
						<li><a id="hover" href="deletEmp.jsp"><span>Delete</span></a></li>
					</ul></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<button class="btn btn-outline-light" onclick="logout();">Logout</button>
				</li>
			</ul>
		</div>
	</nav>
	<script src="https://kit.fontawesome.com/595a890311.js"
		crossorigin="anonymous"></script>
	<!-- Bootstrap JS and jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- Your JavaScript code -->
</body>
</html>
