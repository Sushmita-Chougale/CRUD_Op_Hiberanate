package com.login.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

import com.login.dao.EmpDao;
import com.login.hibernate.Employee;
import com.login.utility.HibernateUtility;
import com.login.dao.EmpDetailsBean;

public class EmpHelper {

	public void saveUser(HttpServletRequest req, HttpServletResponse res) {
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String designation = req.getParameter("designation");
		String salaryString = req.getParameter("salary");
		double salary = Double.parseDouble(salaryString);
		String number = req.getParameter("number");

		Employee emp = new Employee();
		emp.setuserName(userName);
		emp.setPassword(password);
		emp.setEmail(email);
		emp.setDesignation(designation);
		emp.setSalary(salary);
		emp.setNumber(number);

		System.out.println("Add Helper class");
		EmpDao empDao = new EmpDao();
		empDao.saveEmp(emp);
	}

	 public boolean authenticateUser(HttpServletRequest req, HttpServletResponse res) {
		        String userName = req.getParameter("userName");
		        String password = req.getParameter("password");

		        System.out.println("Authenticating user: " + userName);
		        System.out.println("Password: " + password);

		        EmpDao empDao = new EmpDao();
		        return empDao.authenticateUser(userName, password);
		    }
		


	public void updateEmp(HttpServletRequest req, HttpServletResponse res) {
		// long id=req.getParameter("id");
		long id = Long.parseLong(req.getParameter("id"));
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String designation = req.getParameter("designation");
		String salaryString = req.getParameter("salary");
		double salary = Double.parseDouble(salaryString);
		String number = req.getParameter("number");

		EmpDao pd = new EmpDao();
		pd.updateEmp(id, userName, password, email, designation, salary, number);
	}

	public void deleteEmp(HttpServletRequest req, HttpServletResponse res) {
		long id = Integer.parseInt(req.getParameter("id"));
		EmpDao pd = new EmpDao();
		pd.deleteEmp(id);
	}

	public Map getEmpDetailsById(HttpServletRequest req, HttpServletResponse res) {
		long id = Long.parseLong(req.getParameter("id"));
		EmpDao pd = new EmpDao();
		List list = pd.getEmpDetailsById(id);

		Map map = new HashMap();

		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);

			EmpDetailsBean bean = new EmpDetailsBean();
			bean.setUserName(o[1].toString());
			bean.setPassword(o[2].toString());
			bean.setEmail(o[3].toString());
			bean.setDesignation(o[4].toString());
			bean.setSalary(Double.parseDouble(o[5].toString()));
			bean.setNumber(o[6].toString());

			map.put(bean.getUserName(), bean);
			map.put(bean.getPassword(), bean);
			map.put(bean.getEmail(), bean);
			map.put(bean.getDesignation(), bean);
			map.put(bean.getSalary(), bean);
			map.put(bean.getNumber(), bean);
		}

		return map;
	}
}