package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.RestModify;
import com.example.model.Restaurant;

public interface RestaurantDao {
	public void insertRestaurant(Restaurant restaurant);
	public void updateRestaurant(Restaurant restaurant);
	public void deleteRestaurant(int r_num);
	public List<Integer> selectOneRestaurantNum(HashMap<String, Object> map);
	public int countRestaurantNum(HashMap<String, Object> map);
	//public List<Restaurant> selectAllRestaurant();
	
	
	/*--------------------소연----------------------*/
	public Restaurant selectOneRestaurantName(String r_name,String r_address);
	public void updateRestaurantByReport(RestModify rm);
	public List<Restaurant> selectAllRestaurant();
	
	//관리자 음식점 리스트 처리위한것.
	public List<Restaurant> selectBoardPage(HashMap<String,Object> params);
	public int getCount();
	
	//관리자 음식점 리스트 검색처리위한것.
	public List<Restaurant> selectBoardPagebyKeyword(HashMap<String, Object> params);
	
	
	
	/*--------------------용화----------------------*/
	//맛집 정보 가져오기
	public Restaurant selectOne(int r_num);
		
	//맛집 정보 수정
	public void updateInfo(RestModify restModify);
}
