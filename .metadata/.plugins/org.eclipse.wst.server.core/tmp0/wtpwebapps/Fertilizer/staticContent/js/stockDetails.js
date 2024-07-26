function StockDetailsReportAsPerCompanyName(){
	var params= {};
	var input1 = document.getElementById('company_name'),
	list = document.getElementById('company_drop'),
	i,companyName;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			companyName = list.options[i].getAttribute('data-value');
		}
	}
	
	params["companyName"]= companyName;
	
	params["methodName"] = "StockDetailsReportAsPerCompanyName";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
		$('#companyWiseTable').dataTable().fnClearTable();
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$(document).ready(function() {
		 var total =   $('#companyWiseTable').DataTable( {
			 
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
		 
		         
		            pageTotal = api
		                .column( 3 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 3 ).footer() ).html(
		            		
		              parseFloat(pageTotal).toFixed(2)
		               
		            );
		            console.log( pageTotal);
	            
	        },
    	
	            destroy: true,
		        searching: false,
		      
		columns: [
					{"data": "productName", "width": "5%"},
					{"data": "companyName", "width": "5%"},
					{"data": "weight", "width": "5%"},
					{"data": "quantity" , "width": "5%"},
		        
		        ],
		      
		    } );
		} );
		
	var mydata = catmap;
	$('#companyWiseTable').dataTable().fnAddData(mydata);
	
		}
	
	);
}






function StockDetailsReportAsPerCat(){
	var params= {};
	
	var input1 = document.getElementById('fk_cat_id'),
	list = document.getElementById('cat_drop'),
	i,fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}
	
	params["cat"]= fk_cat_id;
	
	params["methodName"] = "getStockReportAsPerCategory";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#stockByCat').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		
		
		$(document).ready(function() {
		 var total =   $('#stockByCat').DataTable( {
			 
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
			 
			         
			            pageTotal = api
			                .column( 4 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			            // Update footer
			            $( api.column( 4 ).footer() ).html(
			            		
			              parseFloat(pageTotal).toFixed(2)
			               
			            );
			            console.log( pageTotal);
		            
		        },
	    	
		    	destroy: true,
		        searching: false,
		        
		      
		columns: [
		            {"data": "productName", "width": "5%"},
		            {"data": "companyName", "width": "5%"},
		            {"data": "weight", "width": "5%"},
		            {"data": "batchNo", "width": "5%"},
		            {"data": "quantity" , "width": "5%"},
		        
		        ],
		      
		        
		    } );
		} );
		
	var mydata = catmap;
	$('#stockByCat').dataTable().fnAddData(mydata);
	
		}
	

	);

}


function StockDetailsReportAsPerGodown(){


	
	var params= {};
	
	var input1 = document.getElementById('fk_godown_id'),
	list = document.getElementById('godown_drop'),
	i,fk_godown_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_godown_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	
	params["fkGodownId"]= fk_godown_id;
	
	params["methodName"] = "getStockReportAsPerGodown";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#stockByGodown').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		
		
		$(document).ready(function() {
		 var total =   $('#stockByGodown').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
			
	    	
		    	destroy: true,
		        searching: false,
		        
		      
		columns: [
		          	{"data": "categoryName" , "width": "5%"},
		            {"data": "productName", "width": "5%"},
		            {"data": "stock", "width": "5%"},
		            {"data": "batchNo", "width": "5%"},
		            
		        
		        ],
		      
		        
		    } );
		} );
		
	var mydata = catmap;
	$('#stockByGodown').dataTable().fnAddData(mydata);
	
		}
	

	);


}


/*** +++ Fetching product Name+++ *****/
function getProductName(){
		
		$("#proName").empty();
		$("#proName").append($("<option></option>").attr("value","").text("Select product"));
		var params= {};
		
		params["methodName"] = "getAllProductByCategoriesForStockReport";
		
		
		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
				{ var count = 1;
				
			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				$("#proName").append($("<option></option>").attr("value",count).text(v.product + ","+v.manufacturer+","+v.weight+","+v.unitName)); 
					count++;
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
		
	
}


function StockDetailsReportAsPerProductName(){
	var params= {};
	
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
	
	params["methodName"] = "StockDetailsReportAsPerProductName";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
		$('#productTable').dataTable().fnClearTable();
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$(document).ready(function() {
		 var total =   $('#productTable').DataTable( {
			 
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
		 
		         
		            pageTotal = api
		                .column( 3 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 3 ).footer() ).html(
		            		
		              parseFloat(pageTotal).toFixed(2)
		               
		            );
		            console.log( pageTotal);
	            
	        },
    	
	            destroy: true,
		        searching: false,
		      
		columns: [
					{"data": "productName", "width": "5%"},
					{"data": "companyName", "width": "5%"},
					{"data": "weight", "width": "5%"},
					{"data": "quantity" , "width": "5%"},
		        
		        ],
		      
		    } );
		} );
		
	var mydata = catmap;
	$('#productTable').dataTable().fnAddData(mydata);
	
		}
	
	);
}



/*** +++ Fetching product Name+++ *****/
function getProductNameForStockReport(){
		
		$("#proName").empty();
		$("#proName").append($("<option></option>").attr("value","").text("Select product"));
		var params= {};
		
		params["methodName"] = "getAllProductByCategoriesForStockReport";
		
		
		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
				{ var count = 1;
				
			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				$("#proName").append($("<option></option>").attr("value",count).text(v.product + ","+v.manufacturer+","+v.weight+","+v.unitName)); 
					count++;
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
		
	
}


function dateWiseStock(){

	var params= {};
	var firstDate = $("#firstDate").val();
	
	params["firstDate"]= firstDate;
	
	params["methodName"] = "StockDetailsReportAsPerDate";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
		$('#dateWiseStockTable').dataTable().fnClearTable();
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$(document).ready(function() {
		 var total =   $('#dateWiseStockTable').DataTable( {
			 
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
		 
		         
		            pageTotal = api
		                .column( 4 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 4 ).footer() ).html(
		            		
		              parseFloat(pageTotal).toFixed(2)
		               
		            );
		            console.log( pageTotal);
	            
	        },
    	
	            destroy: true,
		        searching: false,
		      
		columns: [
					{"data": "productName", "width": "5%"},
					{"data": "companyName", "width": "5%"},
					{"data": "weightInBigDecimal", "width": "5%"},
					{"data": "batchNo", "width": "5%"},
					{"data": "quantityInBigDecimal" , "width": "5%"},
		        
		        ],
		      
		    } );
		} );
		
	var mydata = catmap;
	$('#dateWiseStockTable').dataTable().fnAddData(mydata);
	
		}
	
	);

}