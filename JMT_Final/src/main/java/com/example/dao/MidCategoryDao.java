package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.MidCategory;

public interface MidCategoryDao {
	/*--------------------성록--------------------*/
	public void insertMidCategory(HashMap<String,Object> map);
	public void updateMidCategory();
	public void deleteMidCategory();
	public List<MidCategory> selectAllMidCategory();
	public int countMidCategory(HashMap<String,Object> map);
	
	public List<MidCategory> selectMidCategory(int big_num);
}
