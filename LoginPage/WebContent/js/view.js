function login() {
    var username = $('#username').val();
    var password = $('#password').val();

    if (!username || !password) {
        alert('Please fill out all fields.');
        return;
    }

    var params = {
        "userName": username,
        "password": password,
        "methodName": "login"
    };

    $.post('/LoginPage/jsp/utility/controller.jsp', params, function(data) {
        var parsedData = JSON.parse(data);
        if (parsedData && parsedData.status === 'success') {
            alert('Login successful');
            window.location.href = '/LoginPage/jsp/empList.jsp';
        } else {
            alert('Invalid credentials');
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        alert('Login failed. Please try again later.');
    });
}


function signup() {
	var userName= $('#userName').val();
	var password=$('#password').val();
	var email= $('#email').val();
	var designation= $('#designation').val();
	var salary= $('#salary').val();
	var number= $('#number').val();
	if (!/^\d{10}$/.test(number)) {
        alert("Phone number must be exactly 10 digits.");
        return;
    }
	var params ={};
	params["userName"] =userName;
	params["password"]=password;
	params["email"] =email;
	params["designation"] =designation;
	params["salary"] =salary;
	params["number"] =number;

	params["methodName"] ="signup";


	$.post('/LoginPage/jsp/utility/controller.jsp', params, function(data)
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
function getAllEmpDetails(newWindow, empList) {
    var empListHtml = "<h1>Employee List</h1>";
    empListHtml += "<ul>";
    empList.forEach(function(emp) {
    	empListHtml += "<li>User Name: " + emp.userName + ",Password: " +emp.password+", Email: " + emp.email + ", Designation: " + emp.designation + ", Salary: " + emp.salary + ", Number: " + emp.number + "</li>";
    });
    empListHtml += "</ul>";
    newWindow.document.write(empListHtml);
}

function getEmpDetailsById(empId) {
    var params = {
        id: empId,
        methodName: "getEmpDetailsById"
    };
    $("#userName").append($("<input/>").attr("value","").text());
    $.post('/LoginPage/jsp/utility/controller.jsp', params, function(data) {
        
    	var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			   document.getElementById("userName").value = v.userName;
			   document.getElementById("password").value = v.password;
			   document.getElementById("email").value = v.email;
			   document.getElementById("designation").value = v.designation;
			   document.getElementById("salary").value = v.salary;
			   document.getElementById("number").value = v.number;
			   });
	  }).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {

		}
	});
		
    
}
function deleteEmp() {
	var id = $('#empId').val();
	var userName= $('#nameId').val();
	var password=$('#passId').val();
	var email= $('#mailId').val();
	var designation= $('#desId').val();
	var salary= $('#salId').val();
	var number= $('#numId').val();
	
	var params ={};
	params["id"]=id;
	params["userName"] =userName;
	params["password"]=password;
	params["email"] =email;
	params["designation"] =designation;
	params["salary"] =salary;
	params["number"] =number;

	params["methodName"] ="deleteEmp";

	$.post('/LoginPage/jsp/utility/controller.jsp', params, function(data)
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
function updateEmp() {
	var id = $('#empId').val();
	var userName= $('#userName').val();
	var password=$('#password').val();
	var email= $('#email').val();
	var designation= $('#designation').val();
	var salary= $('#salary').val();
	var number= $('#number').val();
	if (!/^\d{10}$/.test(number)) {
        alert("Phone number must be exactly 10 digits.");
        return;
    }
	var params ={};
	params["id"]=id;
	params["userName"] =userName;
	params["password"]=password;
	params["email"] =email;
	params["designation"] =designation;
	params["salary"] =salary;
	params["number"] =number;

	params["methodName"] ="updateEmp";
	
    $.post('/LoginPage/jsp/utility/controller.jsp', params, function(data) {
       if (data === "success") {
            alert("Data updated successfully!");
            location.reload();
        } else {
        	alert("Data Can't be Updated");
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error('Error:', textStatus, errorThrown);
        alert("Error updating product. Please try again later.");
    });
}

function searchTable() {
    var input, filter, table, tr, td, i, j, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("empTable");
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length; i++) {
        tr[i].style.display = "none";
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            if (td[j]) {
                txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                    break;
                }
            }
        }
    }
}
function logout() {
    var params = {
        "methodName": "logout"
    };

    $.post('/LoginPage/jsp/utility/controller.jsp', params, function(data) {
        var parsedData = JSON.parse(data);
        if (parsedData && parsedData.status === 'success') {
            alert('Logout successful');
            window.location.href = '/LoginPage/jsp/userLogin.jsp';
        } else {
            alert('Logout failed');
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        alert('Logout failed. Please try again later.');
    });
}

