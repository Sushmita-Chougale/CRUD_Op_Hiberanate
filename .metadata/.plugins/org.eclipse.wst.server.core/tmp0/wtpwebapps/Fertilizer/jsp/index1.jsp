<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="org.hibernate.Session"%>
<%@page import="com.Fertilizer.utility.HibernateUtility"%>
<%@page import="com.Fertilizer.hibernate.UserDetailsBean"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.0.4/js/bootstrap-alert.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> -->
    <title>Dash Board</title>
    <!-- Bootstrap Core CSS -->
  <!--   <link href="/Fertilizer/staticContent/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="/Fertilizer/staticContent/css/dashboard.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="/Fertilizer/staticContent/css/sb-admin-2.css" rel="stylesheet">
    
    <!-- Morris Charts CSS -->
    <link href="/Fertilizer/staticContent/css/morris.css" rel="stylesheet">
    
     <!-- MetisMenu CSS -->
    <link href="/Fertilizer/staticContent/css/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="/Fertilizer/staticContent/css/timeline.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/Fertilizer/staticContent/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
	<!-- jQuery -->
   <!--  <script src="/Fertilizer/staticContent/js/jquery.min.js"></script>
 -->
    <!-- Bootstrap Core JavaScript -->
  <!--   <script src="/Fertilizer/staticContent/js/bootstrap.min.js"></script> -->

    <!-- Custom Theme JavaScript -->
    <script src="/Fertilizer/staticContent/js/sb-admin-2.js"></script>
    
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/Fertilizer/staticContent/js/metisMenu.min.js"></script>
    
    <!-- Morris Charts JavaScript -->
    <script src="/Fertilizer/staticContent/js/raphael-min.js"></script>
    <script src="/Fertilizer/staticContent/js/morris.min.js"></script>
    <script src="/Fertilizer/staticContent/js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/Fertilizer/staticContent/js/sb-admin-2.js"></script>
    <script src="/Fertilizer/staticContent/js/logout.js"></script>
    
    <script src="/Fertilizer/staticContent/js/graph.js"></script>
<script src="/Fertilizer/staticContent/js/jquery-1.12.3.min.js"></script>
<script src="/Fertilizer/staticContent/js/highcharts.js"></script>
<script src="/Fertilizer/staticContent/js/exporting.js"></script>

<!-- Bootstrap core CSS -->
  <!--   <link href="/Fertilizer/WebContent/staticContent/assets/css/bootstrap.css" rel="stylesheet"> -->
    <!--external css-->
    <link href="/Fertilizer/WebContent/staticContent/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="/Fertilizer/WebContent/staticContent/assets/css/style.css" rel="stylesheet">
    <link href="/Fertilizer/WebContent/staticContent/assets/css/style-responsive.css" rel="stylesheet">

    <script src="/Fertilizer/staticContent/assets/js/chart-master/Chart.js"></script>
    
    <!-- Bootstrap core CSS -->
   <!--  <link href="/Fertilizer/staticContent/assets/css/bootstrap.css" rel="stylesheet"> -->
    <!--external css-->
   <!--  <link href="/Fertilizer/staticContent/assets/font-awesome/css/font-awesome.css" rel="stylesheet" /> -->
    
    
    <!-- Custom styles for this template -->
  <link href="/Fertilizer/staticContent/assets/css/style.css" rel="stylesheet">
    <link href="/Fertilizer/staticContent/assets/css/style-responsive.css" rel="stylesheet">

    <script src="/Fertilizer/staticContent/assets/js/chart-master/Chart.js"></script>
    
    
  
  <style>
.alert {
    padding: 20px;
    background-color: #f44336;
    color: white;
}

.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: black;
}
</style>
</head>
	
	<div class="row">
		<div class="col-md-10">
		<marquee direction="left" onmouseover="this.stop();" onmouseout="this.start();" >
		<font color="crimson" style="font-size: 25px;"> Dudulwar Agencies </font> </marquee>
		</div>
			<div id="report">
				<label id="demo"></label>
				<script>
				   var date = new Date();
			   	document.getElementById("demo").innerHTML = date.toDateString();;
				</script>
			</div>
		
	</div>
<body onload="pageLoad()">	
    <div id="wrapper">
  
 <%--  <% String type1= "";
                     String name1 = "";
		             if (session != null) {
			
			         if (session.getAttribute("user") != null) {
				     name1 = (String) session.getAttribute("user");
				    
			            
	            	  
		              HibernateUtility hbu1=HibernateUtility.getInstance();
		              Session session2=hbu1.getHibernateSession();
		   
		              org.hibernate.Query query1 = session2.createQuery("from UserDetailsBean where userName =:usr");
		              query1.setParameter("usr", name1);
		              UserDetailsBean userDetail1 = (UserDetailsBean) query1.uniqueResult();
		              type1 = userDetail1.getUserName();
			         } 
			         else {
							
					     response.sendRedirect("/Fertilizer/jsp/login.jsp");
					     out.println("Please Login ");
				        }
			         
		           }
		             else {
							
					     response.sendRedirect("/Fertilizer/jsp/login.jsp");
					     out.println("Please Login ");
				        }
	           %>
   --%>
	
	
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        	
			
			<!-- <div class="wrapper row">
				 <button type="button" class="btn btn-lg btn-md btn-success" onclick="openHome()"> <span class="glyphicon glyphicon-home"></span> Home </button>
            	<button id="blinker" class="btn btn-lg btn-md btn-danger col-md-offset-3" onclick="openNotifications()" >Upcoming Expiry Date Products And Low Stock Products</button>
            	 <button type="button" class="btn btn-lg btn-md btn-danger col-md-offset-2" onclick="Logout()" > <span class="glyphicon glyphicon-off"></span> Logout </button>
			</div> -->
            <!-- /.navbar-header -->

            <div class="navbar-default sidebar container" role="navigation">
                <div class="sidebar-nav navbar-collapse">
				
	 <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion" style="margin-top: 20;">
              
              <li class="col-md-10">
		<marquee direction="left" onmouseover="this.stop();" onmouseout="this.start();" >
		<font color="crimson" style="font-size: 25px;">Om Sai Agro Agencies</font> </marquee>
		</li>
              	  <p class="centered"><img src="/Fertilizer/staticContent/assets/img/3.jpg" class="img-circle" width="60" style="margin-top: 8;"></p>
              	  <h5 class="centered"><b>Quick Links</b></h5>
              	  
                  <li class="sub-menu" style="margin-top: 15;">
                      <a class="active" href="purchaseReports.jsp" >
                          <i class="fa fa-book" style="font-size:25px"></i>
                          <span><font size=3 >Purchase Reports</font></span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="saleReports.jsp" >
                          <i class="fa fa-book" style="font-size:25px"></i>
                          <span><font size=3 >Sale Reports</font></span>
                      </a>
                      
                  </li>
                  <li class="sub-menu">
                      <a href="stockReport.jsp" >
                          <i class="fa fa-book" style="font-size:25px"></i>
                          <span><font size=3 >Stock Reports</font></span>
                      </a>
                      
                  </li>
                  
                  <li class="sub-menu">
                      <a href="dayCloserReportjsp.jsp" >
                          <i class="fa fa-book" style="font-size:25px"></i>
                          <span><font size=3 >Day Closure Reports</font></span>
                      </a>
                      
                  </li>
                  
                  
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
               </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
    
    
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading" align="center">
                           <h2 style="color:crimson">Sales Analysis</h2>  
                        </div>
                        
                         <!-- <ul class="nav nav-tabs col-md-offset-1">
						    <li class="active" onclick="pageLoad()"><a data-toggle="tab" href="#home"><h4 style="color:blue">Fertilizer</h4></a></li>
						    <li onclick="openSeed()"><a data-toggle="tab" href="#twoDates"><h4 style="color:blue">Seed</h4></a></li>
						    <li onclick="openPesti()"><a data-toggle="tab" href="#pro"><h4 style="color:blue">Pesticide</h4></a></li>
						   
 						 </ul> -->
 						 <div class="col-md-offset-1">
 						  <input	class="btn  list-group-item-success" type="button" value="Fertilizer" onclick="pageLoad()" >
						    <input	class="btn  list-group-item-success" type="button" value="Seed" onclick="openSeed()" >
						    <input	class="btn  list-group-item-success" type="button" value="Pesticide" onclick="openPesti()">
 						 </div>
             <script type="text/javascript">
             function pageLoad(){
            		$("#home").show();
            		$("#twoDates").hide(); 
            		$("#pro").hide(); 
            	}
            	function openSeed() {
            		$("#twoDates").show();
            		$("#home").hide();
            		$("#pro").hide();
            	}
            	function openPesti() {
            		$("#pro").show();
            		$("#home").hide();
            		$("#twoDates").hide();
            	}
             </script>           
                        <!-- /.panel-heading -->
                        <div id="home" >
                        <div class="panel-body" align="center">
                            <div class="flot-chart">
                                <div class="flot-chart">
                                	<input	class="btn  list-group-item-success" type="button" value="DayWise Sale" onclick="stock.day();" >
	                              	<input	class="btn  list-group-item-danger" type="button" value="Weekly Sale" onclick="stock.graph();" >
	                              	<input	class="btn  list-group-item-info" type="button" value="Monthly Sale" onclick="stock.month();" >
									<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">
									</div>
                            	</div>
                             </div>
                        </div>
                        </div>
                   <!--      Seed graph   -->
                         <div id="twoDates" >
                          <div class="panel-body" align="center">
                            <div class="flot-chart">
                                <div class="flot-chart">
                                	<input	class="btn  list-group-item-success" type="button" value="DayWise Sale" onclick="seedGraph.day();" >
	                              	<input	class="btn  list-group-item-danger" type="button" value="Weekly Sale" onclick="seedGraph.graph();" >
	                              	<input	class="btn  list-group-item-info" type="button" value="Monthly Sale" onclick="seedGraph.month();" >
									<div id="containerForSeed" style="min-width: 310px; height: 400px; margin: 0 auto">
									</div>
                            	</div>
                             </div>
                        </div>
                         </div>
                   <!--      Pesticide graph   -->
                        <div id="pro" >
                        <div class="panel-body" align="center">
                            <div class="flot-chart">
                                <div class="flot-chart">
                                	<input	class="btn  list-group-item-success" type="button" value="DayWise Sale" onclick="pestiGraph.dayForPesti();" >
	                              	<input	class="btn  list-group-item-danger" type="button" value="Weekly Sale" onclick="pestiGraph.graphForPesti();" >
	                              	<input	class="btn  list-group-item-info" type="button" value="Monthly Sale" onclick="pestiGraph.monthForPesti();" >
									<div id="containerForPesti" style="min-width: 310px; height: 400px; margin: 0 auto">
									</div>
                            	</div>
                             </div>
                        </div>
                        
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw" style="font-size:25px"></i><font size=4><b> Notifications</b></font>
                        </div>
                        
                        <div class="row form-group">
								<button class="dropbtn" onclick="openDayCloserReport()" style="margin-top:10px; margin-left:30px;">Expiry Products</button>
								<button class="dropbtn" onclick="expiryProducts()" style="margin-top:20px; margin-left:30px;">Low Stock</button>
							<!-- <div class="dropdown-content">
						    	<a href="http://localhost:8080/Fertilizer/jsp/DayCloseReport.jsp" >Day Closing Report</a>
							</div> -->
							</div>
						<div class="row form-group" >
						
						
					
							
						
						<script type="text/javascript">
						function openHome(){
							 window.location = '/Fertilizer/jsp/Billing.jsp';
						}
						function openDayCloserReport(){
							 window.location = '/Fertilizer/jsp/upcomimgExpiryDateProductList.jsp';
						}
						
						function openNotifications(){
							 window.location = '/Fertilizer/jsp/notification.jsp';
						}
						function expiryProducts(){
							
							window.location = '/Fertilizer/jsp/lowStockNotification.jsp';
						}
						
                             function game(){
							
							window.location = '/Fertilizer/game.html';
						}
						
						
						</script>		
						</div>		
						
										
				
						</div>
						
						<div class="panel panel-default">
						<div class="panel-heading">
                           <i class="fa fa-handshake-o" style="font-size:25px"></i> <font size=4> <b>Need Help?</b> </font>
                        </div>
						<div class="row form-group">
								<label  style="margin-top:10px; margin-left:30px;"><font size=3> <b>Contact No: +91-8275941044</b></font></label></br>
								<label style="margin-top:20px; margin-left:30px;"><font size=3> <b>Email Id: sumeetbandewar@embel.co.in</b></font></label>
							</div>
						</div>
						
						<div class="panel panel-default">
						<div class="panel-heading">
                           <i class="fa fa-gamepad" style="font-size:25px"></i> <font size=4> <b>Entertainment <a target="_blank" href="http://localhost:8080/Fertilizer/game.html"><font color="Blue">Play Game</font> </a></b> </font>
                        </div>
						
						</div>
                    
                        <!-- /.panel-body -->
                    </div>
                  </div>
            </div>
        </div>
    
<div>
					
					<div class="row" >
					
					<h4 align="center">&copy 2017 Embel Technologies Pvt.Ltd , visit us @ <a target="_blank" href="https://www.embel.co.in"><font color="black">www.embel.co.in</font> </a></h4>
					
					</div>
					</div>	
</body>

</html>



