function login() {
    var userName = $('#userName').val();
    var password = $('#password').val();
    if (!userName || !password) {
        alert('Please fill out all fields.');
        return;
    }
    var params = {};
    params["userName"] = userName;
    params["password"] = password;
    params["methodName"] = "login";

    $.post('/Login/jsp/utility/controller.jsp', params, function(data) {
        if (data.trim==success) {
            alert('Login successful');
            window.location.href = '/Login/jsp/controller.jsp';
        } else {
            alert('Login failed: ' + data.message);
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        alert('Login failed. Please try again later.');
    });
}
function signup() {
	var userName= $('#userName').val();
	var password= $('#password').val();
	if (!userName || !password) {
        alert('Please fill out all fields.');
        return;
    }
	var params ={};
	params["userName"] =userName;
	params["password"] =password;

	params["methodName"] ="signup";


	$.post('/Login/jsp/utility/controller.jsp', params, function(data)
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
