package com.example.dao;

import java.util.List;

import com.example.model.BigCategory;

public interface BigCategoryDao {
	/*--------------------성록--------------------*/
	public void insertBigCategory(String big_name);
	public void updateBigCategory();
	public void deleteBigCategory();
	public List<BigCategory> selectAllBigCategory();
	public int countBigcategory(String big_name);
	public int getBigcategoryNum(String big_name);
	// 빅카테고리다오 추가
	   public String getBigcategoryName(int big_num);
	
	
}
