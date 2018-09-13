package com.example.dao;

import java.util.List;

import com.example.model.RepList;

public interface RepListDao {
	public void insertRepList();
	public void updateRepList();
	public void deleteRepList();
	public List<RepList> selectAllRepList();
	
	/*--------------------용화--------------------*/
	//신고내용목록
	public List<RepList> selectAll();
}
