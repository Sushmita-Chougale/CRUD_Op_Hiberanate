package com.login.utility;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtility {
	private SessionFactory factoryInstance;
	private static HibernateUtility utilityInstance;

	private HibernateUtility() {
		try {
			System.out.println("IN HIBERNATE UTILITY");
			factoryInstance = new Configuration().configure().buildSessionFactory();
			// factoryInstance.
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static synchronized HibernateUtility getInstance() {
		if (utilityInstance == null) {
			utilityInstance = new HibernateUtility();
		}

		return utilityInstance;
	}

	public Session getHibernateSession() {
		return this.factoryInstance.openSession();
	}

	public boolean closeSession(Session session) {
		try {
			session.close();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static Object getSessionFactory() {
		// TODO Auto-generated method stub
		return null;
	}
}
