<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/Login/js/view.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" >
</head>
<script>
	function redirectTosignup() {
		window.open("/Login/jsp/userSignup.jsp")
	}
</script>
<style>
.box{
margin-left: 200px;

}
.form-group input{
border-radius:40px;
border:1px solid black;
color:black;
}
.container{
width:800px;
background:#f7e6ff;
color: black;
align-items: center;
margin-top:150px;
padding:30px
}
.btn{
cursur:pointer;
}
</style>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!-- Centered Heading -->
                <h1 class="text-center">Login</h1>
                    <div class="form-group">
                    
                        <label for="userName">User Name: <i class="fa-solid fa-user"></i></label>
                        
                        <input type="text" class="form-control" id="userName" name="userName"  required>
                        
                    </div>

                    <div class="form-group">
                        <label for="password">Password:  <i class="fa-solid fa-lock"></i></label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
					<div>
					<button type="button" class="btn btn-success" onclick="login();">Login</button>
					
					</div>
					
                    <div class="box">
                 	<p>Don't have an account?</p>
                 	<button type="button" class="btn btn-primary" onclick="redirectTosignup();">Sign up</button>
                  	</div>
                </form>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
