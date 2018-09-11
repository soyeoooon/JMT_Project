package com.example.dao;

import java.util.List;

import com.example.model.Email;

public interface EmailDao {
	public void insertEmail(String email);
	public void updateEmail();
	public void deleteEmail();
	public Email selectEmail(String email);
	public List<Email> selectAllEmail();
	public int getEmailNum(String email);
}
