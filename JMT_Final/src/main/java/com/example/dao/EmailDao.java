package com.example.dao;

import java.util.List;

import com.example.model.Email;

public interface EmailDao {
	/*--------------------성록--------------------*/
	public void insertEmail(String email);
	//public void insertEmail();
	public void updateEmail();
	public void deleteEmail();
	public List<Email> selectAllEmail();
	public int getEmailNum(String email);
	public String getEmailByNum(int email_num);
	public List<Integer> getEmailNumBySearch(String search);
	
	/*--------------------소연--------------------*/
	public Email selectEmail(String email);
}
