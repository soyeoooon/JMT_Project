package com.example.dao;

import java.util.List;

import com.example.model.Recommend;

public interface RecommendDao {
   public List<Recommend> selectAllRecommend(int m_num);
   
}
