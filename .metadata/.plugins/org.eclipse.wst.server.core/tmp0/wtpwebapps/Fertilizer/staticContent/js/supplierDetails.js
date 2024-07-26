function supplierDetail(){
	
	
	if(document.spld.dealerName.value == "")
	{
		alert("Enter Dealer  Name.");
		return false;
	}	
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(document.spld.dealerName.value.match(letterNumber))
	{
		if(document.spld.personName.value == "")
		{
			alert("Enter Person Name.");
			return false;
		}	
			var letterNumber = /^[a-zA-Z, ]+$/;
			if(document.spld.personName.value.match(letterNumber))
			{
				 if ( document.spld.contactNo.value == "" )
       			 {
		  	       alert("Please Enter Contact Number");
		  	       return false;
       			 }
       			
				 var letterNumber = /^[0-9]{10}$/;
       			 if(document.spld.contactNo.value.match(letterNumber))
       			 {
       				 /*if ( document.spld.landline.value == "" )
           			 {
    		  	       alert("Please Enter Landline Number");
    		  	       return false;
           			 }*/
           			
    				/* var letterNumber = /^[0-9, ]+$/;
           			 if(document.spld.landline.value.match(letterNumber))
           			 {*/
       			 
           				
       				  /*if(document.spld.emailId.value == ""  )
           				 {
	 			            
	 	    	    	     alert("Please Enter Email .");
	 			             return false;
           				 }*/
		   	        	 var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		   	        	 if(document.spld.emailId.value.match(letterNumber) || document.spld.emailId.value==null || document.spld.emailId.value=="")
		   	        	 {
	   	        		
	   	        				if(document.spld.city.value == "")
	   	        				{
	   	        					alert("Please Enter city.");
	   	        					return false;
	   	        				}	
	   	        				var letterNumber = /^[a-zA-Z, ]+$/;
	   	        				if(document.spld.city.value.match(letterNumber))
	   	        				{
	   	        					/*if ( document.spld.tinNo.value == "" )
								    {
								         
								  	      alert("Please Enter tin Number");
								          return false;
								    }
									var letterNumber = /^[a-zA-Z0-9, ]+$/;
									if(document.spld.tinNo.value.match(letterNumber))
									{*/
										if(document.spld.address.value == "")
			   	        				{
			   	        					alert("Please Enter address.");
			   	        					return false;
			   	        				}	
				   	        				var letterNumber = /^[a-zA-Z0-9, ]+$/;
				   	        				if(document.spld.address.value.match(letterNumber))
				   	        				{
											supDetails();
											}
										
			   	        				
			   	        				else
										{
												alert("Enter Alphabates Only in Address field..!!");
												return false;
											}
										}
			   	        				
			   	        				
			   	        				/*else
										{
												alert("Enter Numbers Only in Tin number field..!!");
												return false;
											}
										}*/
									
	   	        				else
									{
										alert("Enter Alphabates Only in city field..!!");
										return false;
									}	
								}
										
		   	        	 else
							{
								alert("Enter a Valid email adress (example = abc@xyz.com)");
								return false;
							}
						}
           	
           	/*	 else
						{
							alert("Enter Numbers Only in Landline number field..!!");
							return false;
							}	
						}	*/								
           			 
       			 else
						{
							alert("Enter 10 digit Numbers Only in contact number field..!!");
							return false;
							}	
						}
																
		else
			{
				alert("Enter Alphabets Only in Person name field..!!");
				return false;
			}
		}
												
	else
		{
			alert("Enter Alphabets Only in Dealer name field..!!");
			return false;
		}
}




function supDetails(){

	document.spld.btn.disabled = true;
	
				var dealerName = $('#dealerName').val();
				var personName = $('#personName').val();
				var contactNo = $('#contactNo').val();
				var landline = $('#landline').val();
				var emailId = $('#emailId').val();
				var tinNo = $('#tinNo').val();
				var city = $('#city').val();
				var address = $('#address').val();
				
				if(tinNo==undefined || tinNo== null || tinNo == "" ){
					tinNo=0;
				}
				
				var params = {};
				
				params["dealerName"] = dealerName;
				params["personName"] =personName;
				params["contactNo"] = contactNo;
				params["landline"] =landline;
				params["emailId"] = emailId;
				params["tinNo"] = tinNo;
				params["city"] = city;
				params["address"] = address;
				
				
				params["methodName"] = "supplierDetails";

				$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
			 	    	{
			 				alert(data);
			 				if(document.spld)
			 				{
			 					document.spld.reset();
			 				}	
			 				document.spld.btn.disabled =false;
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
   document.spld.reset();	

}


/********* Edit Supplier Details ************/
function getSupplierDetails(){
	var params= {};
	
	var input = document.getElementById('supplier'),
     list = document.getElementById('sup_drop'),
     	i,fkRootSupId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootSupId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	$("#dealerName").append($("<input/>").attr("value","").text());
	$("#personName").append($("<input/>").attr("value","").text());
	$("#contactNo").append($("<input/>").attr("value","").text());
	$("#landline").append($("<input/>").attr("value","").text());
	$("#emailId").append($("<input/>").attr("value","").text());
	$("#city").append($("<input/>").attr("value","").text());
	$("#tinNo").append($("<input/>").attr("value","").text());
	$("#address").append($("<input/>").attr("value","").text());
	
	
	
	params["SupplierId"]= fkRootSupId;
	alert(fkRootSupId);
	params["methodName"] = "getSupplierDetailsToEdit";
	
	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				  document.getElementById("dealerName").value = v.dealerName;
			      document.getElementById("personName").value = v.personName;
			      document.getElementById("contactNo").value = v.contactNo;
			      document.getElementById("landline").value = v.landline;
			      document.getElementById("emailId").value = v.email;
			      document.getElementById("city").value = v.city;
			      document.getElementById("tinNo").value = v.tin;
			      document.getElementById("address").value = v.address;
			   
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}


function updateSupplierDetails(){

	
	document.spld1.btn.disabled = true;
	
	var input = document.getElementById('supplier'),
    list = document.getElementById('sup_drop'),
    	i,fkRootSupId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootSupId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	//var customerId = document.getElementById("customerId").value;
	
	var dealerName = $('#dealerName').val();
	var personName = $('#personName').val();
	var contactNo = $('#contactNo').val();				
	var landline = $('#landline').val();
	var emailId = $('#emailId').val();
	var city = $('#city').val();
	var tinNo = $('#tinNo').val();
	var address = $('#address').val();
	

	
	
	var params = {};
	
	params["supplierId"] = fkRootSupId;
	
	params["dealerName"] = dealerName;	
	params["personName"] = personName;
	params["contactNo"] = contactNo;
	params["landline"] = landline;
	params["emailId"] =emailId;
	params["city"] = city;
	params["tinNo"] = tinNo;
	params["address"] = address;
	
	
	
	params["methodName"] = "updateSupplierDetails";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data){
			alert(data);
				if(document.spld1)
				{
					document.spld1.reset();
				}	
				document.spld1.btn.disabled =false;
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