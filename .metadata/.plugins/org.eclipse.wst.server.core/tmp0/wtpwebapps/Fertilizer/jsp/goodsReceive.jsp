<%@page import="com.Fertilizer.hibernate.ExpenseDetailForBillingAndGoodsReceiveBean"%>
<%@page import="com.Fertilizer.dao.ExpenseDetailForBillingAndGoodsReceiveDao"%>
<%@page import="com.Fertilizer.hibernate.GodownEntry"%>
<%@page import="com.Fertilizer.dao.GodownEntryDao"%>
<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<% boolean isHome=false;%>
 <%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
 <%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
 <%@page import="java.util.List" %>
  <%@page import="com.Fertilizer.dao.TaxCreationDao"%>
   <%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
<%@include file="commons/header.jsp"%>
<head>
 <meta charset="utf-8">
  	  <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery-1.12.3.min.js"></script>
     <script type="text/javascript" src="/Fertilizer/staticContent/js/goodsreceiveFetchProduct.js"></script>
      <script type="text/javascript" src="/Fertilizer/staticContent/js/goodsReceive.js"></script>
  
	 <link rel="stylesheet" href="/Fertilizer/staticContent/css/jquery-ui.min.css">
     <link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.min.css">
     <!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.css"> -->
     
     <link rel="stylesheet" href="/Fertilizer/staticContent/y_css/jquery-ui.css">
  <!--  -->   <link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.css">
  <!--  -->    <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery.min.js"></script>
    <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery-ui-min.js"></script>
    <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/Fertilizer/staticContent/js/jqueryUi.js"></script>
    <script type="text/javascript" src="/Fertilizer/staticContent/js/jquery.jqgrid.min.js"></script>
<script type="text/javascript">
function myOnLoadFunction()
{
	$("#CreditCustDetail").hide();
	
}

function ShowAdvanceBookingDetails(){
	$("#CreditCustDetail").show();
	$("#ShowCashCustDetail").hide();
	}

function ShowWithoutBookingDeatils() {
	$("#ShowCashCustDetail").show();
	$("#CreditCustDetail").hide();
	location.reload(true)
	}
</script>

<script>
/* 
function transExpenseAddingToGrossTotal(){
	var transExpence = document.getElementById("transExpence").value;
	var hamaliExpence = document.getElementById("hamaliExpence").value;
	var discount = $('#discount').val();
	
	if(discount == ""){
		if(hamaliExpence == ""){
		var total = document.getElementById("total").value;
		var totalWithExpense = Number(total) + Number(transExpence);
		document.getElementById("grossTotal").value = totalWithExpense;
		}	
		
		if(hamaliExpence != ""){
			var total = document.getElementById("total").value;
			var hamaliTotal = Number(total) + Number(hamaliExpence);
			var totalWithExpense = Number(transExpence) + Number(hamaliTotal);
			document.getElementById("grossTotal").value = totalWithExpense;
		}	
	}
	
	
	if(discount != ""){
		if(hamaliExpence == ""){
			var total = document.getElementById("total").value;
			var discountAmount = ((discount/100)*Number(total));
			var totalminusDiscount = Number(total) - Number(discountAmount);
			var totalWithExpense = Number(totalminusDiscount) + Number(transExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		}	
		if(hamaliExpence != ""){
			var total = document.getElementById("total").value;
			var discountAmount = ((discount/100)*Number(total));
			var totalminusDiscount = Number(total) - Number(discountAmount);
			var totalwithTrans = Number(totalminusDiscount) + Number(hamaliExpence);
			var totalWithExpense = Number(totalwithTrans) + Number(transExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		}
	
	}
	
} */


function discountCalculation(){
	var total = document.getElementById("total").value;
	var discount = $('#discount').val();
	var discountAmount = ((discount/100)*Number(total));
	var totalminusDiscount = Number(total) - discountAmount;
	document.getElementById("discountAmount").value = discountAmount;
	document.getElementById("grossTotal").value = totalminusDiscount;
}

var totalWithExpense = 0; 
var grossTot = 0;
var trans = 0;
var ham = 0;
function transExpenseAddingToGrossTotal(){
	
	var transExpence = document.getElementById("transExpence").value;
	var hamaliExpence = document.getElementById("hamaliExpence").value;
	

if(transExpence != ""){
		grossTot = document.getElementById("grossTotal").value;
		var totals = document.getElementById("grossTotal").value;
		var perc = document.getElementById("transExpenceAmount").value;
		var teg= (Number(transExpence)*(perc/100));
		var expenseAndTaxAmount = Number(teg) + Number(transExpence);
		 totalWithExpense = Number(totals) + Number(expenseAndTaxAmount);
		document.getElementById("grossTotal").value = totalWithExpense;
	}	

	if(transExpence == ""){
		// var total = document.getElementById("totalWithExpense").value;
		var perc = document.getElementById("hamaliExpenceAmount").value;
		var teg=(hamaliExpence*(perc/100));
		var expenseAndTaxAmount = Number(teg) + Number(hamaliExpence);
		var hamaliTotal = Number(grossTot) + Number(expenseAndTaxAmount);
		 totalWithExpense = Number(transExpence) + Number(hamaliTotal); 
		document.getElementById("grossTotal").value = totalWithExpense;
	}	


}

var grossTotForHamali = 0;
function hamaliExpenseAddingToGross(){
	var hamaliExp = document.getElementById("hamaliExpence").value;
	var transExpence = document.getElementById("transExpence").value;

	
	if(hamaliExp !=""){
		grossTotForHamali = document.getElementById("grossTotal").value;
		//var total = document.getElementById("grossTotal").value;
		var perc = document.getElementById("hamaliExpenceAmount").value;
		var teg=(hamaliExp*(perc/100));
		var expenseAndTaxAmount = Number(teg) + Number(hamaliExp);
		var totalWithExpense2 = Number(totalWithExpense) + Number(expenseAndTaxAmount);
		document.getElementById("grossTotal").value = totalWithExpense2;
	}
	

	if(hamaliExp == ""){
		
		//grossTotForHamali = document.getElementById("grossTotal").value;
		var perc = document.getElementById("transExpenceAmount").value;
		var teg= (Number(transExpence)*(perc/100));
		var expenseAndTaxAmount = Number(teg) + Number(transExpence);
		var transTotal = Number(grossTot) + Number(expenseAndTaxAmount);
	    var totalWithExpense1 = Number(hamaliExp) + Number(transTotal);  
		document.getElementById("grossTotal").value = totalWithExpense1;
	}

}


/* For booked goods receive */
 var totalWithExpensess = 0
var grossTotalBeforeExpense = 0;
function transExpenseAddingToGrossTotalForBooked(){
	
	var transExpence = document.getElementById("transExpence1").value;
	var hamaliExpence = document.getElementById("hamaliExpence1").value;
	

if(transExpence != ""){
		grossTotalBeforeExpense = document.getElementById("grossTotal1").value;
		var total = document.getElementById("grossTotal1").value;
		var perc = document.getElementById("transExpenceAmount1").value;
		var teg=(transExpence*(perc/100));
		var expenseAndTaxAmount = Number(teg) + Number(transExpence);
		totalWithExpensess = Number(total) + Number(expenseAndTaxAmount);
		document.getElementById("grossTotal1").value = totalWithExpensess;
	}	

	if(transExpence == ""){
		var perc = document.getElementById("hamaliExpenceAmount1").value;
		var teg=(hamaliExpence*(perc/100));
		var expenseAndTaxAmount = Number(teg) + Number(hamaliExpence);
		var hamaliTotal = Number(grossTotalBeforeExpense) + Number(expenseAndTaxAmount);
		 totalWithExpense = Number(transExpence) + Number(hamaliTotal); 
		document.getElementById("grossTotal1").value = totalWithExpense;
		
		
		
		/* var total = document.getElementById("totalWithExpense1").value;
		var hamaliTotal = Number(total) + Number(hamaliExpence);
		totalWithExpensess = Number(transExpence) + Number(hamaliTotal);
		document.getElementById("grossTotal1").value = totalWithExpensess; */
	}	


}

function hamaliExpenseAddingToGrossForBooked(){
	 var transExpence = document.getElementById("transExpence1").value;
	 var hamaliExp = document.getElementById("hamaliExpence1").value;

	if(hamaliExp !=""){
		//var total = document.getElementById("grossTotal1").value;
		var perc = document.getElementById("hamaliExpenceAmount1").value;
		var teg=(hamaliExp*(perc/100));
		var expenseAndTaxAmount = Number(teg) + Number(hamaliExp);
		var totalWithExpense3 = Number(totalWithExpensess) + Number(expenseAndTaxAmount);
		document.getElementById("grossTotal1").value = totalWithExpense3;
	}
	
	
	if(hamaliExp == ""){
		var perc = document.getElementById("transExpenceAmount1").value;
		var teg= (Number(transExpence)*(perc/100));
		var expenseAndTaxAmount = Number(teg) + Number(transExpence);
		var transTotal = Number(grossTotalBeforeExpense) + Number(expenseAndTaxAmount);
	    var totalWithExpense1 = Number(hamaliExp) + Number(transTotal);  
		document.getElementById("grossTotal1").value = totalWithExpense1;
		
		
		/* var total = document.getElementById("totalWithExpense1").value;
		var totalWithExpense = Number(total) + Number(hamaliExp);
		var totalWithExpense1 = Number(transExpence) + Number(totalWithExpense);
		document.getElementById("grossTotal1").value = totalWithExpensess; */
	}
}  
 
 
 

/* 
function hamaliExpenseAddingToGross(){
	
	var hamaliExpence = document.getElementById("hamaliExpence").value;
	//Gross total calculation
	var discount = $('#discount').val();
	var transExpence = document.getElementById("transExpence").value;
	
	if(discount == ""){
		
		if(transExpence == ""){
			var total = document.getElementById("total").value;
			var totalWithExpense = Number(total) + Number(hamaliExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		}
		if(transExpence != ""){
			var total = document.getElementById("total").value;
			var totalWithExpense = Number(total) + Number(transExpence);
			var totalWithExpense1 = Number(totalWithExpense) + Number(hamaliExpence);
			document.getElementById("grossTotal").value = totalWithExpense1;
		}
	}
	
	if(discount != ""){
		var transExpence = document.getElementById("transExpence").value;
		if(transExpence == ""){
			var total = document.getElementById("total").value;
			var discountAmount = ((discount/100)*Number(total));
			var totalminusDiscount = Number(total) - Number(discountAmount);
			var totalWithExpense = Number(totalminusDiscount) + Number(hamaliExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		}
		if(transExpence != ""){
			var total = document.getElementById("total").value;
			var discountAmount = ((discount/100)*Number(total));
			var totalminusDiscount = Number(total) - discountAmount;
			var totalwithTrans = Number(totalminusDiscount) + Number(transExpence);
			var totalWithExpense = Number(totalwithTrans) + Number(hamaliExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		}
	}
	
}
 */
 
 
 
</script>

</head>
<body onload="myOnLoadFunction()">
<div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading">Goods Receive</h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10" style="margin-top: -30;">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
  
        
 
 <div class="container col-sm-offset-1" style="margin-top: -25;" >
    <div class="row form-group">
         		<div class="col-md-2 ">
         		<label class="control-label" for="customertype">Type<sup>*</sup></label>
         		</div>	
         			<div class="col-md-7">
						<div class="col-md-4 col-xs-6 ">
							<label class="radio-inline">						
								<input type="radio" name="customertype" id="customertype" checked="checked" onchange="ShowWithoutBookingDeatils()">Without Booking
							</label>
						</div>	
      					<div class="col-md-6 col-xs-6 col-md-ffset-1 ">	
							<label class="radio-inline">						
								<input  type="radio" name="customertype" id="customertype" onchange="ShowAdvanceBookingDetails()" >With Advance Booking
							</label>
						</div>	
              		</div> 
           </div>
	  <div id="ShowCashCustDetail">
        <form class="form-horizontal" method="post" action="" name="goodsReceiveForm"><!-- Value of 'name' attribute is used in  supplierDetails.js  -->
          <fieldset>
       			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
				
        	       <div class="row form-group">
        	        <label class="col-md-2 control-label" for="supplier">Supplier Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							
										
							<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
								SupplierDetailsDao sdd = new SupplierDetailsDao();
           						List sList =sdd.getAllSupplier();
							
							%>
							
							<input list="sup_drop" id="supplier"  class="form-control">
				            <datalist id="sup_drop">
							
							<%
					           for(int i=0;i<sList.size();i++){
					        	   SupplierDetailsBean sup =(SupplierDetailsBean)sList.get(i);
							%>
		
							<option data-value="<%=sup.getSupId()%>" value="<%=sup.getDealerName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
		
        	      <label class="col-md-2 control-label" for="billNum" ><b>Bill Number<sup>*</sup></b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									No
								</span>
	              				<input id="billNum" name="billNum" placeholder="Enter Bill Number" class="form-control input-md" type="text" >
	            			</div>
	            		</div>
           						 
           		
			</div>
		
		<div class="row form-group">
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
							<input list="cat_drop" id="fk_cat_id"  class="form-control" onchange="fetchproductname()">
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
		
		
         		<label class="col-md-2 control-label" for="billType">Bill Type<sup>*</sup></label>
         			<div class="col-md-3">
						<div class="col-xs-6 ">	
							<label class="radio-inline">						
								<input type="radio" name="customertype" id="retail" checked="checked"  >No GST
							</label>
						</div>	
      					<div class="col-xs-6 col-md-ffset-1 ">	
							<label class="radio-inline">						
								<input  type="radio" name="customertype" id="vat"  >GST
							</label>
						</div>	
              		</div> 
           </div>
		
			
		 	
			<!-- <script >
			function hideGridWithVat(){
				$("#vatId").hide();
			}
			
			function showGridWithVat(){
				$("#vatId").hide();
			}
		
			</script> -->
						
					
					<div class="row form-group">
					<label class="col-md-2 control-label" for="proName">Product Name<sup>*</sup></label>  
          					  <div class="col-md-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									<select class="form-control" id='proName'  name="proName" onchange="productDetailInGrid()" >
									</select>
										
								</div>
							</div>
					
				
					</div>	
					<div class="row form-group">
				  			
					<label class="col-md-2 control-label" for="dcNum" ><b>DC Number</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									No
								</span>
	              				<input id="dcNum" name="dcNum" placeholder="Enter DC Number" class="form-control input-md" type="text" >
	            			</div>
	            		</div>
						<label class="col-md-2 control-label" for="purchaseDate">Purchase  Date<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
	              					  <input type="date"  id="purchaseDate" name="purchaseDate" placeholder="Purchase Date" class="form-control input-md"">
								
								</div>
							</div>
						
							
					</div>	
						<div class="row form-group">
							
					<%-- 		  <label class="col-md-2 control-label" for="fk_godown_id">Select Godown<sup>*</sup></label>  
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
            		</div> --%>
					</div>	
		<!-- 	<div style='position:absolute; top:440px; left:108px; '> -->
				<table id="jqGrid" ></table>
				<div id="jqGridPager"></div>
			
					<!-- dont delet following row --> 
			<div class="row row form-group">
			
			</div>
			
				<div class="row form-group" >
				<label class="col-md-offset-5 col-md-2 control-label"  for="total" ><b>Total</b></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="total" name="total"  class="form-control input-md" type="text" >
	              				<input readonly="readonly" id="duptotal" name="total"  class="form-control input-md" type="hidden" >
	            			</div>
	            		</div>
					</div>
			
			
				
				<%--  <label class="col-md-2 control-label" for="expensesDescription">Expenses Description</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
						
							<%
							ExpenseDetailForBillingAndGoodsReceiveDao expd = new ExpenseDetailForBillingAndGoodsReceiveDao();
           						List expList =expd.getAllExpenses();
							
							%>
							
							<input list="exp_drop" id="fkExpenseDescriptionId"  class="form-control">
				<datalist id="exp_drop">
							
							<%
					           for(int i=0;i<expList.size();i++){
					        	   ExpenseDetailForBillingAndGoodsReceiveBean expense =(ExpenseDetailForBillingAndGoodsReceiveBean)expList.get(i);
							%>
		
							<option data-value="<%=expense.getPkExpenseForBillingId()%>" value="<%=expense.getExpenseName()%>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div> --%>
				<!-- <label class="col-md-2 control-label"  for="expensesDescription" ><b>Expenses Description</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="expensesDescription" name="expensesDescription" placeholder="Extra Expenses" class="form-control input-md" type="text" >
	            			</div>
	            		</div> -->
				
				
				<div class="row form-group">
				<label class="col-md-2 control-label" for="discount" ><b>Discount </b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="discount" name="discount" placeholder="Discount" class="form-control input-md" type="text" onchange="discountCalculation()">
	            			</div>
	            		</div>
	            		
	            		<label class="col-md-2 control-label" for="discount" ><b>Discount Amount </b></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="discountAmount" name="discountAmount" placeholder="Discount" class="form-control input-md" type="text" >
	            			</div>
	            		</div>
	            		
				</div>
				<div class="row form-group ">
				<label class="col-md-3 col-md-offset-4 control-label"  for="transExpence" ><b>Transportation Expenses</b></label>  
			           	<label class="col-md-1" for="transExpence" ><b></b></label>  
			           	 <div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="transExpenceAmount" name="transExpenceAmount" placeholder="GST %" class="form-control input-md" type="text">
	            			</div>
	            		</div>
			           	
			           	 <div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="transExpence" name="transExpence" placeholder="Transportation Expenses" class="form-control input-md" type="text" onchange ="transExpenseAddingToGrossTotal()">
	            			</div>
	            		</div>
					</div>
					<div class="row form-group ">
					<label class="col-md-2 col-md-offset-5 control-label"  for="hamaliExpence" ><b>Hamali Expenses</b></label>
						<label  class="col-md-1" for="hamaliExpence" ><b></b></label>  
			           	 <div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="hamaliExpenceAmount" name="hamaliExpenceAmount" placeholder="GST %" class="form-control input-md" type="text">
	            			</div>
	            		</div>  
			           	 <div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="hamaliExpence" name="hamaliExpence" placeholder="Hamali Expenses" class="form-control input-md" type="text" onchange ="hamaliExpenseAddingToGross()">
	            			</div>
	            		</div>
					</div>
			<%-- 	<div id="vatId" class="row form-group" >
					<label class=" col-md-2 control-label"  for="grossTotal"><b>Vat %</b></label>  
			           	 
							<%
							TaxCreationDao taxdao = new TaxCreationDao();
		           						List taxlist =taxdao.getAllMainTax();
						
					           for(int i=0;i<taxlist.size();i++){
					        	   TaxCreationBean taxBean =(TaxCreationBean)taxlist.get(i);
							%>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input type="text" value="<%=taxBean.getTaxPercentage()%>" id="taxPercentage" style="height:30; width:225">
							<%
				      			}
				    		%>
			          
	            			</div>
	            		</div>
	            		
	            		<label class="col-md-2 control-label"  for="taxAmount" ><b>Tax Amount</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="taxAmount" name="taxAmount" placeholder="" class="form-control input-md" type="text" >
	            			</div>
	            		</div>
            	</div> --%>
            	
            	
					
					<div class="row form-group" >
					<label class="col-md-2 control-label" for="dueDate">Payment Due Date</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
	                					<input type="date"  id="dueDate" name="dueDate" placeholder="Due Date" class="form-control input-md"">
								
								</div>
							</div> 
					<label class=" col-md-2 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal" name="grossTotal" placeholder="Gross Total" class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
	            		
	            		<div class="col-md-2">
							<div class="input-group">
							<span class="input-group-addon">
									-
								</span>
	              				<input id="roundOff" name="roundOff" placeholder="Round Off" class="form-control input-md" type="text" style="height: 55px;" onchange="roundOffGrossTotal()">
	            			</div>
	            		</div>
            	</div>
		
			<div class="form-group row" >
		            <div class="col-md-10 text-center">
		            
		            <input type="button" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick="batchNoValidate()" value="Submit">
		            <input type="reset" style="font-size: 25" class="btn btn-large btn-danger  button-height-width" id="save" name="btn" value="Cancel">
		               <!-- <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addGoodsRecieve()"><h4> Submit</h4></button>
              			<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
		            </div>
		         </div> 
		</fieldset>
	</form>
	</div>
	<!-- addingGoodsReceive() -->
<!-- 	Already Booked goods receive  -->
	
	<div id="CreditCustDetail">
	 
	 <form class="form-horizontal" method="post" action="" name="advanceGoodsReceive"><!-- Value of 'name' attribute is used in  supplierDetails.js  -->
          <fieldset>
       			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
				
        	       <div class="row form-group">
        	        <label class="col-md-2 control-label" for="supplier">Supplier Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							
										
							<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
								SupplierDetailsDao sdd1 = new SupplierDetailsDao();
           						List sList1 =sdd1.getAllSupplier();
							
							%>
							
							<input list="sup_drop1" id="supplier1"  class="form-control">
				<datalist id="sup_drop1">
							
							<%
					           for(int i=0;i<sList1.size();i++){
					        	   SupplierDetailsBean sup1 =(SupplierDetailsBean)sList1.get(i);
							%>
		
							<option data-value="<%=sup1.getSupId()%>" value="<%=sup1.getDealerName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
		
        	      <label class="col-md-2 control-label" for="billNum" ><b>Bill Number<sup>*</sup></b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									No
								</span>
	              				<input id="billNum1" name="billNum" placeholder="Enter Bill Number" class="form-control input-md" type="text" >
	            			</div>
	            		</div>
           						 
           		
			</div>
		
		<div class="row form-group">
		 <label class="col-md-2 control-label" for="fk_cat_id">Product Category<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							   CategoryDetailsDao dao = new CategoryDetailsDao();
           						List catlist =dao.getAllMainCat();
							
							%>
							<input list="cat_drop1" id="fk_cat_id1"  class="form-control" onchange="getAllProductForBooked()">
				<datalist id="cat_drop1">
							<%
					           for(int i=0;i<catlist.size();i++){
					        	   CategoryDetailsBean cat1=(CategoryDetailsBean)catlist.get(i);
							%>
		
							<option data-value="<%=cat1.getCatId()%>" value="<%=cat1.getCategoryName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>
		
		
         		<label class="col-md-2 control-label" for="billType">Bill Type<sup>*</sup></label>
         			<div class="col-md-3">
						<div class="col-xs-6 ">	
							<label class="radio-inline">						
								<input type="radio" name="customertype" id="retail1" checked="checked"  >No GST
							</label>
						</div>	
      					<div class="col-xs-6 col-md-ffset-1 ">	
							<label class="radio-inline">						
								<input  type="radio" name="customertype" id="vat1" onchange="showGridWithVat()" >GST
							</label>
						</div>	
              		</div> 
           </div>
		
			
		 	
			<!-- <script >
			function hideGridWithVat(){
				$("#vatId").hide();
			}
			
			function showGridWithVat(){
				$("#vatId").hide();
			}
		
			</script> -->
						
					
					<div class="row form-group">
					<label class="col-md-2 control-label" for="proName">Product Name<sup>*</sup></label>  
          					  <div class="col-md-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									<select class="form-control" id='proName1'  name="proName" onchange="prodetails.getAllProductDetailsForBooked()" >
									</select>
										
								</div>
							</div>
					
							
							
					</div>	
					<div class="row form-group">
				  			
					<label class="col-md-2 control-label" for="dcNum" ><b>DC Number</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									No
								</span>
	              				<input id="dcNum1" name="dcNum" placeholder="Enter DC Number" class="form-control input-md" type="text" >
	            			</div>
	            		</div>
					<label class="col-md-2 control-label" for="purchaseDate">Purchase  Date<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
	              					  <input type="date"  id="purchaseDate1" name="purchaseDate" placeholder="Purchase Date" class="form-control input-md"">
								
								</div>
							</div>
						
							
					</div>	
						<div class="row form-group">
							
						<%-- 	  <label class="col-md-2 control-label" for="fk_godown_id">Select Godown<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							   GodownEntryDao down = new GodownEntryDao();
           						List downlist =down.getAllGodown();
							
							%>
							<input list="godown_drop1" id="fk_godown_id1"  class="form-control" >
				<datalist id="godown_drop1">
							<%
					           for(int i=0;i<downlist.size();i++){
					        	   GodownEntry downbean=(GodownEntry)downlist.get(i);
							%>
		
							<option data-value="<%=downbean.getPkGodownId()%>" value="<%=downbean.getGodownName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div> --%>
					</div>	
		
			
				<table id="jqGrid1" ></table>
				<div id="jqGridPager1"></div>
				
					<!-- dont delet following row --> 
			<div class="row row form-group">
			
			</div>
			
				<div class="row form-group" >
				<label class="col-md-offset-5 col-md-2 control-label"  for="total" ><b>Total</b></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="total1" name="total1"  class="form-control input-md" type="text" >
	            			</div>
	            		</div>
					</div>
			
			
		<%-- 		<div class="row form-group" >
				
				 <label class="col-md-2 control-label" for="expensesDescription">Expenses Description</label>  
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
				<!-- <label class="col-md-2 control-label"  for="expensesDescription" ><b>Expenses Description</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="expensesDescription" name="expensesDescription" placeholder="Extra Expenses" class="form-control input-md" type="text" >
	            			</div>
	            		</div> -->
				
				<label class="col-md-2 control-label"  for="expenses" ><b>Extra Expenses</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="	glyphicon glyphicon-hand-right"></i>
								</span>
	              				<input id="extraExpence1" name="extraExpence" placeholder="Extra Expenses" class="form-control input-md" type="text" onchange="expensesAddingToGrossTotalForBooked()">
	            			</div>
	            		</div>
					</div> --%>
				
				<div class="row form-group">
				<label class="col-md-2 control-label" for="discount1" ><b>Discount</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="discount1" name="discount1" placeholder="Discount" class="form-control input-md" type="text" onchange="discountCalculationForBooked()">
	            			</div>
	            		</div>
	            		
	            		<label class="col-md-2 control-label" for="discount" ><b>Discount Amount </b></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="discountAmount1" name="discount" placeholder="Discount" class="form-control input-md" type="text" >
	            			</div>
	            		</div>
	            		
				</div>
				
					<div class="row form-group " >
				<label class="col-md-3 col-md-offset-4 control-label"  for="transExpence" ><b>Transportation Expenses</b></label>  
				<label class="col-md-1" for="transExpence" ><b></b></label>  
			           	 <div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="transExpenceAmount1" name="transExpenceAmount1" placeholder="GST %" class="form-control input-md" type="text">
	            			</div>
	            		</div>
			           	 <div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="transExpence1" name="transExpence" placeholder="Transportation Expenses" class="form-control input-md" type="text" onchange="transExpenseAddingToGrossTotalForBooked()">
	            			</div>
	            		</div>
					</div>
					<div class="row form-group" >
					<label class="col-md-2 col-md-offset-5 control-label"  for="hamaliExpence" ><b>Hamali Expenses</b></label>  
			           	<label  class="col-md-1" for="hamaliExpence" ><b></b></label>  
			           	 <div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="hamaliExpenceAmount1" name="hamaliExpenceAmount1" placeholder="GST %" class="form-control input-md" type="text">
	            			</div>
	            		</div>
			           	
			           	 <div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="hamaliExpence1" name="hamaliExpence" placeholder="Hamali Expenses" class="form-control input-md" type="text" onchange = "hamaliExpenseAddingToGrossForBooked()">
	            			</div>
	            		</div>
					</div>
			<%-- 	<div id="vatId" class="row form-group" >
					<label class=" col-md-2 control-label"  for="grossTotal"><b>Vat %</b></label>  
			           	 
							<%
							TaxCreationDao taxdao = new TaxCreationDao();
		           						List taxlist =taxdao.getAllMainTax();
						
					           for(int i=0;i<taxlist.size();i++){
					        	   TaxCreationBean taxBean =(TaxCreationBean)taxlist.get(i);
							%>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input type="text" value="<%=taxBean.getTaxPercentage()%>" id="taxPercentage" style="height:30; width:225">
							<%
				      			}
				    		%>
			          
	            			</div>
	            		</div>
	            		
	            		<label class="col-md-2 control-label"  for="taxAmount" ><b>Tax Amount</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input id="taxAmount" name="taxAmount" placeholder="" class="form-control input-md" type="text" >
	            			</div>
	            		</div>
            	</div> --%>
            	
            	
					
					<div class="row form-group" >
					<label class="col-md-2 control-label" for="dueDate">Payment Due Date</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
	                					<input type="date"  id="dueDate1" name="dueDate" placeholder="Due Date" class="form-control input-md"">
								
								</div>
							</div> 
					<label class=" col-md-2 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal1" name="grossTotal" placeholder="Gross Total" class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
	            		
	            		<div class="col-md-2">
							<div class="input-group">
							<span class="input-group-addon">
								-
								</span>
	              				<input id="roundOff1" name="roundOff1" placeholder="Round Off" class="form-control input-md" type="text" style="height: 55px;" onchange="roundOffGrossTotalForBooked()">
	            			</div>
	            		</div>
            	</div>
		
			<div class="form-group row" >
		            <div class="col-md-10 text-center">
		            
		            <input type="button" id="btn1" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn1" onclick="batchNoValidateForBooked()" value="Submit">
		            <input type="reset" id="save" style="font-size: 25" class="btn btn-large btn-danger   button-height-width" name="btn1" value="Cancel">
		            
		               <!-- <button id="save" name="btn1" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addbookedGoodReceive()"><h4> Submit</h4></button>
              			<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
		            </div>
		         </div> 
		</fieldset>
	</form>
	 
	 </div>
</div>

<%@include file="commons/newFooter.jsp" %>

</body>			
