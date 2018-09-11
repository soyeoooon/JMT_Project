package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.Report;
import com.example.model.adminReport;

public interface ReportDao {
	//public void insertReport();
	//public void updateReport();
	public void deleteReport();
	public List<Report> selectAllReport();
	
	/*--------------------용화--------------------*/
	//신고하기
	public void insert(Report report);
		
	//해당 맛집이 신고처리중 상태인지 확인
	public Report selectRestaurant(int r_num);
	
	/*--------------------소연--------------------*/
	public List<Report> selectAll();
	public void insertReport();
	public List<Report> selectBoardPage(HashMap<String,Object> params);
	public int getCount();
	
	//신고 테이블 조인해서 가져오는 것.
	public List<adminReport> selectReportList(HashMap<String,Object> params);
	
	//신고처리 할 레코드를 상태 2로 변경하기
	public void updateReport(int rep_num);
	
}
