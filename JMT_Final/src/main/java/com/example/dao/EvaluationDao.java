package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.Evaluation;

public interface EvaluationDao {
	
	
	/*--------------------성록--------------------*/
	public void insertEvaluation(HashMap<String,Object> map);
	public void updateEvaluation(HashMap<String,Object> map);
	public void deleteEvaluation();
	public int getCountEforRByEmail(HashMap<String,Object> map);
	public double selectOneEvaluation(HashMap<String,Object> map);
	public List<Evaluation> selectAllEvaluationByNum(int m_num);
	public int countEvaluationLikeByNum(int m_num);
	public int countEvaluationMarkByNum(int m_num);
	public double getAllGradeForRestaurant(int r_num);
	public int getCountGradeForRestaurant(int r_num);
	public List<HashMap<String,Object>> getRestaurantByEV(int m_num);

	/*--------------------용화--------------------*/
	// 맛집에 대한 평가(좋아요 합계, 즐겨찾기 합계, 평균 평점)
	public HashMap<String, Object> restaurantSelect(int r_num);

	// 맛집에 대한 개인 평가기록(내가 맛집에 내린 평가정보)
	public Evaluation memberSelect(HashMap<String, String> map);

	// 평가 추가
	public void insert(Evaluation evaluation);

	// 좋아요 on/off
	public void likeUpdate(HashMap<String, String> map);

	// 즐겨찾기 on/off
	public void markUpdate(HashMap<String, String> map);

	// 평점 수정
	public void gradeUpdate(HashMap<String, String> map);
}
