<%@ page contentType="text/html; charset=utf-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<%@page import="com.Fertilizer.utility.PropertiesHelper"%>
<div class="row col-xs-12" align="center">
       <!--  <div class="text-center center-block"> -->
       <div class="social-network social-circle">
       
       <!-- Calculator code -->
   <%--  <script>
   function calci(){
   <% Runtime r = Runtime.getRuntime();
   r.exec("calc");
   %>
   }
   </script> --%> 
       <!-- To toggle between marathi and english version -->

 <% 
   String abc1 = "english";
   if (session != null) {
   
   if (session.getAttribute("lan") != null) {
	   abc1 = (String) session.getAttribute("lan");
   }}
   else{
	   abc1="english";
   }
 %> 
 
      			<a href="http://localhost:8080/Fertilizer/jsp/calculator.jsp"  data-toggle="tooltip" title="Calculator" target="_blank"> <i class="fa fa-calculator fa-3x social"></i> </a> 
              	<!--  <button data-toggle="tooltip" title="Calculator" Onclick="calci()"><i class="fa fa-calculator fa-3x social"></i></button>  -->
              	<a href="https://accounts.google.com/ServiceLogin?service=mail&continue=https://mail.google.com/mail/#identifier"  data-toggle="tooltip" title="Gmail" target="_blank"><i id="social-gp" class="fa fa-envelope fa-3x social"></i></a>
              	<a href="https://www.google.co.in/" data-toggle="tooltip" title="Google Search" target="_blank"><i class="fa fa-google fa-3x social" ></i></a>
                <a href="https://www.facebook.com/"  data-toggle="tooltip" target="_blank" title="Facebook"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
	            <a href="https://twitter.com/"  data-toggle="tooltip" title="Twitter" target="_blank"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
	            <a href="https://www.youtube.com/"  data-toggle="tooltip" title="YouTube" target="_blank"> <i class="fa fa-youtube-square fa-3x social"></i></a>
				<a href="http://www.agrowon.com/Agrowon/index.htm" data-toggle="tooltip" title="Sakal Agrow-one" target="_blank"><i class="fa fa-newspaper-o fa-3x social"></i></a>
			</div>
				
			 <div class="row col-xs-12" align="center">
				<h3 align="center" class="glyphicon glyphicon-copyright-mark"><%if(abc1.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("Embel") %> <%}%> <%if(abc1.equals("english")){%>Embel Technologies Pvt Ltd<%}%></h3>
			</div>
	</div>

