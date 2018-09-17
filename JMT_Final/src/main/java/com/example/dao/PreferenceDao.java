package com.example.dao;

import com.example.model.MemberList;
import com.example.model.Preference;

public interface PreferenceDao {
   public void insert(Preference preference);
   public void update(Preference preference);
   public Preference selectOne(int m_num);
}
