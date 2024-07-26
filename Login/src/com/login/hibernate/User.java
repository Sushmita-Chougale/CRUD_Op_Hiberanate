package com.login.hibernate;

public class User {
	private String username;
    private String password;
    private Long id;
    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public User(Long id,String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		
	}

	public User() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
}
