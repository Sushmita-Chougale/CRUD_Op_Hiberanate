<!DOCTYPE html>
<html lang="en">
<head>
<style>
.box{
margin-left: 200px;

}
.container{
width:100px;
background:#f7e6ff;
color: black;
align-items: center;
margin-top:150px;
padding:30px;
}
.form-group input{
border-radius:40px;
border:1px solid black;
color:black;
}
</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sign up Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/Login/js/view.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" >
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!-- Centered Heading -->
                <h2 class="text-center">Sign Up</h2>
                    <div class="form-group">
                        <label for="userName">User Name:  <i class="fa-solid fa-user"></i></label>
                        <input type="text" class="form-control" id="userName" name="userName" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password:  <i class="fa-solid fa-lock"></i></label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>

                    <div class="text-center">
                 	<button type="button" class="btn btn-success" onclick="signup()">Submit</button>
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
