package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.FoodChoice;
import com.example.model.MemberList;
import com.example.model.Preference;

public interface FoodChoiceDao {
   public void insert(FoodChoice FoodChoice);
   public void update(FoodChoice foodChoice);
   public List<FoodChoice> select(int m_num);
   public FoodChoice selectOne(HashMap<String, String> map);
}
