package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.EmailDao;

@Service
public class EmailService {
	/*--------------------성록--------------------*/
	@Autowired
	EmailDao emailDao;
	
	public int getEmailNum(String email){
		return emailDao.getEmailNum(email);
	}
	public String getEmailByNum(int email_num){
		return emailDao.getEmailByNum(email_num);
	}
	public List<Integer> getEmailBySearch(String search){
		return emailDao.getEmailNumBySearch(search);
	}
}
