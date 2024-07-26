package com.login.dao;

public class EmpDetailsBean {

	private String userName;
	private String password;
	private String email;
	private String designation;
	private Double salary;
	private String number;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public EmpDetailsBean(String userName, String password, String email, String designation, Double salary,
			String number) {
		super();
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.designation = designation;
		this.salary = salary;
		this.number = number;
	}
	public EmpDetailsBean() {
		super();
	}
	public String toString() {
		return "EmpDetailsBean [UserName=" + userName + ", password=" + password + ", email=" + email
				+ ", designation=" + designation + ",Salary="+salary+",Number="+number+"]";
	}
	
	
}
