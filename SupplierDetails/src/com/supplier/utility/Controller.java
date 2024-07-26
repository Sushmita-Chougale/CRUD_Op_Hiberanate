package com.supplier.utility;


import com.supplier.helper.DemoHelper;
import com.supplier.hibernate.ProductDTO;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.*;

public class Controller {

	 private String toJson(Object data)
	 {
		 Gson gson = new GsonBuilder().setPrettyPrinting().disableHtmlEscaping().create();
		 return gson.toJson(data);
	 }
	
	public String saveProduct(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("In Controller for Save");
	DemoHelper ph=new DemoHelper();
	ph.saveProduct(req,res);
	return toJson("Data Added Successfully") ;
	

}
	public String updateProduct(HttpServletRequest req,HttpServletResponse res) {
	System.out.println("In Controller for Update");
	DemoHelper ph=new DemoHelper();
	ph.updateProduct(req,res);
	return toJson("Data Updated Successfully") ;

	}
	public String deleteProduct(HttpServletRequest req,HttpServletResponse res) {
	System.out.println("In Controller for Update");
	DemoHelper ph=new DemoHelper();
	ph.deleteProduct(req,res);
	return toJson("Data deleted Successfully") ;

	}
	public String getAllProductDetails(HttpServletRequest req,HttpServletResponse res) {
		DemoHelper ph = new DemoHelper(); 
        List categories = ph.getAllProductDetails(req, res); 
        Map<String, List> returnMap = new HashMap<>(); 
        returnMap.put("list", categories);
        System.out.println("$$$$$$$$$$$$$$$$" + returnMap); 
        return toJson(returnMap);
    }
	public String getProductDetailsById(HttpServletRequest req, HttpServletResponse res) {
	    DemoHelper ph = new DemoHelper();
	    Map map = ph.getProductDetailsById(req,res);	   
	    String  abc = toJson(map);
	    return abc;
	}


}