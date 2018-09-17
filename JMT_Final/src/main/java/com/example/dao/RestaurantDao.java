package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.RestModify;
import com.example.model.Restaurant;

public interface RestaurantDao {
	/*--------------------------------추가(v2)-----------------------------------------*/
	public void countUpdate(HashMap<String, Object> map);
	/*--------------------------------수정(v2)-----------------------------------------*/
	public void insertRestaurant2(HashMap<String, Object> map);
	
	/*--------------------성록----------------------*/
	public void insertRestaurant(Restaurant restaurant);
	public void updateRestaurant(Restaurant restaurant);
	public void deleteRestaurant(int r_num);
	public List<Integer> selectOneRestaurantNum(HashMap<String, Object> map);
	public int countRestaurantNum(HashMap<String, Object> map);
	//public List<Restaurant> selectAllRestaurant();
	public List<HashMap<String,Object>> selectRestaurantByLikeandMark(int m_num);
	public List<HashMap<String,Object>> selectRestaurantByLike(int m_num);
	public List<HashMap<String,Object>> selectRestaurantByMark(int m_num);
	//public List<Restaurant> selectAllRestaurant();
	// 레스토랑다오 추가
	   public Restaurant selectRestaurantByRNum(int r_num);

	
	
	/*--------------------소연----------------------*/
	/*---------------------수정(v1)---------------------*/
	public Restaurant selectOneRestaurantName(HashMap<String, String> map);
	
	
	
	public void updateRestaurantByReport(RestModify rm);
	public List<Restaurant> selectAllRestaurant();
	
	//관리자 음식점 리스트 처리위한것.
	public List<Restaurant> selectBoardPage(HashMap<String,Object> params);
	public int getCount();
	
	//09-11추가
	public int getCountKeyword(HashMap<String,Object> params);
	
	//관리자 음식점 리스트 검색처리위한것.
	public List<Restaurant> selectBoardPagebyKeyword(HashMap<String, Object> params);
	
	
	
	/*--------------------용화----------------------*/
	//맛집 정보 가져오기
	public Restaurant selectOne(int r_num);
		
	//맛집 정보 수정
	public void updateInfo(RestModify restModify);
}
