package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.BigCategoryDao;
import com.example.dao.FoodChoiceDao;
import com.example.dao.PreferenceDao;
import com.example.model.BigCategory;
import com.example.model.FoodChoice;
import com.example.model.Preference;

@Service
public class FoodChoiceService {
   @Autowired
   FoodChoiceDao foodChoiceDao;
   
   public void foodChoiceInsert(FoodChoice foodChoice) {
      foodChoiceDao.insert(foodChoice);
   }
   public void foodChoiceUpdate(FoodChoice foodChoice) {
      foodChoiceDao.update(foodChoice);
   }
   public List<FoodChoice> foodChoiceSelect(int m_num) {
      return foodChoiceDao.select(m_num);
   }
   public FoodChoice foodChoiceSelectOne(HashMap<String, String> map) {
      return foodChoiceDao.selectOne(map);
   }
}