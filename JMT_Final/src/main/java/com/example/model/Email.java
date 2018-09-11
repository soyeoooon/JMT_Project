package com.example.model;

public class Email {
	private int email_num;
	private String email;
	public int getEmail_num() {
		return email_num;
	}
	public void setEmail_num(int email_num) {
		this.email_num = email_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Email [email_num=" + email_num + ", email=" + email + "]";
	}
	
}
