<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/bootstrap.min.css"> -->
<meta charset="utf-8">
<script type="text/javascript" src="/Fertilizer/staticContent/js/categoryDetails.js"></script>
</head>
		 	<div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("categoryDetails") %> <%}%> <%if(abc.equals("english")){%>Category Details<%}%> </h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
	<div class="container col-sm-offset-2" >
        <form class="form-horizontal" method="post" action="" name="catd"> <!-- Value of 'name' attribute is used in categoryDetails.js  -->
          <fieldset>
			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div>
			 <div class="row form-group">
           		<label class="col-md-offset-2  col-md-3  control-label" for="categoryName"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("catName") %> <%}%> <%if(abc.equals("english")){%>Category Name<%}%><sup>*</sup></label>  
           	 		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-list-alt"></i>
							</span>
              					<input id="categoryName" name="categoryName" placeholder="Category Name" class="form-control input-md" type="text" >
            			</div>
           		 	</div>
				</div>
				
				<div class="form-group row">
		            <div class="col-md-10 text-center">
		           <!--  "catDetails()" function is implemented in categoryDetails.js -->
		           	
		           	<input style=" height: 65px; width: 180; font-size: 25" type="button" id="save" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick="catDetails()" value="Submit">
		            <input style=" height: 65px; width: 180; font-size: 25" type="reset" style="font-size: 25" class="btn btn-large btn-danger  button-height-width" id="save" name="btn" value="Cancel" onclick="reset()">
		     
		       <%--  <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="catDetails()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("submit") %> <%}%> <%if(abc.equals("english")){%>Submit<%}%></h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("cancel") %> <%}%> <%if(abc.equals("english")){%>Cancel<%}%> </h4> </button>
 --%>

		            </div>
         </div>
		</fieldset>
       </form>
     </div>
     
     <%@include file="commons/newFooter.jsp" %>
     
<%-- <%@include file="commons/footer.jsp" %> --%>
				