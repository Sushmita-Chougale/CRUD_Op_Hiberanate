<%@page import="com.Fertilizer.bean.SaleReports"%>
<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
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

<!-- For datatable to pdf,print,excel etc conversion -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>

<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">




<!-- For datatable to pdf,print,excel etc conversion -->
<!--  <script src="/Fertilizer/staticContent/js/jquery-1.12.3.min.js"></script>
 <script type="text/javascript" src="/Fertilizer/staticContent/datatable_To_Other_File/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Fertilizer/staticContent/datatable_To_Other_File/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="/Fertilizer/staticContent/datatable_To_Other_File/buttons.flash.min.js"></script>
<script type="text/javascript" src="/Fertilizer/staticContent/datatable_To_Other_File/jszip.min.js"></script>
<script type="text/javascript" src="/Fertilizer/staticContent/datatable_To_Other_File/pdfmake.min.js"></script>

<script type="text/javascript" src="/Fertilizer/staticContent/datatable_To_Other_File/vfs_fonts.js"></script>
<script type="text/javascript" src="/Fertilizer/staticContent/datatable_To_Other_File/buttons.html5.min.js"></script>
<script type="text/javascript" src="/Fertilizer/staticContent/datatable_To_Other_File/buttons.print.min.js"></script>
<link rel="stylesheet" href="/Fertilizer/staticContent/datatable_To_Other_File/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="/Fertilizer/staticContent/datatable_To_Other_File/buttons.dataTables.min.css">  -->
<!-- <script src="/Fertilizer/staticContent/js/goodsReceive.js"></script>
   <script type="text/javascript" src="/Fertilizer/staticContent/js/podetails.js"></script> -->
</head>


 <div class="container col-md-offset-1" style="float: left"> 
 		
 		<div class="row">
			<div align="center" style="margin-top: 75px">
				  <h2 class="form-name style_heading">Low Stock Products</h2>
			</div>
				 	
			 <div class="row">
				<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color:#c1b1b1;">
				</div>	
			  </div>
			  
		</div>
	<div class="row " id="report" style="text-align: center">
		<label id="demo" class="col-md-offset-7"></label>
		<script>
		   var date = new Date();
		   document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>
		<!-- <ul class="nav nav-tabs">
	    		<li class="active"><a data-toggle="tab" href="#seed"><h4 style="color:blue">Seed</h4></a></li>
			    <li><a data-toggle="tab" href="#pesti"><h4 style="color:blue">Pesticide</h4></a></li>
			    <li><a data-toggle="tab" href="#ferti"><h4 style="color:blue">Fertilizer</h4></a></li>
 	 </ul> 
 
 	<div class="tab-content" style="float: left">
   
   
    	<div id="seed" class="tab-pane fade in active">-->
    	<div class="row"></div>
				<%
										GoodsReceiveDao productForNotificationForSeed = new GoodsReceiveDao();
			           						List<GoodsReceiveDetail> notificationProducts1 =productForNotificationForSeed.getAllSeedAndPestiForStockNotification();
										
										%>
										
										<table class="display col-md-offset-2" border="1">
											<tr style="font-size: 25;">
											<th>Product Name</th>
											<th>Company Name</th>
											<th>Weight</th>
											<th>Batch Number</th>
											<th>Stock</th>
											
											</tr>
										<%
								           for(int i=0;i<notificationProducts1.size();i++){
								        	   GoodsReceiveDetail goodsForNotification1 =(GoodsReceiveDetail)notificationProducts1.get(i);
										%>
										<tr style="color: black;">
										<td style="font-size: 22;"><%=goodsForNotification1.getProductName()%></td>
										<td style="font-size: 22;"><%=goodsForNotification1.getCompany()%></td>
										<td style="font-size: 22;"><%=goodsForNotification1.getWeight()%></td>
										<td style="font-size: 22;"><%=goodsForNotification1.getBatchNumber() %></td>
										<td style="font-size: 22;"><%=goodsForNotification1.getStock() %></td>
										
										<%
										}
							    		%>
							    		
							    		</tr>
							    		</table>
            
  <!--           
            <div style= "text-align: center" class="modal-footer">
            <button type="button" class="btn btn-default btn-custom"
               data-dismiss="modal">
            Ignore
            </button>
             <button type="button" class="btn btn-primary" onclick="openAdvanceBooking()">
            Place Order
            </button>
           
           <script type="text/javascript">
           function openAdvanceBooking(){
        	 location.replace("/Fertilizer/jsp/purchaseOrderDetails.jsp");
           }
           
           </script> 
           
         </div> -->
      </div>
      <%--  <%@include file="commons/newFooter.jsp" %>tml> --%>
 		
 <!-- ---	Between Two Dates	---- -->
 	<%-- 	<div id="pesti" class="tab-pane fade">
 		<div class="row"></div>
				<%
										GoodsReceiveDao productForNotificationForferti = new GoodsReceiveDao();
			           						List<GoodsReceiveDetail> notificationProducts2 =productForNotificationForferti.getPestiStockForStockNotification();
										
										%>
										
										<table border="1">
											<tr style="font-size: 25;">
											<th>Product Name</th>
											<th>Company Name</th>
											<th>Weight</th>
											<th>Batch Number</th>
											<th>Stock</th>
											</tr>
										<%
								           for(int i=0;i<notificationProducts2.size();i++){
								        	   GoodsReceiveDetail goodsForNotification2 =(GoodsReceiveDetail)notificationProducts2.get(i);
										%>
										<tr style="font-size: 22; color: black;">
										<td ><%=goodsForNotification2.getProductName()%></td>
										<td><%=goodsForNotification2.getCompany()%></td>
										<td><%=goodsForNotification2.getWeight()%></td>
										<td><%=goodsForNotification2.getBatchNumber() %></td>
										<td><%=goodsForNotification2.getStock() %></td>
										<%
										}
							    		%>
							    		</tr>
							    		</table>
            
            
    <!--         <div style= "text-align: center" class="modal-footer">
            <button type="button" class="btn btn-default btn-custom"
               data-dismiss="modal">
            Ignore
            </button>
             <button type="button" class="btn btn-primary" onclick="openAdvanceBooking()">
            Place Order
            </button>
           
           <script type="text/javascript">
           function openAdvanceBooking(){
        	 location.replace("/Fertilizer/jsp/purchaseOrderDetails.jsp");
           }
           
           </script> 
           
         </div> -->
      </div>
    
 		
<!------  	Product wise ------->
 		 <div id="ferti" class="tab-pane fade">
 		 <div class="row"></div>
				<%
										GoodsReceiveDao productForNotificationForferti2 = new GoodsReceiveDao();
			           						List<GoodsReceiveDetail> notificationProducts3 =productForNotificationForferti2.getAllFertilizerForStockNotification();
										
										%>
										
										<table border="1">
											<tr style="font-size: 25; ">
											<th>Product Name</th>
											<th>Company Name</th>
											<th>Weight</th>
											<th>Stock</th>
											</tr>
										<%
								           for(int i=0;i<notificationProducts3.size();i++){
								        	   GoodsReceiveDetail goodsForNotificationFerti =(GoodsReceiveDetail)notificationProducts3.get(i);
										%>
										<tr style="font-size: 22; color: black;">
										<td><%=goodsForNotificationFerti.getProductName()%></td>
										<td><%=goodsForNotificationFerti.getCompany()%></td>
										<td><%=goodsForNotificationFerti.getWeight()%></td>
										<td><%=goodsForNotificationFerti.getStock() %></td>
										<%
										}
							    		%>
							    		
							    		</tr>
							    		</table>
            
    <!--         
            <div style= "text-align: center" class="modal-footer">
            <button type="button" class="btn btn-default btn-custom"
               data-dismiss="modal">
            Ignore
            </button>
             <button type="button" class="btn btn-primary" onclick="openAdvanceBooking()">
            Place Order
            </button>
           
           <script type="text/javascript">
           function openAdvanceBooking(){
        	 location.replace("/Fertilizer/jsp/purchaseOrderDetails.jsp");
           }
           
           </script> 
           
         </div> -->
      </div>
     

 </div>
</div>

 --%>