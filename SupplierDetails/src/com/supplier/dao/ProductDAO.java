package com.supplier.dao;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.Transaction;

import com.supplier.hibernate.ProductDTO;
import com.supplier.utility.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import java.util.ArrayList;
import java.util.List;
    
public class ProductDAO {
	public void saveProduct(ProductDTO product) {
		HibernateUtility hbu = null;
		Session session=null;
		Transaction transaction=null;
		try {
	        hbu = HibernateUtility.getInstance();
			session=hbu.getHibernateSession();
			transaction=session.beginTransaction();
			session.save(product);
			transaction.commit();
			System.out.println("Data Added Successfully");
			
			}
		catch(RuntimeException e) {
			try {
				transaction.rollback();
			}
			catch(RuntimeException rbe) {
		}
	}finally {
		hbu.closeSession(session);
		}
	}
	
	public void updateProduct(long id, String supplierName, String productName, double price, double quantity) {
        HibernateUtility hbu = null;
        Session session = null;
        Transaction transaction = null;
        try {
            hbu = HibernateUtility.getInstance();
            session = hbu.getHibernateSession();
            transaction = session.beginTransaction();
            ProductDTO product = (ProductDTO) session.get(ProductDTO.class, id);
            product.setId(id);
            product.setSupplierName(supplierName);
            product.setProductName(productName);
            product.setPrice(price);
            product.setQuantity(quantity);
            session.saveOrUpdate(product); 
            transaction.commit();
            System.out.println("Data Updated Successfully");
        } 
        catch (RuntimeException e) {
            try {
                transaction.rollback();
            } catch (RuntimeException rbe) {
                   
            	
            }
        } finally {
            hbu.closeSession(session);
        }
    }
	public void deleteProduct(long id) {
        HibernateUtility hbu = null;
        Session session = null;
        Transaction transaction = null;
        try {
            hbu = HibernateUtility.getInstance();
            session = hbu.getHibernateSession();
            transaction = session.beginTransaction();
            ProductDTO product = (ProductDTO) session.get(ProductDTO.class, id);
            session.delete(product); 
            transaction.commit();
            System.out.println("Data deleted Successfully");
        } 
        catch (RuntimeException e) {
            try {
                transaction.rollback();
            } catch (RuntimeException rbe) {
                   
            	
            }
        } finally {
            hbu.closeSession(session);
        }
    }
	
	
	public List<ProductDTO> getAllProductDetails() {
	    org.hibernate.Session session = null;
	    HibernateUtility hbu = null;
	    List<ProductDTO> productList = null;
	    try {
	    	hbu = HibernateUtility.getInstance();
	        session = hbu.getHibernateSession();
	        Query query = session.createQuery("FROM ProductDTO");
	        productList = query.list();
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        if(session != null) {
	            session.close();
	        }
	    }
	    return productList;
	}
	
	public static List<Long> getProductId() {
	    List<Long> id = new ArrayList<>();
	    org.hibernate.Session session = null;
	    HibernateUtility hbu = null;
	    try {
	        hbu = HibernateUtility.getInstance();
	        session = hbu.getHibernateSession();
	        Query query = session.createQuery("SELECT id FROM ProductDTO");
	        id = query.list();
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        if(session != null) {
	            session.close();
	        }
	    }
	    return id;
	}
	private org.hibernate.Session getTransaction() {
		return null;
	}

	public void saveOrUpdateProduct(long id) {
		// TODO Auto-generated method stub
		
	}
	public List getProductDetailsById(long id) {
	    
	    org.hibernate.Session session = null;
	    HibernateUtility hbu = null;
	    List product = null;
	    
	    try {
	        hbu = HibernateUtility.getInstance();
	        session = hbu.getHibernateSession();
	        Query query = session.createSQLQuery("SELECT * FROM product_data  WHERE id="+id);
	        product  =query.list();
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        if(session != null) {
	            session.close();
	        }
	    }
	    return  product;
	}


    
	
}