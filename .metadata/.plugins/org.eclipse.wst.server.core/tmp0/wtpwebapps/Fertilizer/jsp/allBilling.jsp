 
<%@page import="com.Fertilizer.hibernate.ExpenseDetailForBillingAndGoodsReceiveBean"%>
<%@page import="com.Fertilizer.dao.ExpenseDetailForBillingAndGoodsReceiveDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
 <%@page import="com.Fertilizer.dao.CustomerDetailsDao"%>
 <%@page import="com.Fertilizer.dao.FertilizerBillDao"%>
 <%@page import="com.Fertilizer.hibernate.CustomerDetailsBean"%>
 <%@page import="java.util.List"%>
 <%@page import="com.Fertilizer.dao.ProductDetailsDao"%>
 <%@page import="com.Fertilizer.hibernate.ProductDetailsBean"%>
 <%@page import="com.Fertilizer.dao.TaxCreationDao"%>
 <%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
 <%@page import="com.Fertilizer.bean.CustomerBillBean"%>
	<head>
 	 <meta charset="utf-8">
	  <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery-1.12.3.min.js"></script>
	  <link rel="stylesheet" href="/Fertilizer/staticContent/css/shree.css">
	 <link rel="stylesheet" href="/Fertilizer/staticContent/css/jquery-ui.min.css">
     <link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.min.css">
     <link rel="stylesheet" href="/Fertilizer/staticContent/y_css/jquery-ui.css">
     <link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.css">
     <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery.min.js"></script>
     <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery-ui-min.js"></script>
     <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery-ui.js"></script>
     <script type="text/javascript" src="/Fertilizer/staticContent/js/jqueryUi.js"></script>
     <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery.jqgrid.min.js"></script>
    
	  	<script type="text/javascript" src="/Fertilizer/staticContent/js/fertilizerBill.js"></script>
	  	
	  	<script type="text/javascript">
	  	function openStockReport() {
	  		 window.location = '/Fertilizer/jsp/stockReport.jsp';
		}
	  	</script>
	  	<script>
	 /*  	Calculations for cash */
		 function transExpenseAddingToGrossTotal(){
			
			var transExpence = document.getElementById("transExpence").value;
			var hamaliExpence = document.getElementById("hamaliExpence").value;
	
		if(hamaliExpence == ""){
				var total = document.getElementById("totalWithExpense").value;
				var totalWithExpense = Number(total) + Number(transExpence);
				document.getElementById("grossTotal").value = totalWithExpense;
			}	
		
			if(hamaliExpence != ""){
				var total = document.getElementById("totalWithExpense").value;
				var hamaliTotal = Number(total) + Number(hamaliExpence);
				var totalWithExpense = Number(transExpence) + Number(hamaliTotal);
				document.getElementById("grossTotal").value = totalWithExpense;
			}	
	
	
		}

		function hamaliExpenseAddingToGross(){
			var hamaliExpence = document.getElementById("hamaliExpence").value;
			var transExpence = document.getElementById("transExpence").value;
		
			if(transExpence == ""){
				var total = document.getElementById("totalWithExpense").value;
				var totalWithExpense = Number(total) + Number(hamaliExpence);
				document.getElementById("grossTotal").value = totalWithExpense;
			}
			if(transExpence != ""){
				var total = document.getElementById("totalWithExpense").value;
				var totalWithExpense = Number(total) + Number(transExpence);
				var totalWithExpense1 = Number(totalWithExpense) + Number(hamaliExpence);
				document.getElementById("grossTotal").value = totalWithExpense1;
			}
	
		}
	
		
	/* 	Calculations for Credit  */
			function transExpenseAddingToGrossTotalForCredit(){
			
			var transExpence = document.getElementById("transExpence1").value;
			var hamaliExpence = document.getElementById("hamaliExpence1").value;
	
		if(hamaliExpence == ""){
				var total = document.getElementById("totalWithExpense1").value;
				var totalWithExpense = Number(total) + Number(transExpence);
				document.getElementById("grossTotal1").value = totalWithExpense;
			}	
		
			if(hamaliExpence != ""){
				var total = document.getElementById("totalWithExpense1").value;
				var hamaliTotal = Number(total) + Number(hamaliExpence);
				var totalWithExpense = Number(transExpence) + Number(hamaliTotal);
				document.getElementById("grossTotal1").value = totalWithExpense;
			}	
	
	
		}

		function hamaliExpenseAddingToGrossForCredit(){
			var hamaliExpence = document.getElementById("hamaliExpence1").value;
			var transExpence = document.getElementById("transExpence1").value;
		
			if(transExpence == ""){
				var total = document.getElementById("totalWithExpense1").value;
				var totalWithExpense = Number(total) + Number(hamaliExpence);
				document.getElementById("grossTotal1").value = totalWithExpense;
			}
			if(transExpence != ""){
				var total = document.getElementById("totalWithExpense1").value;
				var totalWithExpense = Number(total) + Number(transExpence);
				var totalWithExpense1 = Number(totalWithExpense) + Number(hamaliExpence);
				document.getElementById("grossTotal1").value = totalWithExpense1;
			}
	
		} 

	/* 	function GrossTotalWithoutExpense(){
			var transExpence = document.getElementById("transExpence").value;
			var hamaliExpence = document.getElementById("hamaliExpence").value;
			var totalWithExpense = document.getElementById("totalWithExpense").value;

			if(hamaliExpence == "0" && transExpence == "0"){
				document.getElementById("grossTotal").value = totalWithExpense;
				}

			}	 
	 
		function transExpenseAddingToGrossTotal(){
			
			var transExpence = document.getElementById("transExpence").value;
			var hamaliExpence = document.getElementById("hamaliExpence").value;
			
	
		if(transExpence != "0"){
				var total = document.getElementById("totalWithExpense").value;
				var perc = document.getElementById("transExpenceAmount").value;
				var teg=(transExpence*(perc/100));
				var expenseAndTaxAmount = Number(teg) + Number(transExpence);
				var totalWithExpense = Number(total) + Number(expenseAndTaxAmount);
				document.getElementById("grossTotal").value = totalWithExpense;
			}	
		
			if(transExpence == ""){
				var total = document.getElementById("totalWithExpense").value;
				var hamaliTotal = Number(total) + Number(hamaliExpence);
				var totalWithExpense = Number(transExpence) + Number(hamaliTotal);
				document.getElementById("grossTotal").value = totalWithExpense;
			}	
	
	
		}

		function hamaliExpenseAddingToGross(){
			var hamaliExp = document.getElementById("transExpence").value;
			var transExpence = document.getElementById("hamaliExpence").value;
		
			if(hamaliExp !="0"){
				var total = document.getElementById("grossTotal").value;
				 var perc = document.getElementById("gstForExpense").value; 
				var perc = document.getElementById("hamaliExpenceAmount").value;
				var teg=(hamaliExp*(perc/100));
				var expenseAndTaxAmount = Number(teg) + Number(hamaliExp);
				 document.getElementById("hamaliExpenceAmount").value = teg; 
				var totalWithExpense = Number(total) + Number(expenseAndTaxAmount);
				document.getElementById("grossTotal").value = totalWithExpense;
			}
		/* 	if(hamaliExp == ""){
				var total = document.getElementById("totalWithExpense").value;
				var totalWithExpense = Number(total) + Number(hamaliExp);
				var totalWithExpense1 = Number(transExpence) + Number(totalWithExpense);
				document.getElementById("grossTotal").value = totalWithExpense1;
			}
	
		} */
	
		
	/* Calculations for Credit  */
	/* 		function GrossTotalWithoutExpenseForCredit(){
				var transExpence1 = document.getElementById("transExpence1").value;
				var hamaliExpence1 = document.getElementById("hamaliExpence1").value;
				var totalWithExpense1 = document.getElementById("totalWithExpense1").value;

				if(hamaliExpence1 == "0" && transExpence1 == "0"){
					document.getElementById("grossTotal1").value = totalWithExpense1;
					}

				}	 
	 
			function transExpenseAddingToGrossTotalForCredit(){
			
			var transExpence = document.getElementById("transExpence1").value;
			var hamaliExpence = document.getElementById("hamaliExpence1").value;

			if(transExpence != "0"){
				var total = document.getElementById("totalWithExpense1").value;
				var perc = document.getElementById("transExpenceAmount1").value;
				var teg=(transExpence*(perc/100));
				var expenseAndTaxAmount = Number(teg) + Number(transExpence);
				//document.getElementById("transExpenceAmount1").value = teg;
				var totalWithExpense = Number(total) + Number(expenseAndTaxAmount);
				document.getElementById("grossTotal1").value = totalWithExpense;
			}	
		
			if(transExpence == ""){
				var total = document.getElementById("totalWithExpense1").value;
				var hamaliTotal = Number(total) + Number(hamaliExpence);
				var totalWithExpense = Number(transExpence) + Number(hamaliTotal);
				document.getElementById("grossTotal1").value = totalWithExpense;
			}	
	
	
		}

		function hamaliExpenseAddingToGrossForCredit(){
			var hamaliExpence = document.getElementById("hamaliExpence1").value;
			var transExpence = document.getElementById("transExpence1").value;
		
			if(hamaliExpence !="0"){
				var total = document.getElementById("grossTotal1").value;
				var perc = document.getElementById("hamaliExpenceAmount1").value;
				var teg=(hamaliExpence*(perc/100));
				var expenseAndTaxAmount = Number(teg) + Number(hamaliExpence);
				//document.getElementById("hamaliExpenceAmount1").value = teg;
				var totalWithExpense = Number(total) + Number(expenseAndTaxAmount);
				document.getElementById("grossTotal1").value = totalWithExpense;
			}
			if(hamaliExpence == ""){
				var total = document.getElementById("totalWithExpense1").value;
				var totalWithExpense = Number(total) + Number(hamaliExp);
				var totalWithExpense1 = Number(transExpence) + Number(totalWithExpense);
				document.getElementById("grossTotal1").value = totalWithExpense1;
			}
	
		}
		*/
</script>
<script type="text/javascript">
function pageLoad(){
	$("#CashCustDetail").show();
	$("#CreditCustDetail").hide(); 
}
function openCashCustomerBilling() {
	$("#CashCustDetail").show();
	$("#CreditCustDetail").hide();
	location.reload();
}
function openCreditCustomerBilling() {
	$("#CreditCustDetail").show();
	$("#CashCustDetail").hide();
}
</script>
	</head>
	<%
        long customerBill = 1l;
	 %>
	 <%
        FertilizerBillDao dao1 = new FertilizerBillDao();
	
	    List bill = dao1.getCustomerBill();
	
	    for(int i=0;i<bill.size();i++){
	    CustomerBillBean sa=(CustomerBillBean)bill.get(i);
	    customerBill= sa.getBillNo();
	    System.out.println(customerBill);
	
	     customerBill++;
	     System.out.println(customerBill);        
	        }
         %> 
	
	
<body onload="pageLoad();getProductName();getProductNameForCredit()">
	<div class="row header_margin_top" style="height: 1px;">
			    <div align="center">
			  		<h2  class="form-name style_heading">Fertilizer	Bill</h2>
			  		
			  		
			  	</div>
			  	
			  	 <div align="right" style="margin-right: 150px;">
			  		<h3 style="color: red;">Bill No :: <%out.println(customerBill); %></h3>
                 </div>
       
    </div>
    
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10" style=" margin-top: 40;">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
				
	<div class="container col-sm-offset-1 "  >
	     <div class="row form-group">
         		<div class="col-md-3 control-label">
         		<label  for="customertype" style="float:right">Customer Type<sup>*</sup></label>
         		</div>	
         			<div class="col-md-3">
						<div class="col-xs-6 ">
							<label class="radio-inline">						
								<input type="radio" name="customertype" id="customertype" checked="checked" onclick="openCashCustomerBilling()"  >Cash
							</label>
						</div>	
      					<div class="col-xs-6 col-md-ffset-1 ">	
							<label class="radio-inline">						
								<input  type="radio" name="customertype" id="customertype" onclick="openCreditCustomerBilling()" >Credit
							</label>
						</div>	
              		</div> 
           </div>
              	
		<!------------------			Code for Cash customers ------------------>
  
     <div id="CashCustDetail">
  
     <form class="form-horizontal" method="post" action="" name="fertiBill">
			<fieldset>
			 <!--  <div class="row form-group">
         		<label class="col-md-3 control-label" for="billType">Bill Type<sup>*</sup></label>
         			<div class="col-md-3">
						<div class="col-xs-6 ">	
							<label class="radio-inline">						
								<input type="radio" name="customertype" id="retail" checked="checked" onchange="hidePercentageBox()" >Retail
							</label>
						</div>	
      					<div class="col-xs-6 col-md-ffset-1 ">	
							<label class="radio-inline">						
								<input type="radio" name="customertype" id="vat" onchange="showPercentageBox()" >Vat
							</label>
						</div>	
              		</div> 
              </div> -->
         <div class="row form-group">
			<label class="col-md-3 control-label" for="customerName">Customer Name</label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
           		 			  <input id="customerName" name="customerName" placeholder="Customer Name" class="form-control input-md" type="text" >
           		 		</div>
					</div>

           	 <label class="col-md-2 control-label" for="village">Village/City</label>
           	 	<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
         	   			  <input id="village" name="village" placeholder="Village" class="form-control input-md ac_district"  type="text">
          		  	</div>
				</div>
          </div>
	  
	      <div class="row form-group">
			<label class="col-md-3 control-label" for="contactNo">Contact No.</label>  
           	 		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
              				<input id="contactNo" name="contactNo" placeholder="Contact No." class="form-control input-md" type="text" >
            			</div>
            		</div>
			
			<label class="col-md-2 control-label" for="aadharNo">Aadhar No.</label>  
           	 		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
              				<input id="aadharNo" name="aadharNo" placeholder="Aadhar No." class="form-control input-md" type="text" >
            			</div>
            		</div>
			</div>
        	 <div class="row form-group">
              	<label class="col-md-3 control-label" for="productName">Product Name<sup>*</sup></label>  

            			<div class="col-md-8">
							<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
            						<select class="form-control" id='proName'   name="proName" onchange="getProductDetailsByProductName()" >
									</select>
            				</div>
            			</div>
        	  </div>  
        	  <div class="row form-group">
        	   <label class="col-md-3 control-label" for="barcode">Barcode</label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								No.
							</span>
           		 			  <input id="key" name="key" placeholder="Barcode" class="form-control input-md" type="text" onchange ="getitemData()" >
           		 		</div>
					</div>
        	  </div>
          <!-- 	<div style='position:absolute; top:440px; left:108px; '> -->
          <div class="table-responsive	row">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
			<!-- </div> -->
		  </div>
		
		 
          <div class="row form-group" >
          
          </div>
          
          	<div class="row form-group" >
					<div class="col-md-3 control-label">
	           				<label for="paymentMode"> Payment Mode</label>  
	           		</div>
	           		
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-usd"></i>
								</span>
	           					<select class="form-control" id="paymentMode">
										<option value="selected">-Select Type--</option>
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										<option value="card">Card</option>
										<option value="neft">NEFT</option>
								</select>	
	           				</div>
						</div>
			
            	
	 <script>
		
		$(document).ready(function(){
	  		 $("#paymentMode").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="cheque"){
	           	
	           	$("#cheque_no").show(); 
	           	
	           	$("#neft_acc_no").hide(); 
	           	$("#card_no").hide();
	           	}
	          	 else if($(this).attr("value")=="card"){
	           	
	          		$("#card_no").show(); 	
	          		
	          		$("#neft_acc_no").hide(); 
	        		$("#cheque_no").hide();
	           }
	          	 else if($(this).attr("value")=="neft"){
	                	
	           		$("#neft_acc_no").show(); 	
	           		
	           		$("#card_no").hide(); 
	        		$("#cheque_no").hide();
	            }
	          	 else if($(this).attr("value")=="cash"){
	             	
	            		$("#neft_acc_no").hide(); 
	            		$("#cheque_no").hide();
	            		$("#card_no").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="selected"){
	             	
	        		$("#neft_acc_no").hide(); 
	        		$("#cheque_no").hide();
	        		$("#card_no").hide(); 
	         }
	          
	       });
	   }).change();
		});	
		</script>
          	
					
					</div>
          
          	<div class="row form-group" >

            					<div id="cheque_no" >
            						<!-- <div class="col-md-1">										
										<label class="control-label">Cheque No.:</label>
									</div> -->
										
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNum" placeholder="Cheque No." />  
									</div>
								
									<!-- <div class="col-md-1">
										<label class="control-label">Date:</label>
									</div>
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="cdate" id="chequedate" placeholder="yyyy-mm-dd" />  
									</div> -->
									<!-- <div class="col-md-1">
										<label class="control-label">Name:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck" placeholder="Name On check" />  
									</div>
								</div>
											
											<div id="card_no" class="form-group">
												<!-- <div class="col-md-2">
													<label class="control-label">Card No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="cardNum" id="cardNum" placeholder="Card No." />  
												</div>
												
											</div>
											
											<div id="neft_acc_no" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="control-label">Account No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="accNum" id="accNum" placeholder="Account No." />  
												</div>
												<!-- <div class="col-md-1 ">
													<label class="control-label">Bank Name</label>
												</div> -->
												<div class="col-md-3 col-md-offset-2 first">	
													<input class="form-control" type="text" name="bankName" id="bankName" placeholder="Name Of Bank" />  
												</div>
												</div>
											</div>
          
        
<!--         <div class="row form-group" style="margin-top:10px;">
    		<div class="col-md-5" id="calculator" style="margin-left: 146px;">
								Screen and clear key
								<div class="top">
									<span class="clear">C</span>
									<div class="screen"></div>
								</div>
								
								<div class="keys">
									operators and other keys
									<span>7</span>
									<span>8</span>
									<span>9</span>
									<span class="operator">+</span>
									<span>4</span>
									<span>5</span>
									<span>6</span>
									<span class="operator">-</span>
									<span>1</span>
									<span>2</span>
									<span>3</span>
									<span class="operator">�</span>
									<span>0</span>
									<span>.</span>
									<span class="eval">=</span>
									<span class="operator">x</span>
								</div>
							</div>
          	       	<script type="text/javascript" src="/Fertilizer/staticContent/js/PrefixFree 1.0.7.js"></script>
					<script type="text/javascript" src="/Fertilizer/staticContent/js/calculator.js"></script>
				</div>	 -->
          	   <!--  <div class="col-md-6"> -->
          	    <div class="row" style="margin-top:15px;">
          	    <label class="col-md-2 col-md-offset-6 control-label"  for="total" ><b>Total</b></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="totalWithExpense" readonly="readonly" class="form-control input-md" type="text">
	            			</div>
	            		</div>
	            		</div>
          		<!-- </div> -->
          	
          		<!-- <div class="col-md-6"> -->
          		<div class="row" style="margin-top:15px;">
				<label class="col-md-3 col-md-offset-5 control-label"  for="transExpence" ><b>Transportation Expenses</b></label>  
	            		<!-- <label class="col-md-1" for="transExpence" ><b></b></label>  
			           	 <div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="transExpenceAmount" name="transExpenceAmount" placeholder="With GST" class="form-control input-md" type="text">
	            			</div>
	            		</div> -->
	            		
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="transExpence" name="transExpence" placeholder="Transportation Expenses" class="form-control input-md" type="text" onchange="transExpenseAddingToGrossTotal()">
	            			</div>
	            		</div>
	            		</div>
				<!-- 	</div> -->
					<!-- <div class="col-md-6"> -->
					<div class="row" style="margin-top:15px;">
	            		<label class="col-md-2 col-md-offset-6 control-label"  for="hamaliExpence" ><b>Hamali Expenses</b></label>  
	            		<!-- <label  class="col-md-1" for="hamaliExpence" ><b></b></label>  
			           	 <div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="hamaliExpenceAmount" name="hamaliExpenceAmount" placeholder="With GST" class="form-control input-md" type="text">
	            			</div>
	            		</div> -->
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="hamaliExpence" name="hamaliExpence" placeholder="Hamali Expenses" class="form-control input-md" type="text" onchange="hamaliExpenseAddingToGross()">
	            			</div>
	            		</div>
					</div>
				<!-- </div> -->
          	
          		<!-- <div class="col-md-6"> -->
          		<div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal" name="grossTotal" placeholder="Gross Total" class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
            	</div>
            	<!-- </div> -->
     	 <!-- </div> -->
       				<div class="row form-group buttons_margin_top ">
								<div align="center">
								  
								<input type="button" accesskey="q" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="save" onclick="fertilizerBill()" value="Print Bill (Alt + Q)">
		           				<input type="reset" style="font-size: 25" class="btn btn-large btn-danger  button-height-width" id="save" name="btn" value="Cancel" onclick="reset()">
								 <input type="button" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick="openStockReport()" value="Stock Report">	
									
								</div>
					</div>	
				</fieldset>
				</form>
       </div>
           
           
 <!--         For credit Customer   -->
           
       <div id="CreditCustDetail">
       	<form class="form-horizontal" method="post" action="" name="creditFertiBill1">
			<fieldset>
			   <!-- <div class="row form-group">
         		<label class="col-md-3 control-label" for="billType">Bill Type<sup>*</sup></label>
         			<div class="col-md-3">
						<div class="col-xs-6 ">	
							<label class="radio-inline">						
								<input type="radio" name="customertype" id="retail1" checked="checked" onchange="hidePercentageBox1()" >Retail
							</label>
						</div>	
      					<div class="col-xs-6 col-md-ffset-1 ">	
							<label class="radio-inline">						
								<input  type="radio"  name="customertype" id="vat1" onchange="showPercentageBox1()"  >Vat
							</label>
						</div>	
              		</div> 
              </div> -->
	 	 <div class="row form-group">
			<label class="col-md-3 control-label" for="creditCustomerName"> Customer Name<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
			
										
							<!-- Following code is to get customers from "customer_details" table of "fertilizer" DB -->
							<!-- getAllCustomer() is implemented in  CustomerDetailsDao with return type List-->
						
							<%
							CustomerDetailsDao dao = new CustomerDetailsDao();
           						List cust =dao.getAllCustomer();
							
							%>
							
							<input type="text" id="creditCustomer" list="cust_drop1" class="form-control" onchange="custDetail.getVillageName();custDetail.getContactNo();custDetail.getName();custDetail.getAadhar()" >
				<datalist id="cust_drop1">
							
							<%
					           for(int i=0;i<cust.size();i++){
					        	   CustomerDetailsBean bean =(CustomerDetailsBean)cust.get(i);
							%>
							<option data-value="<%=bean.getCustId()%>"><%=bean.getFirstName() %> <%=bean.getLastName() %> </option>
							<%
				      			}
				    		%>
						</datalist>
						</div>
					</div>

           	 <label class="col-md-2 control-label" for="village1">Village/City</label>
           	 	<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
         	   			  <input id="village1" name="village1"  class="form-control input-md ac_district"  type="text">
          		  	</div>
				</div>
         </div>
         
            <div class="row form-group">
			<label class="col-md-3 control-label" for="contactNo1">Contact No.</label>  
           	 		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
              				<input id="contactNo1" name="contactNo1"  class="form-control input-md" type="text" >
            			</div>
            		</div>
            	<label class="col-md-2 control-label" for="aadharNo1">Aadhar No.</label>  
           	 		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								No.
							</span>
              				<input id="aadharNo1" name="aadharNo1" placeholder="Aadhar No." class="form-control input-md" type="text" >
            			</div>
            		</div>
          
	 	</div>
	 	
	 	<div class="row form-group">
              	<label class="col-md-3 control-label" for="productName">Product Name<sup>*</sup></label>  
           			<div class="col-md-8">
							<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
            						<select class="form-control" id='proName1'   name="proName1" onchange="getProductDetailsByProductNameForCredit()" >
									</select>
            				</div>
            			</div>
            		
        	  </div> 
           			
           			
  	<div class="row form-group">
            		<label class="col-md-3 control-label" for="barcode1">Barcode</label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								No.
							</span>
           		 			  <input id="barcode1" name="barcode1" placeholder="Barcode" class="form-control input-md" type="text" onchange ="getProDetailsAsPerBarcode()" >
           		 		</div>
					</div>
        	  </div>  
         
          
      
          
          
          <!-- 	<div style='position:absolute; top:440px; left:108px; '> -->
          <div class="table-responsive	row">
				<table id="credit" ></table>
				<div id="jqGridPagerForCreditCustomer"></div>
			<!-- </div> -->
		</div>
		
		 
          <div class="row form-group" >
          
          </div>
          
       
         <div class="row form-group">
         	
         	    <!--  	Customer first name is hidden	 -->
         
            <label class="col-md-3 control-label" style="display:none" for="customerNameHidden">Customer Name</label>  
           	 		<div class="col-md-3" style="display:none">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				<input  id="customerNameHidden" name="customerNameHidden"  class="form-control input-md" type="text" >
            			</div>
            		</div> 
         
          	   <label class="col-md-2 col-md-offset-6  control-label"  for="total" ><b>Total</b></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="totalWithExpense1" readonly="readonly" class="form-control input-md" type="text">
	            			</div>
	            		</div>
          	</div>
          	
          	
        <%-- <div class="row form-group">
        
        	 <label class="col-md-3 control-label" for="expensesDescription">Expenses Description</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
						
							<%
							ExpenseDetailForBillingAndGoodsReceiveDao expenseDao = new ExpenseDetailForBillingAndGoodsReceiveDao();
           						List expList1 =expenseDao.getAllExpenses();
							
							%>
							
							<input list="exp_drop1" id="fkExpenseDescriptionId1"  class="form-control">
				<datalist id="exp_drop1">
							
							<%
					           for(int i=0;i<expList1.size();i++){
					        	   ExpenseDetailForBillingAndGoodsReceiveBean expenseBilling =(ExpenseDetailForBillingAndGoodsReceiveBean)expList1.get(i);
							%>
		
							<option data-value="<%=expenseBilling.getPkExpenseForBillingId()%>" value="<%=expenseBilling.getExpenseName()%>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
        
        
        	 <!-- <label class="col-md-3 control-label"  for="expenseDescription1" ><b>Expenses Description</b><sup>*</sup></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="	glyphicon glyphicon-hand-right"></i>
								</span>
	              				<input id="expenseDescription1" name="expenseDescription1" placeholder="Expense description" class="form-control input-md" type="text">
	            			</div>
	            		</div> -->
        
          	<label class=" col-md-2  control-label"  for="expenses1" ><b>Other Expenses</b><sup>*</sup></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="extraExpence1" name="expenses" placeholder="Other Expenses" class="form-control input-md" type="text" onkeyup="expenseAddingToGrossInCredit()">
	            			</div>
	            		</div>
	            		
	            	
          	</div> --%>
          		
    <%--       
          	   <!-- 	 To show and hide percentage Box -->
			<script >
			function taxPercentageBox(){
				$("#vatId2").hide();
			}
			
			function hidePercentageBox1(){
				$("#vatId2").hide();
			}
			
			function showPercentageBox1(){
				$("#vatId2").show();
			}
			</script>
         
          	
          	<div id="vatId2" class="row form-group" >
					<label class=" col-md-3 control-label"  for="grossTotal"><b>Vat %</b></label>  
			           	 
							<%
							TaxCreationDao taxdao2 = new TaxCreationDao();
		           						List taxlist2 =taxdao2.getAllMainTax();
						
					           for(int i=0;i<taxlist2.size();i++){
					        	   TaxCreationBean taxBean2 =(TaxCreationBean)taxlist2.get(i);
							%>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input type="text" value="<%=taxBean2.getTaxPercentage()%>" id="taxPercentage1" style="height:30;width: 175px">
							<%
				      			}
				    		%>
			          
	            			</div>
	            		</div>
	            		
	            <label class=" col-md-2 control-label"  for="taxAmount" ><b>Tax Amount</b><sup>*</sup></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="taxAmount1" readonly="readonly" class="form-control input-md" type="text">
	            			</div>
	            		</div>
	            		
            	</div> --%>
          	     <div class="row form-group" >
				<label class="col-md-3 col-md-offset-5 control-label"  for="transExpence" ><b>Transportation Expenses</b></label>  
			           	 
	            		<!-- <label class="col-md-1" for="transExpence" ><b></b></label>  
			           	 <div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="transExpenceAmount1" name="transExpenceAmount" placeholder="With GST" class="form-control input-md" type="text">
	            			</div>
	            		</div> -->
	            		<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="transExpence1" name="transExpence" placeholder="Transportation Expenses" class="form-control input-md" type="text" onchange="transExpenseAddingToGrossTotalForCredit()">
	            			</div>
	            		</div>
					</div>
					 <div class="row form-group" >
					<label class="col-md-2 col-md-offset-6 control-label"  for="hamaliExpence" ><b>Hamali Expenses</b></label>  
			          
	            		<!-- <label  class="col-md-1" for="hamaliExpence" ><b></b></label>  
			           	 <div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="hamaliExpenceAmount1" name="hamaliExpenceAmount" placeholder=" With GST" class="form-control input-md" type="text">
	            			</div>
	            		</div> -->
	            		 	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="hamaliExpence1" name="hamaliExpence"  placeholder="Hamali Expenses" class="form-control input-md" type="text" onchange="hamaliExpenseAddingToGrossForCredit()">
	            			</div>
	            		</div>
					</div>
          	
          		<div class="row form-group">
					<label class="col-md-offset-6 col-md-2 control-label"  for="grossTotal1"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal1" name="grossTotal1" placeholder="Gross Total" class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
            	</div>
	 	
	 	
	 		<div class="row form-group buttons_margin_top ">
				<div align="center">
					<input type="button" accesskey="w" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn2" onclick="fertilizerBillForCreditCustomer()" value="Print Bill (Alt + W)">
		           	<input type="reset" style="font-size: 25" class="btn btn-large btn-danger  button-height-width" id="save" name="btn" value="Cancel" onclick="reset()">	
					<input type="button" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick="openStockReport()" value="Stock Report">		  
					<!-- <button id="btn" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="creditCustFertilizerBill()"><h4> Submit</h4></button>
              		<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
								  
								 
				</div>
			</div>	
	 		</fieldset>
	 	</form>
	 </div>
	 	
	</div>
</body>

<%@include file="commons/newFooter.jsp" %> 

<%--  <%@include file="commons/footer.jsp" %> --%>