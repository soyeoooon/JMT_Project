package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.MidCategoryDao;
import com.example.model.MidCategory;

@Service
public class MidCategoryService {
	@Autowired
	   MidCategoryDao midCategoryDao;
	   public List<MidCategory> selectMidCategory(int big_num) {
	      return midCategoryDao.selectMidCategory(big_num);
	   }

}
