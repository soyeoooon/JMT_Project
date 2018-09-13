package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.BigCategoryDao;
import com.example.model.BigCategory;

@Service
public class BigCategoryService {
	/*--------------------성록--------------------*/
	@Autowired
	BigCategoryDao bigCategoryDao;
	
	public List<BigCategory> selectAllBigCategory(){
		return bigCategoryDao.selectAllBigCategory();
	}

}
