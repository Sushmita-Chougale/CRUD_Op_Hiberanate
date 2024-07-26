
package com.login.utility;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.login.helper.UserHelper;


public class Controller {
	
	private String toJson(Object data) {
        Gson gson = new GsonBuilder().setPrettyPrinting().disableHtmlEscaping().create();
        return gson.toJson(data);
    }

    public String signup(HttpServletRequest req, HttpServletResponse res) {
        System.out.println("In Controller for Sign Up");
        UserHelper helper = new UserHelper();
        helper.saveUser(req, res);
        return toJson("success");
    }
    
	/*
	 * public String login(HttpServletRequest req, HttpServletResponse res) {
	 * System.out.println("In Controller for Login"); UserHelper helper = new
	 * UserHelper(); boolean isAuthenticated = helper.authenticateUser(req, res); if
	 * (isAuthenticated) { return toJson("Logged in successfully"); } else { return
	 * toJson("Invalid username or password"); } }
	 */
}
