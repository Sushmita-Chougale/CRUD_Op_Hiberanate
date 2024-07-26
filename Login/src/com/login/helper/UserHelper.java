package com.login.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.UserDao;
import com.login.hibernate.User;



public class UserHelper {

	public void saveUser(HttpServletRequest req, HttpServletResponse res) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        UserDao userDao = new UserDao();
        userDao.saveUser(user);
    }

	/*
	 * public boolean authenticateUser(HttpServletRequest req, HttpServletResponse
	 * res) { String username = req.getParameter("username"); String password =
	 * req.getParameter("password");
	 * 
	 * UserDao userDao = new UserDao(); boolean user = userDao.getUser(username,
	 * password);
	 * 
	 * return (Boolean) null; }
	 */
}

