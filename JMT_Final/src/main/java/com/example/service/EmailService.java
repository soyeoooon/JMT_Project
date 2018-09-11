package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.EmailDao;

@Service
public class EmailService {
	@Autowired
	EmailDao emailDao;
	
	public int getEmailNum(String email){
		return emailDao.getEmailNum(email);
	}
}
