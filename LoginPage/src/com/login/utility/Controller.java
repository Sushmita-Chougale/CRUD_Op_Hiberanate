package com.login.utility;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.login.helper.EmpHelper;





public class Controller {

	private String toJson(Object data) {
		Gson gson = new GsonBuilder().setPrettyPrinting().disableHtmlEscaping().create();
		return gson.toJson(data);
	}

	public String signup(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("In Controller for Sign Up");
		EmpHelper helper = new EmpHelper();
		helper.saveUser(req, res);
		return toJson("success");
	}

	public String login(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("In Controller for Login");
		EmpHelper helper = new EmpHelper();
		boolean isAuthenticated = helper.authenticateUser(req, res);

        Map<String, String> responseMap = new HashMap<>();
        if (isAuthenticated) {
            responseMap.put("status", "success");
            System.out.println("Login Successfully...");
        } else {
            responseMap.put("status", "error");
            responseMap.put("message", "Invalid username or password");
        }

        return new Gson().toJson(responseMap);
    }

	

	public String updateEmp(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("In Controller for Update");
		EmpHelper ph=new EmpHelper();
		ph.updateEmp(req,res);
		return toJson("Data Updated Successfully") ;

		}
	public String deleteEmp(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("In Controller for Update");
		EmpHelper ph=new EmpHelper();
		ph.deleteEmp(req,res);
		return toJson("Data deleted Successfully") ;

		}
	public String getEmpDetailsById(HttpServletRequest req, HttpServletResponse res) {
	    EmpHelper ph = new EmpHelper();
	    Map map = ph.getEmpDetailsById(req,res);	   
	    String  abc = toJson(map);
	    return abc;
	}
	public String logout(HttpServletRequest req, HttpServletResponse res) {
	    System.out.println("In Controller for Logout");
	    
	    // Invalidate session
	    HttpSession session = req.getSession(false); // Retrieve existing session, don't create a new one
	    if (session != null) {
	        session.invalidate(); // Invalidate the session
	        System.out.println("Logout Successful...");
	        return "{\"status\": \"success\"}";
	    } else {
	        System.out.println("Logout Failed. No active session found.");
	        return "{\"status\": \"error\", \"message\": \"No active session found\"}";
	    }
	}

}
