package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.Review;

public interface ReviewDao {
	//추가(v1)
		public Review ReviewInfo(int rev_num);
		public void insert(Review review);
		public void update(Review review);
	
	
	public void insertReview();
	public void updateReview();
	public void deleteReview();
	public List<Review> selectAllReview();
	
	/*-----------------------용화-----------------------------*/
	//맛집에 대한 리뷰목록 조회
	public List<HashMap<String, Object>> ReviewSelect(int r_num);
}
