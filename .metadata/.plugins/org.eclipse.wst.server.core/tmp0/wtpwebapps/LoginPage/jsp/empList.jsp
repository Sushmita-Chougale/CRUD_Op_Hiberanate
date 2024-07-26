<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.login.dao.EmpDao"%>
<%@ page import="com.login.hibernate.Employee"%>
<%@ page import="java.util.List"%>
<%@include file="nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    padding: 50px;
    justify-content: center;
    align-items: center;
}
.table {
    margin-bottom: 100px;
}
.mb-4 {
    margin-right: 30px;
}
.box {
    padding: 0;
    position: absolute;
    left: 90%;
}
.btn-lg-custom {
    padding: 15px 30px;
    font-size: 18px;
}
.search-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}
.input-group {
    width: 300px;
    position: relative;
}
.input-group input {
    padding-right: 40px;
}
.input-group .input-group-append {
    position: absolute;
    right: 0;
    top: 0;
    height: 100%;
}
.input-group .btn {
    height: 100%;
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
}
.container {
    margin-top: 20px;
}
.btn:hover {
    color: #fff;
}
.input-text:focus {
    box-shadow: 0px 0px 0px;
    border-color: #f8c146;
    outline: 0px;
}
.form-control {
    border: 1px solid #f8c146;
}
.input-group-append #search {
    height: 38px;
    width: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>
<script type="text/javascript">
    function redirectToupdateEmp() {
        window.location = "editEmp.jsp";
    }
    function redirectTosignup() {
        window.location = "employeeDetails.jsp";
    }
    function searchTable() {
        var input, filter, table, tr, td, i, j, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("empTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            tr[i].style.display = "none";
            td = tr[i].getElementsByTagName("td");
            for (j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break;
                    }
                }
            }
        }
    }
</script>
</head>
<body>
    <h1>Employee List</h1>
    <div class="search-container">
        <button class="btn btn-primary btn-lg-custom" onclick="redirectTosignup();">ADD</button>
        <div class="input-group">
            <input type="text" id="myInput" class="form-control" onkeyup="searchTable()" placeholder="Search for employees...">
            <div class="input-group-append">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
            </div>
        </div>
    </div>

    <table id="empTable" class="table table-striped table-bordered mt-4">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>User Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Designation</th>
                <th>Salary</th>
                <th>Mobile Number</th>
            </tr>
        </thead>
        <tbody>
            <%
                EmpDao empDao = new EmpDao();
                List<Employee> empList = empDao.getAllEmpDetails();
                if (empList != null && !empList.isEmpty()) {
                    for (Employee emp : empList) {
            %>
            <tr>
                <td><label id="empId"><%= emp.getId() %></label></td>
                <td><label id="nameId"><%= emp.getuserName() %></label></td>
                <td><label id="passId"><%= emp.getPassword() %></label></td>
                <td><label id="mailId"><%= emp.getEmail() %></label></td>
                <td><label id="desId"><%= emp.getDesignation() %></label></td>
                <td><label id="salId"><%= emp.getSalary() %></label></td>
                <td><label id="numId"><%= emp.getNumber() %></label></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7">No employees found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <div class="box">
        <button class="btn btn-primary btn-lg-custom" onclick="redirectToupdateEmp();">Edit</button>
    </div>
    <!-- Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
