

//Add goods receive
function addingGoodsReceive(){
	if(document.goodsReceiveForm.supplier.value == "")
	{
		alert("Please select Supplier Name");
		return false;
	}
	if(document.goodsReceiveForm.billNum.value == "")
	{
		alert("Please Enter Bill Number");
		return false;
	}
	var letterNumber = /^[a-zA-Z0-9, ]+$/;
	 if(document.goodsReceiveForm.billNum.value.match(letterNumber))
	 {
	if(document.goodsReceiveForm.fk_cat_id.value == "")
	{
		alert("Please Select Product Category");
		return false;
	}
	if(document.goodsReceiveForm.proName.value == "")
	{
		alert("Please Select Product Name");
		return false;
	}
	/*if(document.goodsReceiveForm.dcNum.value == "")
	{
		alert("Please Enter DC Number");
		return false;
	}*/
	if(document.goodsReceiveForm.purchaseDate.value == "")
	{
		alert("Please Select purchase Date");
		return false;
	}
	/*if(document.goodsReceiveForm.fk_godown_id.value == "")
	{
		alert("Please Select Godown");
		return false;
	}*/
	/*if(document.goodsReceiveForm.discount.value == "")
	{   	
		alert("Please Enter Discount in % ");
		return false;
	}*/
/*	var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/;
	var num = /^\d+$/;
	 if(document.goodsReceiveForm.discount.value.match(letterNumber) || document.goodsReceiveForm.discount.value.match(num) )
	 {
	if(document.goodsReceiveForm.transExpence.value == "")
	{
		alert("Please Enter Transportation Expense ");
		return false;
	}
	var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/;
	var num = /^\d+$/;
	 if(document.goodsReceiveForm.transExpence.value.match(letterNumber) || document.goodsReceiveForm.transExpence.value.match(num) )
	 {
		 if(document.goodsReceiveForm.dueDate.value == "")
			{
				alert("Please Select Payment Due Date ");
				return false;
			}
	if(document.goodsReceiveForm.hamaliExpence.value == "")
	{
		alert("Please Enter Hamali Expense ");
		return false;
	}
	var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/;
		var num = /^\d+$/;
		 if(document.goodsReceiveForm.hamaliExpence.value.match(letterNumber) || document.goodsReceiveForm.hamaliExpence.value.match(num) )
		 {*/
	
	
	addGoodsRecieve();
}
	/*	 else
			{
				alert("Enter only Numbers upto 2 decimal in Hamali Expense field..!!");
				return false;
			} 
		 }
	 else
		{
			alert("Enter only Numbers upto 2 decimal in Transportation Expense field..!!");
			return false;
		} 
	 }
	 else
	 {
			alert("Enter only Numbers upto 2 decimal in Discount field..!!");
			return false;
		} 
	 }*/
	 else
	 {
			alert("Enter only Alphanumeric in Bill Number field..!!");
			return false;
		} 
	 }

function addGoodsRecieve(){

	
	document.getElementById("btn").disabled = true;
	var params = {};
	
	
/*	var input = document.getElementById('fk_godown_id'),
    list1 = document.getElementById('godown_drop'),
    i,fk_godown_id;

	for (i = 0; i < list1.options.length; ++i) {
    if (list1.options[i].value === input.value) {
    	fk_godown_id = list1.options[i].getAttribute('data-value');
    }
}*/
	

	
	var input = document.getElementById('supplier'),
    list = document.getElementById('sup_drop'),
    i,supplier;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
   	 supplier = list.options[i].getAttribute('data-value');
    }
}

	
	var supplier = supplier;
	
	var input1 = document.getElementById('fk_cat_id'),
	list = document.getElementById('cat_drop'),
	i,fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var catName = document.getElementById('fk_cat_id').value;
	var dcNum = $('#dcNum').val();
	var expenses = $('#extraExpence').val();
	var grossTotal = $('#grossTotal').val();
	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {
		
		var catId = allRowsInGrid[i].catId;
		params["catId"+i] = catId;
		
		var productID = allRowsInGrid[i].productID;
		params["productID"+i] = productID;
		
		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
		
		var hsn = allRowsInGrid[i].hsn;
		params["hsn"+i] = hsn;
		
		var companyName = allRowsInGrid[i].manufacturer;
		params["companyName"+i] = companyName;
		
		var buyPrice = allRowsInGrid[i].buyPrice;
		params["buyPrice"+i] = buyPrice;
		
		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice"+i] = salePrice;
		
		var weight = allRowsInGrid[i].weight;
		params["weight"+i] = weight;
		
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i] = quantity;
		
		var batchNo = allRowsInGrid[i].batchNo;
		params["batchNo"+i] = batchNo;
		
		var expiryDate = allRowsInGrid[i].expiryDate;
		params["expiryDate"+i] = expiryDate;

		if(batchNo==undefined || batchNo== null || batchNo == "" ){
			batchNo="'N/A'";
		}
		
		if(expiryDate==undefined || expiryDate== null || expiryDate == "" ){
			expiryDate=0000-00-00;
		}
		
		var cGst = allRowsInGrid[i].cGst;
		if(cGst==undefined || cGst== null ){
		params["cGst"+i] = 0;
		}
		else if(cGst!=undefined || cGst!= null ){
		params["cGst"+i] = cGst;
		}
		
		var sGst = allRowsInGrid[i].sGst;
		if(sGst==undefined || sGst== null ){
			params["sGst"+i] = 0;
		}
		else if(sGst!=undefined || sGst!= null ){
			params["sGst"+i] = sGst;
		}
		
		
		var iGst = allRowsInGrid[i].iGst;
		if(iGst==undefined || iGst== null ){
			params["iGst"+i] = 0;
		}
		else if(iGst!=undefined || iGst!= null ){
			params["iGst"+i] = iGst;
		}
		
		
		var mrp = allRowsInGrid[i].mrp;
		params["mrp"+i] = mrp;
		
		var Total = allRowsInGrid[i].Total;
		params["Total"+i] = Total;
		
	}
	
	
	
	var transExpence = $('#transExpence').val();
	var hamaliExpence = $('#hamaliExpence').val();
	var GSTtransExpence = $('#transExpenceAmount').val();
	var GSThamaliExpence = $('#hamaliExpenceAmount').val();
	var dueDate = $('#dueDate').val();
	var purchaseDate = $('#purchaseDate').val();
	var billtype = $('#billtype').val();
	var expensesDescription = $('#expensesDescription').val();
	var discount = $('#discount').val();
	var discountAmount = $('#discountAmount').val();
	var billNum = $('#billNum').val();

	if(GSTtransExpence==undefined || GSTtransExpence== null || GSTtransExpence == "" ){
		GSTtransExpence=0;
	}
	if(GSThamaliExpence==undefined || GSThamaliExpence== null || GSThamaliExpence == "" ){
		GSThamaliExpence=0;
	}
	
	if(transExpence==undefined || transExpence== null || transExpence == "" ){
		transExpence=0;
	}
	if(hamaliExpence==undefined || hamaliExpence== null || hamaliExpence == "" ){
		hamaliExpence=0;
	}
	if(discount==undefined || discount== null || discount == "" ){
		discount=0;
	}
	if(discountAmount==undefined || discountAmount== null || discountAmount == "" ){
		discountAmount=0.0;
	}
	if(transExpence==undefined || transExpence== null || transExpence == "" ){
		transExpence=0;
	}
	if(dcNum==undefined || dcNum== null || dcNum == "" ){
		dcNum=0;
	}
	if(dueDate==undefined || dueDate== null || dueDate == "" ){
		dueDate=0000-00-00;
	}
	/*if(fk_godown_id==undefined || fk_godown_id== null || fk_godown_id == "" ){
		fk_godown_id=0;
	}*/
	
	
	params["catName"] = catName;
	params["dueDate"] = dueDate;
	params["purchaseDate"] = purchaseDate;
	params["billtype"] = billtype;
	params["fk_godown_id"] = 0;
	params["billNum"] = billNum;
	params["catId"] = catId;
	params["supplier"] = supplier;
	params["dcNum"] = dcNum;
	params["count"] = count;
	params["discount"] = discount;
	params["discountAmount"] = discountAmount;
	params["transExpence"] = transExpence;
	params["hamaliExpence"] = hamaliExpence;
	params["GSThamaliExpence"] = GSThamaliExpence;
	params["GSTtransExpence"] = GSTtransExpence;
	params["grossTotal"] = grossTotal;
	
	params["methodName"] = "addingGoodsReceive";
	
	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				location.reload();
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
	

}

/*++++++++++++ Advance Booked Goods Receive adding to goods recive table +++++++++++*/
function addBookedGoodsReceive(){
if(document.advanceGoodsReceive.supplier1.value == "")
{
	alert("Please select Supplier Name");
	return false;
}
if(document.advanceGoodsReceive.billNum1.value == "")
{
	alert("Please Enter Bill Number");
	return false;
}
if(document.advanceGoodsReceive.fk_cat_id1.value == "")
{
	alert("Please Select Product Category");
	return false;
}
if(document.advanceGoodsReceive.proName1.value == "")
{
	alert("Please Select Product Name");
	return false;
}
/*if(document.advanceGoodsReceive.dcNum1.value == "")
{
	alert("Please Enter DC Number");
	return false;
}*/
if(document.advanceGoodsReceive.purchaseDate1.value == "")
{
	alert("Please Select purchase Date");
	return false;
}
/*if(document.advanceGoodsReceive.fk_godown_id1.value == "")
{
	alert("Please Select Godown");
	return false;
}
if(document.advanceGoodsReceive.discount1.value == "")
{   	
	alert("Please Enter Discount in % ");
	return false;
}
if(document.advanceGoodsReceive.transExpence1.value == "")
{
	alert("Please Enter Transportation Expense ");
	return false;
}
if(document.advanceGoodsReceive.hamaliExpence1.value == "")
{
	alert("Please Enter Hamali Expense ");
	return false;
}
if(document.advanceGoodsReceive.dueDate1.value == "")
{
	alert("Please Select Payment Due Date ");
	return false;
}*/

addbookedGoodReceive();

}


function addbookedGoodReceive(){

	
	document.getElementById("btn1").disabled = true;
	var params = {};
	
	
/*	var input = document.getElementById('fk_godown_id1'),
    list1 = document.getElementById('godown_drop1'),
    i,fk_godown_id;

	for (i = 0; i < list1.options.length; ++i) {
    if (list1.options[i].value === input.value) {
    	fk_godown_id = list1.options[i].getAttribute('data-value');
    }
}
	*/
	
	/*var input = document.getElementById('fkExpenseDescriptionId1'),
    list1 = document.getElementById('exp_drop1'),
    i,fk_expense_id;

	for (i = 0; i < list1.options.length; ++i) {
    if (list1.options[i].value === input.value) {
    	fk_expense_id = list1.options[i].getAttribute('data-value');
    }
}
*/	
	//var fkExpenseId = fk_expense_id;
	
	var input = document.getElementById('supplier1'),
    list = document.getElementById('sup_drop1'),
    i,supplier;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
   	 supplier = list.options[i].getAttribute('data-value');
    }
}

	
	var supplier = supplier;
	
	var input1 = document.getElementById('fk_cat_id1'),
	list = document.getElementById('cat_drop1'),
	i,fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var catName = document.getElementById('fk_cat_id1').value;
	var dcNum = $('#dcNum1').val();
	var expenses = $('#extraExpence1').val();
	var grossTotal = $('#grossTotal1').val();
	var count = jQuery("#jqGrid1").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid1').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var catId = allRowsInGrid[i].catId;
		params["catId"+i] = catId;
		
		var productID = allRowsInGrid[i].productID;
		params["productID"+i] = productID;
		
		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
		
		var hsn = allRowsInGrid[i].hsn;
		params["hsn"+i] = hsn;
		
		var companyName = allRowsInGrid[i].manufacturer;
		params["companyName"+i] = companyName;
		
		var buyPrice = allRowsInGrid[i].buyPrice;
		params["buyPrice"+i] = buyPrice;
		
		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice"+i] = salePrice;
		
		var weight = allRowsInGrid[i].weight;
		params["weight"+i] = weight;
		
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i] = quantity;
		
		var batchNo = allRowsInGrid[i].batchNo;
		params["batchNo"+i] = batchNo;
		
		var expiryDate = allRowsInGrid[i].expiryDate;
		params["expiryDate"+i] = expiryDate;
	
		
		if(batchNo==undefined || batchNo== null || batchNo == "" ){
			batchNo="'N/A'";
		}
		if(expiryDate==undefined || expiryDate== null || expiryDate == "" ){
			expiryDate=0000-00-00;
		}
		
		
		var cGst = allRowsInGrid[i].cGst;
		if(cGst==undefined || cGst== null ){
		params["cGst"+i] = 0;
		}
		else if(cGst!=undefined || cGst!= null ){
		params["cGst"+i] = cGst;
		}
		
		var sGst = allRowsInGrid[i].sGst;
		if(sGst==undefined || sGst== null ){
			params["sGst"+i] = 0;
		}
		else if(sGst!=undefined || sGst!= null ){
			params["sGst"+i] = sGst;
		}
		
		
		var iGst = allRowsInGrid[i].iGst;
		if(iGst==undefined || iGst== null ){
			params["iGst"+i] = 0;
		}
		else if(iGst!=undefined || iGst!= null ){
			params["iGst"+i] = iGst;
		}
		
		
		var mrp = allRowsInGrid[i].mrp;
		params["mrp"+i] = mrp;
		
	}
	
	var transExpence = $('#transExpence1').val();
	var hamaliExpence = $('#hamaliExpence1').val();
	var GSTForHamali = $('#hamaliExpenceAmount1').val();
	var GSTForTrans = $('#transExpenceAmount1').val();
	var dueDate = $('#dueDate1').val();
	var purchaseDate = $('#purchaseDate1').val();
	var billtype = $('#billtype1').val();
	var expensesDescription = $('#expensesDescription1').val();
	var discount = $('#discount1').val();
	var discountAmount = $('#discountAmount1').val();
	var billNum = $('#billNum1').val();

	
	if(GSTForHamali==undefined || GSTForHamali== null || GSTForHamali == "" ){
		GSTForHamali=0;
	}
	if(GSTForTrans==undefined || GSTForTrans== null || GSTForTrans == "" ){
		GSTForTrans=0;
	}
	

	if(transExpence==undefined || transExpence== null || transExpence == "" ){
		transExpence=0;
	}
	if(hamaliExpence==undefined || hamaliExpence== null || hamaliExpence == "" ){
		hamaliExpence=0;
	}
	if(discount==undefined || discount== null || discount == "" ){
		discount=0;
	}
	if(discountAmount==undefined || discountAmount== null || discountAmount == "" ){
		discountAmount=0.0;
	}
	if(transExpence==undefined || transExpence== null || transExpence == "" ){
		transExpence=0;
	}
	if(dcNum==undefined || dcNum== null || dcNum == "" ){
		dcNum=0;
	}
	if(dueDate==undefined || dueDate== null || dueDate == "" ){
		dueDate=0000-00-00;
	}
	/*if(fk_godown_id==undefined || fk_godown_id== null || fk_godown_id == "" ){
		fk_godown_id=0;
	}
	*/
	
	params["catName"] = catName;
	params["dueDate"] = dueDate;
	params["purchaseDate"] = purchaseDate;
	params["billtype"] = billtype;
	params["fk_godown_id"] = 0;
	params["billNum"] = billNum;
	params["fk_cat_id"] = fk_cat_id;
	params["supplier"] = supplier;
	params["dcNum"] = dcNum;
	params["count"] = count;
	params["discount"] = discount;
	params["discountAmount"] = discountAmount;
	params["transExpence"] = transExpence;
	params["hamaliExpence"] = hamaliExpence;
	params["grossTotal"] = grossTotal;
	params["GSThamaliExpence"] = GSTForHamali;
	params["GSTtransExpence"] = GSTForTrans;
	
	
	params["methodName"] = "addingGoodsReceive";
	
	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				location.reload();
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
	

}

 /********************Purchase Reports *************/

/********* Single Date *********/

function purchaseReportForSingleDate(){
	
	var params= {};
	var fDate = $("#fDate").val();
	
	
	params["fDate"]= fDate;
	
	params["methodName"] = "getPurchaseDetailsForSingleDate";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchase1').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		var totAmt = jsonData.totalAmt ;
		console.log(catmap);
		
		$(document).ready(function() {
		 var total =   $('#purchase1').DataTable( {
			 dom: 'Bfrtip',
		        buttons: [
		            'copy', ' csv', ' excel', 'pdf', 'print'
		        ],
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
			
		 /*"footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api(), data;
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ?
		                        i : 0;
		            };
		 
		            // Total over all pages
		             total = api
		                .column( 7 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 ); 
		 			console.log(total); 
		            // Total over this page
		            pageTotal = api
		                .column( 5 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		         
		            // Update footer
		            $( api.column( 7 ).footer() ).html(
		              //  'Rs'+' '+pageTotal.toFixed(2)
		            		 str = pageTotal.toFixed(0)
		            );
		            console.log( pageTotal);
		            
		            // Total over this page       
		         		         
		            
		            
		        },
		    	*/
		    	
		    	destroy: true,
		        searching: false,
		       
		columns: [
		          	{"data": "billNo", "width": "5%", "defaultContent":""},
		            {"data": "purchaseDate", "width": "5%", "defaultContent":""},
		            {"data": "productName", "width": "5%", "defaultContent":""},
		            {"data": "companyName" , "width": "5%", "defaultContent":""},
		            {"data": "dcNo" , "width": "5%", "defaultContent":""},
		            {"data": "batchNo" , "width": "5%", "defaultContent":""},
		            {"data": "barcodeNo" , "width": "5%", "defaultContent":""},
		            {"data": "buyPrice", "width": "5%", "defaultContent":""},
		            {"data": "salePrice" , "width": "5%", "defaultContent":""},
		            {"data": "mrp" , "width": "5%", "defaultContent":""},
		            {"data": "weight" , "width": "5%", "defaultContent":""},
		            {"data": "quantity2", "width": "5%", "defaultContent":""},
		            {"data": "totalAmount" , "width": "5%", "defaultContent":""}
		        ],
		       
		    } );
		} );
		
	var mydata = catmap;
	$('#purchase1').dataTable().fnAddData(mydata);
	
		}
	

);

}

	
	
/***************	Between Two Dates ***********/
	
	
function purchaseReportBetweenTwoDates(){

	var params= {};
	var startDate = $("#fisDate2").val();
	var endDate = $("#endDate2").val();

	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	params["methodName"] = "getPurchaseReportBetweenTwoDates";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
		$('#purchase2').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
	
		$(document).ready(function() {
		 var total =   $('#purchase2').DataTable( {
			
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
		
		    	destroy: true,
		        searching: false,
		        
		      
		columns: [
		          			{"data": "billNo", "width": "5%", "defaultContent":""},
				            {"data": "purchaseDate", "width": "5%", "defaultContent":""},
				            {"data": "productName", "width": "5%", "defaultContent":""},
				            {"data": "companyName" , "width": "5%", "defaultContent":""},
				            {"data": "dcNo" , "width": "5%", "defaultContent":""},
				            {"data": "batchNo" , "width": "5%", "defaultContent":""},
				            {"data": "barcodeNo" , "width": "5%", "defaultContent":""},
				            {"data": "buyPrice", "width": "5%", "defaultContent":""},
				            {"data": "salePrice" , "width": "5%", "defaultContent":""},
				            {"data": "mrp" , "width": "5%", "defaultContent":""},
				            {"data": "weight" , "width": "5%", "defaultContent":""},
				            {"data": "quantity2", "width": "5%", "defaultContent":""},
				            {"data": "totalAmount" , "width": "5%", "defaultContent":""}
		        ],
	            
	            dom: 'Bfrtip',
	            buttons: [
	                'copy', 'csv', 'excel', 'pdf', 'print'
	            ]
		    } );
		} );
		
	var mydata = catmap;
	$('#purchase2').dataTable().fnAddData(mydata);
	
		}

	);

	
}	
/*Supplier wise purchase report*/ 

function supplierWisePurchaseReport(){
	
	var params= {};
	
	var input11 = document.getElementById('fkSupplierId'),
	list1 = document.getElementById('sup_drop'),
	i,fk_supplier_id;
	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input11.value) {
			fk_supplier_id = list1.options[i].getAttribute('data-value');
		}
	}
	
	
	params["supplier"]= fk_supplier_id;
	
	params["methodName"] = "getPurchaseDetailsAsPerSupplier";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchase3').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		
		
		$(document).ready(function() {
		 var total =   $('#purchase3').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
	
		    	
		    	destroy: true,
		        searching: false,
		        
		        
		columns: [
		          			{"data": "supplier", "width": "5%"},
		          			{"data": "billNo", "width": "5%"},
				            {"data": "purchaseDate", "width": "5%"},
				            {"data": "productName", "width": "5%"},
				            {"data": "companyName" , "width": "5%"},
				            {"data": "dcNo" , "width": "5%"},
				            {"data": "batchNo" , "width": "5%"},
				            {"data": "barcodeNo" , "width": "5%"},
				            {"data": "buyPrice", "width": "5%"},
				            {"data": "salePrice" , "width": "5%"},
				            {"data": "mrp" , "width": "5%"},
				            {"data": "weight" , "width": "5%"},
				            {"data": "quantity2", "width": "5%"},
				            {"data": "totalAmount" , "width": "5%"}
		        ],
		      
		        dom: 'Bfrtip',
	            buttons: [
	                'copy', 'csv', 'excel', 'pdf', 'print'
	            ]
		    } );
		} );
		
	var mydata = catmap;
	$('#purchase3').dataTable().fnAddData(mydata);
	
		}
	

	);

	
}

function supplierWisePurchaseReturnReport(){
	var params= {};
	
	var input11 = document.getElementById('fkSupplierId_Purchase_Return'),
	list1 = document.getElementById('sup_drop_Purchase_return'),
	i,fk_supplier_id_purchase_return;
	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input11.value) {
			fk_supplier_id_purchase_return = list1.options[i].getAttribute('data-value');
		}
	}
	
	var firstDate = $("#purchaseReturnFisDate").val();
	var secondDate = $("#purchaseReturnEndDate").val();
	
	params["supplier"]= fk_supplier_id_purchase_return;
	params["firstDate"]= firstDate;
	params["secondDate"]= secondDate;
	
	params["methodName"] = "getPurchaseReturnDetailsAsPerSupplierBetweenTwoDate";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchaseReturnTable').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		
		
		$(document).ready(function() {
		 var total =   $('#purchaseReturnTable').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
	
		    	
		    	destroy: true,
		        searching: false,
		        
		        
		columns: [
		          			{"data": "supplier", "width": "5%"},
		          			{"data": "billNo", "width": "5%"},
				            {"data": "purchaseDate", "width": "5%"},
				            {"data": "productName", "width": "5%"},
				            {"data": "companyName" , "width": "5%"},
				            {"data": "dcNo" , "width": "5%"},
				            {"data": "batchNo" , "width": "5%"},
				            {"data": "barcodeNo" , "width": "5%"},
				            {"data": "buyPrice", "width": "5%"},
				            {"data": "salePrice" , "width": "5%"},
				            {"data": "mrp" , "width": "5%"},
				            {"data": "weight" , "width": "5%"},
				            {"data": "quantity2", "width": "5%"},
				            {"data": "returnQuantity", "width": "5%"},
				            {"data": "remainingQuantity", "width": "5%"},
		        ],
		      
		        dom: 'Bfrtip',
	            buttons: [
	                'copy', 'csv', 'excel', 'pdf', 'print'
	            ]
		    } );
		} );
		
	var mydata = catmap;
	$('#purchaseReturnTable').dataTable().fnAddData(mydata);
	
		}
	

	);

	

}
	
	/*product wise Purchase report*/
	
	function purchaseReportAsPerProductName(){
		
		var params= {};
		
		var input1 = document.getElementById('fk_cat_id'),
		list = document.getElementById('cat_drop'),
		i,fk_cat_id;
		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input1.value) {
				fk_cat_id = list.options[i].getAttribute('data-value');
			}
		}
		
		
		var fk_cat_id = fk_cat_id;
		//var product = $('#proName').val();
		
		$("#proName option:selected").each(function() {
			   selectedVal = $(this).text();
			});
		
		var splitText = selectedVal.split(",");
		
		var proName = splitText[0];
		var company = splitText[1];
		var weight = splitText[2];
		
		params["proName"]= proName;
		params["company"]= company;
		params["weight"]= weight;
		
		
		
		params["cat"]= fk_cat_id;
		//params["product"]= product;
		
		params["methodName"] = "getPurchaseDetailsAsPerProduct";
	
		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
				{
			
			$('#purchaseAsPerProduct').dataTable().fnClearTable();
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			
			
			
			$(document).ready(function() {
			 var total =   $('#purchaseAsPerProduct').DataTable( {
				 
				 fnRowCallback : function(nRow, aData, iDisplayIndex){
		                $("th:first", nRow).html(iDisplayIndex +1);
		               return nRow;
		            },
				
			/* "footerCallback": function ( row, data, start, end, display ) {
			            var api = this.api(), data;
			 
			            // Remove the formatting to get integer data for summation
			            var intVal = function ( i ) {
			                return typeof i === 'string' ?
			                    i.replace(/[\$,]/g, '')*1 :
			                    typeof i === 'number' ?
			                        i : 0;
			            };
			 
			            // Total over all pages
			             total = api
			                .column( 8 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 ); 
			 			console.log(total); 
			            // Total over this page
			            pageTotal = api
			                .column( 5 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			         
			            // Update footer
			            $( api.column( 8 ).footer() ).html(
			              //  'Rs'+' '+pageTotal.toFixed(2)
			            		 str = pageTotal.toFixed(0)
			            );
			            console.log( pageTotal);
			            
			            // Total over this page       
		         		         
			            
			            
			        },
			    
		*/		    	
			    	destroy: true,
			        searching: false,
			        
			      
			columns: [
			          	{"data": "billNo", "width": "5%"},
			            {"data": "productName", "width": "5%"},
			            {"data": "purchaseDate", "width": "5%"},
			            {"data": "buyPrice" , "width": "5%"},
			            {"data": "salePrice" , "width": "5%"},
			            {"data": "weight" , "width": "5%"},
			            {"data": "quantity2" , "width": "5%"},
			           /* {"data": "expense", "width": "5%"},*/
			            {"data": "totalAmount" , "width": "5%"}
			        ],
			        dom: 'Bfrtip',
		            buttons: [
		                'copy', 'csv', 'excel', 'pdf', 'print'
		            ]
			        
			    } );
			} );
			
		var mydata = catmap;
		$('#purchaseAsPerProduct').dataTable().fnAddData(mydata);
		
			}
		

		);
		
		
		
	
		
	}
	
/*	Category Wise Purchase report*/
	
	function purchaseReportAsPerCat(){
		
		var params= {};
		
		var input1 = document.getElementById('fk_cat_id6'),
		list = document.getElementById('cat_drop6'),
		i,fk_cat_id;
		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input1.value) {
				fk_cat_id = list.options[i].getAttribute('data-value');
			}
		}
		
		
		var fk_cat_id = fk_cat_id;
		params["cat"]= fk_cat_id;
		params["methodName"] = "getPurchaseDetailsAsPerCategory";
	
		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
				{
			
			$('#purchaseCatWise').dataTable().fnClearTable();
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			
			
			
			$(document).ready(function() {
			 var total =   $('#purchaseCatWise').DataTable( {
				 
				 fnRowCallback : function(nRow, aData, iDisplayIndex){
		                $("th:first", nRow).html(iDisplayIndex +1);
		               return nRow;
		            },
			
			    	destroy: true,
			        searching: false,
			        
			      
			columns: [
			          			
			          			{"data": "billNo", "width": "5%"},
					            {"data": "purchaseDate", "width": "5%"},
					            {"data": "productName", "width": "5%"},
					            {"data": "companyName" , "width": "5%"},
					            {"data": "dcNo" , "width": "5%"},
					            {"data": "batchNo" , "width": "5%"},
					            {"data": "barcodeNo" , "width": "5%"},
					            {"data": "buyPrice", "width": "5%"},
					            {"data": "salePrice" , "width": "5%"},
					            {"data": "mrp" , "width": "5%"},
					            {"data": "weight" , "width": "5%"},
					            {"data": "quantity2", "width": "5%"},
					            {"data": "totalAmount" , "width": "5%"}
			        ],
			        /*dom: 'Bfrtip',
		            buttons: [
		                'copy', 'csv', 'excel', 'pdf', 'print'
		            ]*/
			        
			    } );
			} );
			
		var mydata = catmap;
		$('#purchaseCatWise').dataTable().fnAddData(mydata);
		
			}
		

		);
		
	}
	
	// Gross total round off for without booking Goods Receive
	function roundOffGrossTotal(){
		var grossTotal  = $('#grossTotal').val(); 
		var roundOff  = $('#roundOff').val();  
		var grossTotalRoundOffValue = Number(grossTotal) - Number(roundOff);
		document.getElementById("grossTotal").value = grossTotalRoundOffValue;
	}

	// Gross total round off for with booked Goods Receive
	function roundOffGrossTotalForBooked(){
		var grossTotal  = $('#grossTotal1').val(); 
		var roundOff  = $('#roundOff1').val();  
		var grossTotalRoundOffValue = Number(grossTotal) - Number(roundOff);
		document.getElementById("grossTotal1").value = grossTotalRoundOffValue;
	}
	
	
	
/*	GST purchase Report*/
	function purchaseReportAsPerGST(){

		var params= {};
		var startDate = $("#gstFisDate").val();
		var endDate = $("#gstEndDate").val();

		params["gstFisDate"]= startDate;
		params["gstEndDate"]= endDate;
		params["methodName"] = "getGSTPurchaseReport";

		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
{
			$('#gstPurchaseReportTable').dataTable().fnClearTable();
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;

			$(document).ready(function() {
			 var total =   $('#gstPurchaseReportTable').DataTable( {
				 
				 fnRowCallback : function(nRow, aData, iDisplayIndex){
		                $("th:first", nRow).html(iDisplayIndex +1);
		               return nRow;
		            },
				
					"footerCallback": function ( row, data, start, end, display ) {
				            var api = this.api(), data;
				 
				            // Remove the formatting to get integer data for summation
				            var intVal = function ( i ) {
				                return typeof i === 'string' ?
				                    i.replace(/[\$,]/g, '')*1 :
				                    typeof i === 'number' ?
				                        i : 0;
				            };
				 
				            // Total over all pages
				             total = api
				                .column( 6 )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 ); 
				 			console.log(total); 
				            // Total over this page
				            //for item Rate total
				            pageTotal = api
				                .column( 7 )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 );
				 
				            // Update footer
				            $( api.column( 7 ).footer() ).html(
				            		
				              parseFloat(pageTotal).toFixed(2)
				               
				            );
				            console.log( pageTotal);
			            
				            // Quantity total
				            pageTotal = api
			                .column( 8 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			            // Update footer
			            $( api.column( 8 ).footer() ).html(
			            		
			              parseFloat(pageTotal).toFixed(2)
			               
			            );
			            console.log( pageTotal);
			            
			            // Quantity total
			            pageTotal = api
		                .column( 9 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 9 ).footer() ).html(
		            		
		              parseFloat(pageTotal).toFixed(2)
		               
		            );
		            console.log( pageTotal);
		            
		            pageTotal = api
	                .column( 10 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	            // Update footer
	            $( api.column( 10 ).footer() ).html(
	            		
	              parseFloat(pageTotal).toFixed(2)
	               
	            );
	            console.log( pageTotal);
	        
	            // Quantity total
	            pageTotal = api
	            .column( 11 )
	            .data()
	            .reduce( function (a, b) {
	                return intVal(a) + intVal(b);
	            }, 0 );

	        // Update footer
	        $( api.column( 11 ).footer() ).html(
	        		
	          parseFloat(pageTotal).toFixed(2)
	           
	        );
	        console.log( pageTotal);
	        
	        // Quantity total
	        pageTotal = api
	        .column( 12 )
	        .data()
	        .reduce( function (a, b) {
	            return intVal(a) + intVal(b);
	        }, 0 );

	    // Update footer
	    $( api.column( 12 ).footer() ).html(
	    		
	      parseFloat(pageTotal).toFixed(2)
	       
	    );
	    console.log( pageTotal);
	    
	    
	    pageTotal = api
	    .column( 13 )
	    .data()
	    .reduce( function (a, b) {
	        return intVal(a) + intVal(b);
	    }, 0 );

	// Update footer
	$( api.column( 13 ).footer() ).html(
			
	  parseFloat(pageTotal).toFixed(2)
	   
	);
	console.log( pageTotal);

	// Quantity total
	pageTotal = api
	.column( 14 )
	.data()
	.reduce( function (a, b) {
	    return intVal(a) + intVal(b);
	}, 0 );

	// Update footer
	$( api.column( 14 ).footer() ).html(
		
	parseFloat(pageTotal).toFixed(2)

	);
	console.log( pageTotal);

	// Quantity total
	pageTotal = api
	.column( 15 )
	.data()
	.reduce( function (a, b) {
	return intVal(a) + intVal(b);
	}, 0 );

	// Update footer
	$( api.column( 15 ).footer() ).html(

	parseFloat(pageTotal).toFixed(2)

	);
	console.log( pageTotal);

	pageTotal = api
	.column( 16 )
	.data()
	.reduce( function (a, b) {
	return intVal(a) + intVal(b);
	}, 0 );

	// Update footer
	$( api.column( 16 ).footer() ).html(

	parseFloat(pageTotal).toFixed(2)

	);
	console.log( pageTotal);

	// Quantity total
	pageTotal = api
	.column( 17 )
	.data()
	.reduce( function (a, b) {
	return intVal(a) + intVal(b);
	}, 0 );

	// Update footer
	$( api.column( 17 ).footer() ).html(

	parseFloat(pageTotal).toFixed(2)

	);
	console.log( pageTotal);

	// Quantity total
	pageTotal = api
	.column( 18 )
	.data()
	.reduce( function (a, b) {
	return intVal(a) + intVal(b);
	}, 0 );

	// Update footer
	$( api.column( 18 ).footer() ).html(

	parseFloat(pageTotal).toFixed(2)

	);
	console.log( pageTotal);

	//Quantity total
	pageTotal = api
	.column( 19 )
	.data()
	.reduce( function (a, b) {
	return intVal(a) + intVal(b);
	}, 0 );

	// Update footer
	$( api.column( 19 ).footer() ).html(

	parseFloat(pageTotal).toFixed(2)

	);
	console.log( pageTotal);
	    
			        },
			 
			    	
			    	destroy: true,
			        searching: false,
			        
			      
			columns: [
			          	{"data": "serialnumber", "width": "5%", "defaultContent": ""},
			            {"data": "saleDate", "width": "5%", "defaultContent": ""},
			            {"data": "supplierName", "width": "5%", "defaultContent": ""},
			            {"data": "billNo" , "width": "5%", "defaultContent": ""},
			            {"data": "gstNumber" , "width": "5%", "defaultContent": ""},
			            {"data": "hsnNumber" , "width": "5%", "defaultContent": ""},
			            {"data": "itemName" , "width": "5%", "defaultContent": ""},
			            {"data": "buyPrice", "width": "5%", "defaultContent": ""},
			            {"data": "quanti" , "width": "5%", "defaultContent": ""},
			            
			            {"data": "totalAmount", "width": "5%", "defaultContent": ""},
			            {"data": "fivePercentageGST", "width": "5%", "defaultContent": ""},
			            {"data": "twelwePercentageGST", "width": "5%", "defaultContent": ""},
			            {"data": "eighteenPercentageGST" , "width": "5%", "defaultContent": ""},
			            {"data": "twentyEightPercentageGST" , "width": "5%", "defaultContent": ""},
			            {"data": "iGSTFivePercentage" , "width": "5%", "defaultContent": ""},
			            {"data": "iGSTTwelwePercentage" , "width": "5%", "defaultContent": ""},
			            {"data": "iGSTEighteenPercentage", "width": "5%", "defaultContent": ""},
			            {"data": "iGSTTwentyeightPercentage" , "width": "5%", "defaultContent": ""},
			            {"data": "totalTaxAmount", "width": "5%", "defaultContent": ""},
			            {"data": "netAmount" , "width": "5%", "defaultContent": ""}
			        ],
			      
			        dom: 'Bfrtip',
		            buttons: [
		                'copy', 'csv', 'excel', 'pdf', 'print'
		            ]
			    } );
			} );
			
		var mydata = catmap;
		$('#gstPurchaseReportTable').dataTable().fnAddData(mydata);
		
			}
		

		);
	}
	
	
	function getSaleReturnDetails(){

		var params= {};

		var input1 = document.getElementById('fk_cat_id6'),
		list = document.getElementById('cat_drop6'),
		i,fk_cat_id;
		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input1.value) {
				fk_cat_id = list.options[i].getAttribute('data-value');
			}
		}
		
		
		var fk_cat_id = fk_cat_id;
		
		params["cat"]= fk_cat_id;
		
		params["methodName"] = "getSaleReturnDetailsAsPerCategory";

		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
				{
			
			$('#sale1').dataTable().fnClearTable();
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			/*$(document).ready(function() {
			    
			} );
			*/
			
			$(document).ready(function() {
			 var total =   $('#sale1').DataTable( {
				 
				 fnRowCallback : function(nRow, aData, iDisplayIndex){
		                $("th:first", nRow).html(iDisplayIndex +1);
		               return nRow;
		            },
				
		        	
					 "footerCallback": function ( row, data, start, end, display ) {/*
				            var api = this.api(), data;
				 
				            // Remove the formatting to get integer data for summation
				            var intVal = function ( i ) {
				                return typeof i === 'string' ?
				                    i.replace(/[\$,]/g, '')*1 :
				                    typeof i === 'number' ?
				                        i : 0;
				            };
				 
				            // Total over all pages
				             total = api
				                .column( 6 )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 ); 
				 			console.log(total); 
				            // Total over this page
				            pageTotal = api
				                .column( 7 )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 );
				 
				            // Update footer
				            $( api.column( 7 ).footer() ).html(
				            		
				              parseFloat(pageTotal).toFixed(2)
				               
				            );
				            console.log( pageTotal);
			            
			        */},
			    
			    	
			    	destroy: true,
			        searching: false,
			        
			      
			columns: [
			          	{"data": "customerBill", "width": "5%"},
			            {"data": "cusomerName", "width": "5%"},
			            {"data": "returnedAmount", "width": "5%"},
			        ],
			        
			        dom: 'Bfrtip',
		            buttons: [
		                'copy', 'csv', 'excel', 'pdf', 'print'
		            ]
			    } );
			
			} );
			
		var mydata = catmap;
		$('#sale1').dataTable().fnAddData(mydata);
		
			}
		

		);
	}
	
	
	/*GST wise Expense Report*/
	function gstWiseExpenseReport(){
		
		if(document.gstExpense.gstFisDate.value == "")
		{
			alert("Please select start date");
			return false;
		}
		
		if(document.gstExpense.gstEndDate.value == "")
		{
			alert("Please select end date");
			return false;
		}
	
		ExpenseReportAsPerGST();
	}

	function ExpenseReportAsPerGST(){
	
		var params= {};
		
		var startDate = $("#gstFisDate").val();
		var endDate = $("#gstEndDate").val();
		
		params["startDate"]= startDate;
		params["endDate"]= endDate;
		
		params["methodName"] = "getExpenseDetailsAsPerGST";

		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
				{
			
			$('#gstSale').dataTable().fnClearTable();
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			/*$(document).ready(function() {
			    
			} );
			*/
			
			$(document).ready(function() {
			 var total =   $('#gstSale').DataTable( {
				 
				 fnRowCallback : function(nRow, aData, iDisplayIndex){
		                $("th:first", nRow).html(iDisplayIndex +1);
		               return nRow;
		            },
				
		        	
				 "footerCallback": function ( row, data, start, end, display ) {
				            var api = this.api(), data;
				 
				            // Remove the formatting to get integer data for summation
				            var intVal = function ( i ) {
				                return typeof i === 'string' ?
				                    i.replace(/[\$,]/g, '')*1 :
				                    typeof i === 'number' ?
				                        i : 0;
				            };
				 
				         
				            // Total over this page
				            pageTotal = api
				                .column( 2 )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 );
				 
				            // Update footer
				            $( api.column( 2 ).footer() ).html(
				            		
				              parseFloat(pageTotal).toFixed(2)
				               
				            );
				            console.log( pageTotal);
			            
			        },
			    
			    	
			    	destroy: true,
			        searching: false,
			        
			      
			columns: [
			          	{"data": "saleDate", "width": "5%"},
			          	{"data": "cusomerName", "width": "5%"},
			            {"data": "billNo", "width": "5%"},
			            {"data": "transExpense" , "width": "5%"},
			            {"data": "fivePercentageGST", "width": "5%"},
			          	{"data": "hamaliexpense", "width": "5%"},
			            {"data": "iGSTFivePercentage", "width": "5%"},
			            {"data": "transTaxAmount", "width": "5%"},
			          	{"data": "hamaliTransExpense", "width": "5%"},
			            {"data": "totalTaxAmount", "width": "5%"},
			        ],
			        dom: 'Bfrtip',
		            buttons: [
		                'copy', 'csv', 'excel', 'pdf', 'print'
		            ]
			    } );
			
			} );
			
		var mydata = catmap;
		$('#gstSale').dataTable().fnAddData(mydata);
		
			}
		

		);

	}