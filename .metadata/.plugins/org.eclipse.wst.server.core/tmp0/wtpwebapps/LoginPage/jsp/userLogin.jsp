<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/LoginPage/js/view.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
    <script>
        function redirectTosignup() {
            window.open("/LoginPage/jsp/employeeDetails.jsp")
        }
    </script>
    <style>
        body {
            background-image: url('https://mdbootstrap.com/img/new/standard/nature/111.jpg'); 
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            font-family: 'Arial', sans-serif;
            color: #333;
        }
        .container {
            max-width: 500px;
            background:  transparent;
            border:2px solid rgba(255,255,255, .2);
            backdrop-filter:blur(10px);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
        }
        .form-control {
            border-radius: 25px;
            padding: 10px 20px;
            border: 1px solid #ced4da;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn {
            border-radius: 25px;
            padding: 10px 20px;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn:hover {
            opacity: 0.9;
        }
        .text-center {
            margin-bottom: 30px;
        }
        .button-text {
            display: flex;
            align-items: center;
        }
        .text {
            margin-left: 10px;
        }
        .box {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
        
    </style>
</head>
<body>

    <div class="container">
       
        <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span class="h1 fw-bold mb-0">Login</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
        <div class="form-group">
            <label for="username">User Name: <i class="fa-solid fa-user"></i></label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password: <i class="fa-solid fa-lock"></i></label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="pt-1 mb-4">
                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg btn-block" type="button"class="btn btn-success" onclick="login();">Login</button>
                  </div>
        <p class="mb-5 pb-lg-2" style="color: black;">Don't have an account? <a href="#!"
                      style="color: #393f81;"onclick="redirectTosignup();">Register here</a></p>
        </div>
    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
