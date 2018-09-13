package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ReportDao;
import com.example.dao.RestaurantDao;
import com.example.model.Report;

@Service
public class ReportService {
	
	/*--------------------소연--------------------*/
	@Autowired
	private ReportDao reportdao;
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	public List<Report> getReportList() {
		return reportdao.selectAll();
	}
	
	/*
	 	getStartPage : 네비게이터의 첫번째번호
	 	getEndPage : 네비게이터의 마지막번호
	 	getLastPage : 총 게시물의 수를 가져와서 가장 마지막 페이지 번호 구하기
	 */
	
	public int getStartPage(int page) {
		//현재페이지-(현재페이지-1)%네비게이터 블록 크기
		return page-((page-1)%10);
	}
	
	public int getEndPage(int page) {
		//첫번째 페이지 번호 + (네비게이터 블록 크기 -1)
		return (page-((page-1)%10))+(10-1);
		
	}
	
	public int getLastPage(int NumOfBoards) {
		//총 게시물의 수를 가져와서 맨 마지막 페이지 구하기
		
		int page=0;
		if((NumOfBoards%10) !=0) {
			page=(NumOfBoards/10)+1;
		}
		else {
			page=NumOfBoards/10;
		}
		return page;
		
	}
	
	public int getOffset(int page) {
		//offset : 게시물의 일부만 가져올때 얼만큼 건너뛰어야 하는지
		return (page-1)*10;
		
	}
	
	//게시물 페이지정보 얻기 가능
	public HashMap<String,Object> getBoardListPage(int page){
		
		//mapper에 인수를 전달하기 위한 map
		HashMap<String,Object> params=new HashMap<String,Object>();
		params.put("offset", getOffset(page));
		params.put("boardsPerPage",10);
		
		//페이징 처리 정보를 담은 맵
		HashMap<String,Object> pageInfo=new HashMap<String,Object>();
		pageInfo.put("page", page);
		//pageInfo.put("current", page);
		pageInfo.put("start", getStartPage(page));
		pageInfo.put("end", getEndPage(page));
		pageInfo.put("last", getLastPage(reportdao.getCount()));
		pageInfo.put("totalPage", reportdao.getCount());
		
		//pageInfo.put("reportList", reportdao.selectBoardPage(params));
		pageInfo.put("reportList",reportdao.selectReportList(params));
		pageInfo.put("restaurantList",restaurantDao.selectAllRestaurant());
		return pageInfo;
		
		
	}
	
	public void UpdateReport(int rep_num) {
		reportdao.updateReport(rep_num);
	}
	
	public int getCountReport() {
		return reportdao.getCount2();
	}

}
