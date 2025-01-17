<%@page import="com.Fertilizer.bean.StockDetail"%>
<%@page import="com.Fertilizer.hibernate.Stock"%>
<%@page import="com.Fertilizer.hibernate.GodownEntry"%>
<%@page import="com.Fertilizer.dao.GodownEntryDao"%>
<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
<script src="/Fertilizer/staticContent/js/stockDetails.js"></script>
<script src="/Fertilizer/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/Fertilizer/staticContent/js/selectjj.js"></script>
<script type="text/javascript" src="/Fertilizer/staticContent/js/buttom.js"></script>
<script src="/Fertilizer/staticContent/js/jquery.min.js"></script>
<script src="/Fertilizer/staticContent/js/jquery.jqgrid.min.js"></script>
<script src="/Fertilizer/staticContent/js/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript" src="/Fertilizer/staticContent/js/jqueryUi.js"></script>

<link href="/Fertilizer/WebContent/staticContent/css/dataTa.css" rel="stylesheet" type="text/css" media="all" />
<link href="/Fertilizer/staticContent/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css" media="all">
<link href="/Fertilizer/staticContent/css/select.css" rel="stylesheet" type="text/css" media="all">
<link href="/Fertilizer/staticContent/css/button.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="/Fertilizer/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.min.css">

<script type="text/javascript">
function openBilling() {
		 window.location = '/Fertilizer/jsp/Billing.jsp';
}

</script>


</head>

<body onload="getProductName()">
<div class="container col-md-offset-1" style="float: left"> 
 		
 		<div class="row">
			<div align="center" style="margin-top: 75px">
				  <h2 class="form-name style_heading">Stock Reports</h2>
			</div>
				 	
			 <div class="row">
				<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color:#c1b1b1;">
				</div>	
			  </div>
		</div>

		<ul class="nav nav-tabs">
	   <li class="active"><a data-toggle="tab" href="#cat"><h4 style="color:blue">Category Wise</h4></a></li>
	    <li ><a data-toggle="tab" href="#productName"><h4 style="color:blue">Product Wise</h4></a></li>
	    <li><a data-toggle="tab" href="#companyName"><h4 style="color:blue">Company Wise</h4></a></li>
	     <li><a data-toggle="tab" href="#dateWise"><h4 style="color:blue">Date Wise</h4></a></li>
	    <!-- <li><a data-toggle="tab" href="#godown"><h4 style="color:blue">Godown Wise</h4></a></li> -->
 	 </ul>
 
 	<div class="tab-content" style="float: left">
   
    <!-------- Category Wise ---------->
   
    	<div id="cat" class="tab-pane fade in active">
    		<div class="row"></div>
 		
 				<form class="form-horizontal" method="post" action="" name="fertiBill">
					<fieldset>
				         <div class="row form-group" style="margin-top: 20px">
								<label class="col-md-2 control-label" for="fk_cat_id">Product Category<sup>*</sup></label>  
			           			 <div class="col-md-3">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="	glyphicon glyphicon-hand-right"></i>
										</span>
			              				
										<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
										<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
										<%
										   CategoryDetailsDao cdd = new CategoryDetailsDao();
			           						List cList =cdd.getAllMainCat();
										
										%>
										<input list="cat_drop" id="fk_cat_id"  class="form-control">
							<datalist id="cat_drop">
										<%
								           for(int i=0;i<cList.size();i++){
								        	   CategoryDetailsBean cat=(CategoryDetailsBean)cList.get(i);
										%>
					
										<option data-value="<%=cat.getCatId()%>" value="<%=cat.getCategoryName()%>">
										<%
							      			}
							    		%>
						              	
			            			</datalist>
			            			</div>
            					</div> 
			
					  
				     <div class="col-md-3">
						<div class="input-group">
												  
								<input type="button"  id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="StockDetailsReportAsPerCat()" value="Search"/>
												     									
						</div>
					</div>	
				</div>		
						<table id="stockByCat" class="display">
						<thead>
							<tr>
								<th>Product Name</th>
								<th>Company Name</th>
								<th>Packing</th>
								<th>Batch Number</th>
								<th>Quantity</th>
							
							</tr>
						</thead>
						<tfoot>
							<tr>
								  <th colspan="4" style="text-align: right">Total Quantity:</th>
								<th></th> 
							</tr>
						</tfoot>
					</table>
					<div class="row form-group buttons_margin_top ">
								<div align="center">
								<input type="button" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick="openBilling()" value="Back To Billing">	
								</div>
					</div>
				</fieldset>
				</form>
    	</div> 
    	
    	<!-------- Product Name Wise ---------->
    	
    	<div id="productName" class="tab-pane ">
    	<div class="row"></div>
 		
 				<form class="form-horizontal" method="post" action="" name="fertiBill">
					<fieldset>
				         <div class="row form-group" style="margin-top: 20px">
								<label class="col-md-2 control-label" for="fk_godown_id">Select Product<sup>*</sup></label>  
           			 <div class="col-md-6">
						<div class="input-group">
						
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
									<select class="form-control" id='proName'   name="proName"  >
									</select>
            			</div>
            		</div> 
			
					  
				     <div class="col-md-3">
						<div class="input-group">
												  
								<input type="button"  id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="StockDetailsReportAsPerProductName()" value="Search"/>
												     									
						</div>
					</div>	
				</div>		
						<table id="productTable" class="display">
						<thead>
							<tr>
								<th>Product Name</th>
								<th>Company Name</th>
								<th>Packing</th>
								<th>Quantity</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								  <th colspan="3" style="text-align: right">Total Quantity:</th>
								<th></th> 
							</tr>
						</tfoot>
					</table>
					<div class="row form-group buttons_margin_top ">
								<div align="center">
								<input type="button" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick="openBilling()" value="Back To Billing">	
								</div>
					</div>
				</fieldset>
				</form>
    	
    	</div>
    	
    	
    	<!-------- Company Name Wise ---------->
    	
    	<div id="companyName" class="tab-pane">
    	<div class="row"></div>
 		
 				<form class="form-horizontal" method="post" action="" name="fertiBill">
					<fieldset>
				         <div class="row form-group" style="margin-top: 20px">
								<label class="col-md-2 control-label" for="fk_godown_id">Select Company<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
						
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
							
							<%
							   CategoryDetailsDao cdDAO = new CategoryDetailsDao();
           						List<Stock> companyName =cdDAO.getCompanyNames();
							
							%>
							<input list="company_drop" id="company_name"  class="form-control" >
				<datalist id="company_drop">
							<%
					           for(int i=0;i<companyName.size();i++){
					        	   Stock com = (Stock)companyName.get(i);
							%>
		
							<option data-value="<%=com.getCompanyName()%>" value="<%=com.getCompanyName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div> 
			
					  
				     <div class="col-md-3">
						<div class="input-group">
												  
								<input type="button"  id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="StockDetailsReportAsPerCompanyName()" value="Search"/>
												     									
						</div>
					</div>	
				</div>		
						<table id="companyWiseTable" class="display">
						<thead>
							<tr>
								<th>Product Name</th>
								<th>Company Name</th>
								<th>Packing</th>
								<th>Quantity</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								  <th colspan="3" style="text-align: right">Total Quantity:</th>
								<th></th> 
							</tr>
						</tfoot>
					</table>
					<div class="row form-group buttons_margin_top ">
								<div align="center">
								<input type="button" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick="openBilling()" value="Back To Billing">	
								</div>
					</div>
				</fieldset>
				</form>
    	
    	</div>
    	
    	
    <!-- 	Date Wise stock -->
    	<div id="dateWise" class="tab-pane">
    	<div class="row"></div>
 		
 				<form class="form-horizontal" method="post" action="" name="fertiBill">
					<fieldset>
				        <div class="row form-group" style="margin-top: 20px">
						<label class="col-md-3 control-label" for="">
							Enter Date:<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input type="date" id="firstDate" placeholder="Start Date"
									class="form-control input-md" type="text">
							</div>
						</div>
			
			
						<div class="col-md-3">
							<div class="input-group">
								<input type="button" id="btn" name="save"
									class="btn btn-lg btn-success btn-md button_hw button_margin_right"
									onclick="dateWiseStock()" value="Search" />
							</div>
						</div>
					</div>
						<table id="dateWiseStockTable" class="display">
						<thead>
							<tr>
								<th>Product Name</th>
								<th>Company Name</th>
								<th>Packing</th>
								<th>Batch Number</th>
								<th>Quantity</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								  <th colspan="4" style="text-align: right">Total Quantity:</th>
								<th></th> 
							</tr>
						</tfoot>
					</table>
					<div class="row form-group buttons_margin_top ">
								<div align="center">
								<input type="button" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick="openBilling()" value="Back To Billing">	
								</div>
					</div>
				</fieldset>
				</form>
    	
    	</div>
    	
    <!-------- Godown Wise ---------->
    	<%-- <div id="godown" class="tab-pane">
    	<div class="row"></div>
 		
 				<form class="form-horizontal" method="post" action="" name="fertiBill">
					<fieldset>
				         <div class="row form-group" style="margin-top: 20px">
								<label class="col-md-2 control-label" for="fk_godown_id">Select Godown<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							   GodownEntryDao cdd1 = new GodownEntryDao();
           						List cList1 =cdd1.getAllGodown();
							
							%>
							<input list="godown_drop" id="fk_godown_id"  class="form-control" >
				<datalist id="godown_drop">
							<%
					           for(int i=0;i<cList1.size();i++){
					        	   GodownEntry cat=(GodownEntry)cList1.get(i);
							%>
		
							<option data-value="<%=cat.getPkGodownId()%>" value="<%=cat.getGodownName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div> 
			
					  
				     <div class="col-md-3">
						<div class="input-group">
												  
								<input type="button"  id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="StockDetailsReportAsPerGodown()" value="Search"/>
												     									
						</div>
					</div>	
				</div>		
						<table id="stockByGodown" class="display">
						<thead>
							<tr>
								<th>Category Name</th>
								<th>Product Name</th>
								<th>Stock</th>
								<th>Batch Number</th>
							
							</tr>
						</thead>
						
					</table>
					<div class="row form-group buttons_margin_top ">
								<div align="center">
								<input type="button" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick="openBilling()" value="Back To Billing">	
								</div>
					</div>
				</fieldset>
				</form>
    	
    	</div> --%>
    	
    </div>
   </div>
    <%@include file="commons/newFooter.jsp" %>tml>
   </body>