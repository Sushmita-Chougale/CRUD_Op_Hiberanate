function saveProduct() {
var supplierName = $ ('#supplierName').val();// here we declare variable and in quotation var division = $('#division').val();
var productName= $('#productName').val();
var price= $('#price').val();
var quantity= $('#quantity').val();
var params ={};
params["supplierName"] =supplierName;
params["productName"] =productName;
params["price"] =price;
params["quantity"] =quantity;

params["methodName"] ="saveProduct";


$.post('/SupplierDetails/jsp/utility/controller.jsp', params, function(data)
{
	alert(data);
	location.reload();
	}
	).fail(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
				$(loaderObj).hide();
				$(loaderObj).find('#errorDiv').show();
			}
	});
}
function updateProduct() {
    // Collect updated data from input fields
    var id = $('#productId').val();
    var supplierName = $('#supplierName').val();
    var productName = $('#productName').val();
    var price = $('#price').val();
    var quantity = $('#quantity').val();

    // Prepare parameters for the AJAX request
    var params = {
        id: id,
        supplierName: supplierName,
        productName: productName,
        price: price,
        quantity: quantity,
        methodName: "updateProduct"
    };
    $.post('/SupplierDetails/jsp/utility/controller.jsp', params, function(data) {
       if (data === "success") {
            alert("Product updated successfully!");
            location.reload();
        } else {
        	alert("Data Updated successfully");
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error('Error:', textStatus, errorThrown);
        alert("Error updating product. Please try again later.");
    });
}

function getProductDetailsById(productId) {
    var params = {
        id: productId,
        methodName: "getProductDetailsById"
    };
    $("#supplierName").append($("<input/>").attr("value","").text());
    $.post('/SupplierDetails/jsp/utility/controller.jsp', params, function(data) {
        
    	var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			   document.getElementById("supplierName").value = v.supplierName;
			   document.getElementById("productName").value = v.productName;
			   document.getElementById("price").value = v.price;
			   document.getElementById("quantity").value = v.quantity;
			   
			      
		});
	  }).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {

		}
	});
		
    
}




function deleteProduct() {
	var id = $('#productId').val();
	var supplierName = $('#supId').val();
	var productName= $('#prodId').val();
	var price= $('#priceId').val();
	var quantity= $('#qtyId').val();
	var params ={};
	params["id"]=id;
	params["supplierName"] = supplierName;
	params["productName"] =productName;
	params["price"] =price;
	params["quantity"] =quantity;
	
	params["methodName"] ="deleteProduct";

	$.post('/SupplierDetails/jsp/utility/controller.jsp', params, function(data)
	{
		alert(data);
		location.reload();
		}
		).fail(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
		});
	}

function getAllProductDetails(newWindow, productList) {
    var productListHtml = "<h1>Product List</h1>";
    productListHtml += "<ul>";
    productList.forEach(function(product) {
    	 productListHtml += "<li>Supplier: " + product.supplierName + ", Product: " + product.productName + ", Price: $" + product.price + ", Quantity: " + product.quantity + "</li>";
    });
    productListHtml += "</ul>";
    newWindow.document.write(productListHtml);
}


