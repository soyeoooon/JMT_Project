package com.example.dao;

import java.util.List;

import com.example.model.RepResult;

public interface RepResultDao {
	public void insertRepResult();
	public void updateRepResult();
	public void deleteRepResult();
	public List<RepResult> selectAllRepResult();
}
