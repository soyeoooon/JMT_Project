package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.BigCategoryDao;
import com.example.dao.PreferenceDao;
import com.example.model.BigCategory;
import com.example.model.Preference;

@Service
public class PreferenceService {
   @Autowired
   PreferenceDao preferenceDao;
   
   public void preferenceInsert(Preference preference) {
      preferenceDao.insert(preference);
   }
   public void preferenceUpdate(Preference preference) {
      preferenceDao.update(preference);
   }
   public Preference preferenceSelect(int m_num) {
      return preferenceDao.selectOne(m_num);
   }
}