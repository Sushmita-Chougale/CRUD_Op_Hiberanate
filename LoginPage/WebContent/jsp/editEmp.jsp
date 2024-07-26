<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.login.dao.EmpDao"%>
<%@ include file="nav.jsp" %>

<%-- Retrieve the list of IDs from the database --%>
<%
List<Long> empIdList = EmpDao.getEmpId();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/LoginPage/js/view.js"></script>
<title>Edit Employee</title>
<!-- Custom CSS -->
<style>
body {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-image: url("https://mdbootstrap.com/img/new/fluid/city/018.jpg");
    background-repeat: no-repeat;
    background-size: 100% 100%;
}

.card {
    padding: 30px 40px;
    margin-top: 60px;
    margin-bottom: 60px;
    border: none !important;
    box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2);
}

.blue-text {
    color: #00BCD4;
}

.form-control-label {
    margin-bottom: 0;
}

input, textarea, button {
    padding: 8px 15px;
    border-radius: 5px !important;
    margin: 5px 0px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    font-size: 18px !important;
    font-weight: 300;
}

input:focus, textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #00BCD4;
    outline-width: 0;
    font-weight: 400;
}

.btn-block {
    text-transform: uppercase;
    font-size: 15px !important;
    font-weight: 400;
    height: 43px;
    cursor: pointer;
}

.btn-block:hover {
    color: #fff !important;
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0;
}
</style>
<script>
function redirectToempList() {
    window.location = "empList.jsp";
}
</script>
</head>
<body>
<div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
            <div class="card">
                <h5 class="text-center mb-4">Edit Employee</h5>
                <form class="form-card" id="employee-form">
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3" for="empId">Select an Employee ID:</label>
                            <select class="form-control" id="empId" onchange="getEmpDetailsById(this.value);">
                                <% for (long id : empIdList) { %>
                                    <option value="<%= id %>"><%= id %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3" for="userName">Name:</label>
                            <input type="text" class="form-control" id="userName" name="userName">
                        </div>
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3" for="password">Password:</label>
                            <input type="text" class="form-control" id="password" name="password">
                        </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3" for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3" for="designation">Designation:</label>
                            <input type="text" class="form-control" id="designation" name="role">
                        </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3" for="salary">Salary:</label>
                            <input type="text" class="form-control" id="salary" name="salary">
                        </div>
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3" for="number">Mobile Number:</label>
                            <input type="text" class="form-control" id="number" name="number">
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="form-group col-sm-3">
                            <button type="button" class="btn btn-primary btn-block" onclick="updateEmp();">Update</button>
                        </div>
                        <div class="form-group col-sm-3">
                            <button type="button" class="btn btn-danger btn-block" onclick="deleteEmp();">Delete</button>
                        </div>
                        <div class="form-group col-sm-3">
                            <button type="button" class="btn btn-secondary btn-block" onclick="redirectToempList();">Back</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS and jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
