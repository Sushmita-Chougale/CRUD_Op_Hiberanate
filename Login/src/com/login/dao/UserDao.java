package com.login.dao;


import javax.transaction.Transaction;

import org.hibernate.Session;

import com.login.hibernate.User;
import com.login.utility.HibernateUtility;

public class UserDao {

	public void saveUser(User user) {
        HibernateUtility hbu = null;
        Session session = null;
        org.hibernate.Transaction transaction = null;
        try {
            hbu = HibernateUtility.getInstance();
            session = hbu.getHibernateSession();
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
            System.out.println("User Added Successfully");
        } catch (RuntimeException e) {
            try {
                if (transaction != null) transaction.rollback();
            } catch (RuntimeException rbe) {
                rbe.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            if (session != null) hbu.closeSession(session);
        }
    }
}

	/*
	 * public boolean getUser(String username, String password) { HibernateUtility
	 * hbu = null; Session session = null; User user = null; try { hbu =
	 * HibernateUtility.getInstance(); session = hbu.getHibernateSession(); user =
	 * (User) session.
	 * createQuery("FROM User WHERE username = :username AND password = :password")
	 * .setParameter("username", username) .setParameter("password", password)
	 * .uniqueResult();
	 * 
	 * if (username == null || username.isEmpty() || password == null ||
	 * password.isEmpty()) { return false; } else { return true; } } catch
	 * (RuntimeException e) { e.printStackTrace(); } finally { if (session != null)
	 * hbu.closeSession(session); } // return user; }
	 */

