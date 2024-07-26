package com.login.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.login.hibernate.Employee;
import com.login.utility.HibernateUtility;


public class EmpDao {
	public void saveEmp(Employee emp) {
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			System.out.println("DAO");
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(emp);
			transaction.commit();
			System.out.println("User Added Successfully");
		} catch (RuntimeException e) {
			try {
				if (transaction != null)
					transaction.rollback();
			} catch (RuntimeException rbe) {
				rbe.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			if (session != null)
				hbu.closeSession(session);
		}
	}
	public boolean authenticateUser(String userName, String password) {
        if (userName == null || userName.isEmpty() || password == null || password.isEmpty()) {
            System.out.println("Username or password is empty.");
            return false;
        }

        HibernateUtility hbu = null;
        Session session = null;
        Transaction transaction = null;

        try {
            hbu = HibernateUtility.getInstance();
            session = hbu.getHibernateSession();
            transaction = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT employee_name, password FROM employee_table WHERE employee_name = :userName AND password = :password");
            query.setParameter("userName", userName);
            query.setParameter("password", password);

            List<Object[]> resultList = query.list();
            transaction.commit();

            if (resultList != null && !resultList.isEmpty()) {
                for (Object[] result : resultList) {
                    String dbuserName = (String) result[0];
                    String dbPassword = (String) result[1];
                    if (userName.equals(dbuserName) && password.equals(dbPassword)) {
                        System.out.println("User authenticated successfully.");
                        return true; // User found with matching credentials
                    }
                }
            }
            System.out.println("No matching user found.");
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return false; // User not found or error occurred
    }

	public List<Employee> getAllEmpDetails() {
	    Session session = null;
	    HibernateUtility hbu = null;
	    List<Employee> empList = null;
	    
	    try {
	        hbu = HibernateUtility.getInstance();
	        session = hbu.getHibernateSession();
	        
	        
	        empList = session.createSQLQuery("SELECT * FROM employee_table").addEntity(Employee.class).list();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	     
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    return empList;
	}
	public void updateEmp(long id,String userName,String password, String email,String designation, double salary, String number) {
        HibernateUtility hbu = null;
        Session session = null;
        Transaction transaction = null;
        try {
            hbu = HibernateUtility.getInstance();
            session = hbu.getHibernateSession();
            transaction = session.beginTransaction();
            Employee emp = (Employee) session.get(Employee.class,id);
            emp.setId(id);
            emp.setuserName(userName);
            emp.setPassword(password);
            emp.setEmail(email);
            emp.setDesignation(designation);
            emp.setSalary(salary);
            emp.setNumber(number);
            session.saveOrUpdate(emp); 
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
	public void deleteEmp(long id) {
        HibernateUtility hbu = null;
        Session session = null;
        Transaction transaction = null;
        try {
            hbu = HibernateUtility.getInstance();
            session = hbu.getHibernateSession();
            transaction = session.beginTransaction();
            Employee emp = (Employee) session.get(Employee.class, id);
            session.delete(emp); 
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
	public static List<Long> getEmpId() {
	    List<Long> id = new ArrayList<>();
	    org.hibernate.Session session = null;
	    HibernateUtility hbu = null;
	    try {
	        hbu = HibernateUtility.getInstance();
	        session = hbu.getHibernateSession();
	        Query query = session.createQuery("SELECT id FROM Employee");
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
public List getEmpDetailsById(long id) {
	    
	    org.hibernate.Session session = null;
	    HibernateUtility hbu = null;
	    List emp = null;
	    
	    try {
	        hbu = HibernateUtility.getInstance();
	        session = hbu.getHibernateSession();
	        Query query = session.createSQLQuery("SELECT * FROM employee_table  WHERE id="+id);
	        emp  =query.list();
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        if(session != null) {
	            session.close();
	        }
	    }
	    return emp;
	}
//public List<Employee> searchTable(String query) {
//    Session session = null;
//    HibernateUtility hbu = null;
//    List<Employee> empList = null;
//
//    try {
//        hbu = HibernateUtility.getInstance();
//        session = hbu.getHibernateSession();
//        String sqlQuery = "SELECT * FROM employee_table WHERE userName LIKE :query OR email LIKE :query OR designation LIKE :query";
//        empList = session.createSQLQuery(sqlQuery).addEntity(Employee.class).setParameter("query", "%" + query + "%").list();
//    } catch (Exception e) {
//        e.printStackTrace();
//    } finally {
//        if (session != null) {
//            session.close();
//        }
//    }
//    return empList;
//}
}
