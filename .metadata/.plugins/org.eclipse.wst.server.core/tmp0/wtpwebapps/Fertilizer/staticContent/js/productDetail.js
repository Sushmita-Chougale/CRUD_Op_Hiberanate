//sale price compaire with MRP
function salePriceCompaireWithMRP(){
	var salePrice=$('#salePrice').val();
	var mrp = $('#mrp').val();
	
	if(Number(salePrice)>Number(mrp)){
		alert("Sale Price Should be less than MRP");
		document.prd.salePrice.value = null;
	}
}	
//Credit sale price compaire with MRP
	function creditSalePriceCompaireWithMRP(){
		var salePrice=$('#creditSalePrice').val();
		var mrp = $('#mrp').val();
		
		if(Number(salePrice)>Number(mrp)){
			alert("Credit Sale Price Should be less than MRP");
			document.prd.creditSalePrice.value = null;
		}
}

function productDetails(){
	
	if(document.prd.fk_cat_id.value == "")
	{
		alert("Please select Product Category");
		return false;
	}	
	
		if(document.prd.productName.value == "")
			{
				alert("Enter Product Name.");
				return false;
			}	
			var letterNumber = /^[a-zA-Z0-9\\.;,:()%' ]{0,100}$/;
			if(document.prd.productName.value.match(letterNumber))
			{
				if(document.prd.manufacturingCompany.value == "")
				{
					alert("Enter Manufacturing Company Name.");
					return false;
				}	
				var letterNumber = /^[a-zA-Z0-9\\.;,:()%' ]{0,100}$/;
				if(document.prd.manufacturingCompany.value.match(letterNumber))
				{
					
					if ( document.prd.weight.value == "" )
	        			 {
			  	       alert("Please Enter Weight");
			  	       return false;
	        			 }
	        			 var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,3})?\s*$/;
	        			 var num = /^\d+$/;
	        			 if(document.prd.weight.value.match(letterNumber) || document.prd.weight.value.match(num))
	        			 {
	        				 
	        				 if(document.prd.fk_unit_id.value == "")
	        					{
	        						alert("Please select unit");
	        						return false;
	        					}	
									if ( document.prd.buyPrice.value == "" )
					   	        			 {
									  	       alert("Please Enter Buy price");
									  	       return false;
					   	        			 }
					   	        			 var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/;
					   	        			 var num = /^\d+$/;
					   	        			 if(document.prd.buyPrice.value.match(letterNumber) || document.prd.buyPrice.value.match(num))
					   	        			 {
					   	     				
					   	        				if ( document.prd.mrp.value == "" )
						   	        			 {
										  	       alert("Please Enter M.R.P price");
										  	       return false;
						   	        			 }
						   	        			 var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/;
						   	        			 var num = /^\d+$/;
						   	        			 if(document.prd.mrp.value.match(letterNumber) || document.prd.mrp.value.match(num))
						   	        			 {
					   	        				 
					   	        				 
					   	        				if ( document.prd.salePrice.value == "" )
						   	        			 {
										  	       alert("Please Enter Sale price");
										  	       return false;
						   	        			 }
						   	        			 var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/;
						   	        			 var num = /^\d+$/;
						   	        			 if(document.prd.salePrice.value.match(letterNumber) || document.prd.salePrice.value.match(num) )
						   	        			 {
						   	        				if ( document.prd.creditSalePrice.value == "" )
							   	        			 {
											  	       alert("Please Enter Credit Sale price");
											  	       return false;
							   	        			 }
							   	        			 var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/;
							   	        			 var num = /^\d+$/;
							   	        			 if(document.prd.creditSalePrice.value.match(letterNumber) || document.prd.creditSalePrice.value.match(num) )
							   	        			 {
						   	        				 
										   	        		 prdctDetails();
														}
										
							   	        			else
													{
														alert("Enter only Numbers upto 2 decimal in Credit sale price field..!!");
														return false;
													} 
						   	        			 }
							   	        else
											{
												alert("Enter only Numbers upto 2 decimal in sale price field..!!");
												return false;
											}
										}	
						   	            else
						   	            	{
						   	            	alert("Enter only Numbers upto 2 decimal in M.R.P price field..!!");
											return false;
						   	            	}
						   	            	}
						   	        	 
						   	        	 else
										{
												alert("Enter only Numbers upto 2 decimal in buy price field..!!");
												return false;
											}
										}
									
				        			 else
										{
												alert("Enter Only Numbers upto 3 decimal  in Weight field..!!");
												return false;
											}
										}
	   	        				else
									{
										alert("Enter Alphabates Only in Manufacturing company field..!!");
										return false;
									}	
								}
										
																
			else
				{
					alert("Enter Alphabets And Numbers Only in Product Name field..!!");
					return false;
				}
			}
											
function prdctDetails(){
	
	document.prd.btn.disabled = true;
	
				
				var productName= $('#productName').val();
				var manufacturingCompany= $('#manufacturingCompany').val();
				var weight=$('#weight').val();
				var buyPrice=$('#buyPrice').val();
				var salePrice=$('#salePrice').val();
				var creditSalePrice=$('#creditSalePrice').val();
				var taxpercentage = $('#taxPercentage').val();
				var mrp = $('#mrp').val();
				var fk_tax_id = $('#fk_tax_id').val();
				var hsn = $('#hsn').val();
				var input1 = document.getElementById('fk_cat_id'),
				list = document.getElementById('cat_drop'),
				i,fk_cat_id;
				for (i = 0; i < list.options.length; ++i) {
					if (list.options[i].value === input1.value) {
						fk_cat_id = list.options[i].getAttribute('data-value');
					}
				}
				
			
				
				var input3 = document.getElementById('fk_unit_id'),
				list3 = document.getElementById('unit_drop'),
				i,fk_unit_id;
				for (i = 0; i < list3.options.length; ++i) {
					if (list3.options[i].value === input3.value) {
						fk_unit_id = list3.options[i].getAttribute('data-value');
					}
				}
					
				var params = {};
				params["fkTaxId"] = fk_tax_id;
				params["taxPercentage"] = taxpercentage;
				params["mrp"] = mrp;
				params["fk_cat_id"] = fk_cat_id;
				params["productName"] =productName.toUpperCase();
				params["manufacturingCompany"] = manufacturingCompany.toUpperCase();
				params["weight"] =weight;
				params["fk_unit_id"] = fk_unit_id;
				params["buyPrice"] = buyPrice;
				params["salePrice"] = salePrice;
				params["creditSalePrice"] = creditSalePrice;
				params["hsn"] = hsn;
				params["methodName"] = "proDetails";
				$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			 	    	{
			 				alert(data);
			 				if(document.prd)
			 				{
			 					document.prd.reset();
			 				}	
			 				document.prd.btn.disabled =false;
			 			}
			 	    	).error(function(jqXHR, textStatus, errorThrown){
			 	    		if(textStatus==="timeout") {
			 	    			$(loaderObj).hide();
			 	    			$(loaderObj).find('#errorDiv').show();
			 	    		}
			 	    	});
				
}



function reset()
{
   document.prd.reset();	

}


/******************* For reports ***************/

 function getProductDetailAsperCategory(){
	
	
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
	params["methodName"] = "getProductDetailForReportAsPerCat";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			{
	
	$('#example1').dataTable().fnClearTable();
	
	var jsonData = $.parseJSON(data);
	var catmap = jsonData.list;
	
	
	
	$(document).ready(function() {
	 var total =   $('#example1').DataTable( {
		 
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
	         		         
	            
	            
	        },*/
	    	
	    	
	    	destroy: true,
	        searching: false,
	        
	      
	columns: [
	            
	            {"data": "productName", "width": "5%"},
				{"data": "ManufacturingCompany", "width": "5%"},
				{"data": "buyPrice" , "width": "5%"},
				{"data": "salePrice" , "width": "5%"}
	        ],
	      
	        
	    } );
	} );
	
var mydata = catmap;
$('#example1').dataTable().fnAddData(mydata);

	}

);
	
	
	
}

 
 
 
/****************** For Edit Product Details ********************/
 function getAllProductDetails(){
	 var params= {};
	 var input1 = document.getElementById('fk_product_id'),
		list = document.getElementById('pro_drop'),
		i,fk_product_id;
		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input1.value) {
				fk_product_id = list.options[i].getAttribute('data-value');
			}
		}
	
		$("#manufacturingCompany").append($("<input/>").attr("value","").text());
		$("#weight").append($("<input/>").attr("value","").text());
		$("#fk_unit_id").append($("<input/>").attr("value","").text());
		$("#existedTax").append($("<input/>").attr("value","").text());
		$("#existedTaxPercentage").append($("<input/>").attr("value","").text());
		$("#buyPrice").append($("<input/>").attr("value","").text());
		$("#mrp").append($("<input/>").attr("value","").text());
		$("#salePrice").append($("<input/>").attr("value","").text());
		$("#creditSalePrice").append($("<input/>").attr("value","").text());
		
		
		params["productId"]= fk_product_id;
		
		params["methodName"] = "getProuctDetailsToEdit";
		
		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data){
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			$.each(jsonData,function(i,v)
					{
					  document.getElementById("manufacturingCompany").value = v.manufacturer;
				      document.getElementById("weight").value = v.weight;
				      document.getElementById("fk_unit_id").value = v.unitName;
				      document.getElementById("existedTax").value = v.taxType;
				      document.getElementById("existedTaxPercentage").value = v.taxPercentage;
				      document.getElementById("buyPrice").value = v.buyPrice;
				      document.getElementById("mrp").value = v.mrp;
				      document.getElementById("salePrice").value = v.salePrice;
				      document.getElementById("creditSalePrice").value = v.creditSalePrice;
				   
			      
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
		
 }
 
 // update/edit product details
 function updateProductDetails(){
		
		
		
			if(document.prd1.fk_product_id.value == "")
				{
					alert("Select Product Name.");
					return false;
				}	

					if(document.prd1.manufacturingCompany.value == "")
					{
						alert("Enter Manufacturing Company Name.");
						return false;
					}	
					var letterNumber = /^[a-zA-Z]+$/;
					if(document.prd1.manufacturingCompany.value.match(letterNumber))
					{
						
						if ( document.prd1.weight.value == "" )
		        			 {
				  	       alert("Please Enter Weight");
				  	       return false;
		        			 }
		        			 var letterNumber = /^[0-9]+$/;
		        			 if(document.prd1.weight.value.match(letterNumber))
		        			 {
		        				 
		        				 if(document.prd1.fk_unit_id.value == "")
		        					{
		        						alert("Please select unit");
		        						return false;
		        					}
		        				 if(document.prd1.fk_tax_id.value == "" || document.prd1.fk_tax_id.value == "selected" )
		        					{
		        						alert("Please select New Tax type");
		        						return false;
		        					}
		        				 if(document.prd1.taxPercentage.value == "")
		        					{
		        						alert("Please Enter New Tax Percentage");
		        						return false;
		        					}
		        				 var letterNumber = /^[0-9]+([.][0-9]+)?$/;
		   	        			 if(document.prd1.taxPercentage.value.match(letterNumber))
		   	        			 {
										if ( document.prd1.buyPrice.value == "" )
						   	        			 {
										  	       alert("Please Enter Buy price");
										  	       return false;
						   	        			 }
						   	        			 var letterNumber = /^[0-9]+([.][0-9]+)?$/;
						   	        			 if(document.prd1.buyPrice.value.match(letterNumber))
						   	        			 {
						   	     				
						   	        				if ( document.prd1.mrp.value == "" )
							   	        			 {
											  	       alert("Please Enter M.R.P price");
											  	       return false;
							   	        			 }
							   	        			 var letterNumber = /^[0-9]+([.][0-9]+)?$/;
							   	        			 if(document.prd1.mrp.value.match(letterNumber))
							   	        			 {
						   	        				 
						   	        				 
						   	        				if ( document.prd1.salePrice.value == "" )
							   	        			 {
											  	       alert("Please Enter Sale price");
											  	       return false;
							   	        			 }
							   	        			 var letterNumber = /^[0-9]+([.][0-9]+)?$/;
							   	        			 if(document.prd1.salePrice.value.match(letterNumber))
							   	        			 {
							   	        				 var letterNumber = /^[0-9]+([.][0-9]+)?$/;
								   	        			 if(document.prd1.salePrice.value.match(letterNumber))
								   	        			 {
							   	        				 
							   	        				addEditedProductDetails();
															}
											
								   	        			 else
															{
																alert("Enter only Numbers in Credit customer sale price field..!!");
																return false;
															}
														}
								   	        			 else
														{
															alert("Enter only Numbers in sale price field..!!");
															return false;
														}
							   	        			 }	
							   	            else
							   	            	{
							   	            	alert("Enter only Numbers in M.R.P price field..!!");
												return false;
							   	            	}
							   	            	}
							   	        	 
							   	        	 else
											{
													alert("Enter Numbers Only in buy price field..!!");
													return false;
												}
											}
										
			   	        			 else
										{
												alert("Enter Numbers Only in Tax Percentage field..!!");
												return false;
											}
										}
			   	        			 
			   	        			 
					        			 else
											{
													alert("Enter Numbers Only in Weight field..!!");
													return false;
												}
											}
		   	        				else
										{
											alert("Enter Alphabates Only in Manufacturing company field..!!");
											return false;
										}	
									}
											
 function addEditedProductDetails(){
		document.prd1.btn.disabled = true;
		
		 var input1 = document.getElementById('fk_product_id'),
			list = document.getElementById('pro_drop'),
			i,fk_product_id;
			for (i = 0; i < list.options.length; ++i) {
				if (list.options[i].value === input1.value) {
					fk_product_id = list.options[i].getAttribute('data-value');
				}
			}
		
			 var input1 = document.getElementById('fk_unit_id'),
				list = document.getElementById('unit_drop'),
				i,fk_unit_id;
				for (i = 0; i < list.options.length; ++i) {
					if (list.options[i].value === input1.value) {
						fk_unit_id = list.options[i].getAttribute('data-value');
					}
				}
		//var customerId = document.getElementById("customerId").value;
		
		var manufacturingCompany = $('#manufacturingCompany').val();
		var weight = $('#weight').val();
		var fk_tax_id = $('#fk_tax_id').val();				
		var taxPercentage = $('#taxPercentage').val();
		var buyPrice = $('#buyPrice').val();
		var mrp = $('#mrp').val();
		var salePrice = $('#salePrice').val();
		var creditSalePrice = $('#creditSalePrice').val();
		var existedTax = $('#existedTax').val();
		var existedTaxPercentage = $('#existedTaxPercentage').val();

		
		
		var params = {};
		
		params["productId"] = fk_product_id;
		params["unitId"] = fk_unit_id;
		params["manufacturingCompany"] = manufacturingCompany;	
		params["weight"] = weight;
		params["fk_tax_id"] = fk_tax_id;
		params["taxPercentage"] = taxPercentage;
		params["buyPrice"] =buyPrice;
		params["mrp"] = mrp;
		params["salePrice"] = salePrice;
		params["creditSalePrice"] = creditSalePrice;
		
		params["existedTaxPercentage"] = existedTaxPercentage;
		params["existedTax"] = existedTax;
		
		
		params["methodName"] = "updateProductDetails";

		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data){
				alert(data);
					if(document.prd1)
					{
						document.prd1.reset();
					}	
					document.prd1.btn.disabled =false;
				}
	 	    	).error(function(jqXHR, textStatus, errorThrown){
	 	    		
	 	    		/*alert("Data Added Successfully..");
	 	    		location.reload();
	 				document.ccd.btn.disabled =false;*/
	 	    		
	 	    		if(textStatus==="timeout") {
	 	    			$(loaderObj).hide();
	 	    			$(loaderObj).find('#errorDiv').show();
	 	    		}
	 	    	});



	 
	 
	 
 }