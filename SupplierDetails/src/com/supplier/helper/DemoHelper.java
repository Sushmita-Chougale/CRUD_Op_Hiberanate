package com.supplier.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

import com.supplier.dao.ProductDAO;
import com.supplier.dao.SupplierDetailsBean;
import com.supplier.hibernate.ProductDTO;
import com.supplier.utility.HibernateUtility;

public class DemoHelper {
	

	public void saveProduct(HttpServletRequest req, HttpServletResponse res) {
		//Fetch user form data from UI
		
				String supplierName = req.getParameter("supplierName");
				String productName = req.getParameter("productName");
				String price =  req.getParameter("price");
				String quantity = req.getParameter("quantity");

				ProductDTO product = new ProductDTO();
				product.setSupplierName(supplierName);
				product.setProductName(productName);
				product.setPrice(Double.parseDouble(price));
				product.setQuantity(Double.parseDouble(quantity));

				ProductDAO pd= new ProductDAO();
			    
			        pd.saveProduct(product);
		}
	
	public void updateProduct(HttpServletRequest req, HttpServletResponse res) {
	    long id = Long.parseLong(req.getParameter("id"));
	    String supplierName = req.getParameter("supplierName");
	    String productName = req.getParameter("productName");
	    double price = Double.parseDouble(req.getParameter("price"));
	    double quantity = Double.parseDouble(req.getParameter("quantity"));

	    ProductDAO pd = new ProductDAO();
	    pd.updateProduct(id, supplierName, productName, price, quantity);
	}

	public void deleteProduct(HttpServletRequest req, HttpServletResponse res) 
	 {
		long id = Integer.parseInt(req.getParameter("id"));
		ProductDAO pd= new ProductDAO();
		pd.deleteProduct(id);
		
	}	
	@SuppressWarnings("unchecked")
	public List<ProductDTO> getAllProductDetails(HttpServletRequest req,HttpServletResponse res) {
        HibernateUtility hbu = null;
        Session session = null;
        List<ProductDTO> productList = null;
        try {
            hbu = HibernateUtility.getInstance();
            session = hbu.getHibernateSession();
            String queryString = "FROM ProductDTO"; 
            Query query = session.createQuery(queryString);
            productList = query.list(); 
        } catch (Exception e) {
            
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
        return productList;
    }
	
	public Map getProductDetailsById(HttpServletRequest req, HttpServletResponse res) {
	    long id = Long.parseLong(req.getParameter("id"));
	    ProductDAO pd = new ProductDAO();
	    List list = pd.getProductDetailsById(id);
	     
	    Map map  = new HashMap();
	    
	    for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);

			SupplierDetailsBean bean = new SupplierDetailsBean();
			bean.setSupplierName(o[1].toString());
			bean.setProductName(o[2].toString());
			bean.setPrice(Double.parseDouble(o[3].toString()));
			bean.setQuantity(Double.parseDouble(o[4].toString()));
            
			map.put(bean.getSupplierName(),bean);
			map.put(bean.getProductName(),bean);
			map.put(bean.getPrice(),bean);
			map.put(bean.getQuantity(),bean);
	    }	
	    
	    return map;
	}
	
}
	

