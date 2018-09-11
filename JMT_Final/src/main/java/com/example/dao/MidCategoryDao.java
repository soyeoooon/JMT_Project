package com.example.dao;

import java.util.List;

import com.example.model.MidCategory;

public interface MidCategoryDao {
	public void insertMidCategory();
	public void updateMidCategory();
	public void deleteMidCategory();
	public List<MidCategory> selectAllMidCategory();
}
