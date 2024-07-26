<%@page import="com.sun.org.apache.xpath.internal.operations.Div"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.login.dao.EmpDao"%>
<%@page import="com.login.helper.EmpHelper"%>
<%@page import="com.login.hibernate.Employee"%>
<%@include file="nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
<link
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    rel="stylesheet">
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
<script src="/LoginPage/js/view.js"></script>
<!-- Custom CSS -->
<style>
body {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-image: url("https://mdbootstrap.com/img/new/fluid/city/018.jpg");
    background-repeat: no-repeat;
    background-size: 100% 100%
}

.card {
    padding: 30px 40px;
    margin-top: 60px;
    margin-bottom: 60px;
    border: none !important;
    box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2)
}

.blue-text {
    color: #00BCD4
}

.form-control-label {
    margin-bottom: 0
}

input, textarea, button {
    padding: 8px 15px;
    border-radius: 5px !important;
    margin: 5px 0px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    font-size: 18px !important;
    font-weight: 300
}

input:focus, textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #00BCD4;
    outline-width: 0;
    font-weight: 400
}

.btn-block {
    text-transform: uppercase;
    font-size: 15px !important;
    font-weight: 400;
    height: 43px;
    cursor: pointer
}

.btn-block:hover {
    color: #fff !important
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0
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
                <h5 class="text-center mb-4">Registration Form</h5>
                <form class="form-card">
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3">User Name<span class="text-danger"> *</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="bi bi-person"></i></span>
                                </div>
                                <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter your name" onblur="validate(1)">
                            </div>
                        </div>
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3">Password<span class="text-danger"> *</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                </div>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" onblur="validate(2)">
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3">Email<span class="text-danger"> *</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                </div>
                                <input type="text" class="form-control" id="email" name="email" placeholder="Enter your email" onblur="validate(3)">
                            </div>
                        </div>
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3">Phone number<span class="text-danger"> *</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                                </div>
                                <input type="text" class="form-control" id="mob" name="mob" placeholder="Enter your phone number" onblur="validate(4)">
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3">Job title<span class="text-danger"> *</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="bi bi-briefcase"></i></span>
                                </div>
                                <input type="text" class="form-control" id="job" name="job" placeholder="Enter your job title" onblur="validate(5)">
                            </div>
                        </div>
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3">Salary<span class="text-danger"> *</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                                </div>
                                <input type="text" class="form-control" id="salary" name="salary" placeholder="Enter your salary" onblur="validate(6)">
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-end">
                        <div class="form-group col-sm-6">
                            <button type="submit" class="btn-block btn-primary" onclick="signup();">Sign Up</button>
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
<script>
    function signup() {
        // Your signup logic here
    }
</script>
</body>
</html>
