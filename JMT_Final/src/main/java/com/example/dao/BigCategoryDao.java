package com.example.dao;

import java.util.List;

import com.example.model.BigCategory;

public interface BigCategoryDao {
	public void insertBigCategory();
	public void updateBigCategory();
	public void deleteBigCategory();
	public List<BigCategory> selectAllBigCategory();
}
