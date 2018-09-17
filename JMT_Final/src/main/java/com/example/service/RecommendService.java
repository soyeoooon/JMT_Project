package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RecommendDao;
import com.example.model.Recommend;

@Service
public class RecommendService {
   @Autowired
   RecommendDao recommendDao;
   
   public List<Recommend> getRecommend(int m_num){
      return recommendDao.selectAllRecommend(m_num);
   }
}