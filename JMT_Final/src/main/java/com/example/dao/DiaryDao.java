package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.Diary;

public interface DiaryDao {
	//추가(v1)
		public List<Integer> getDiaryNumBySearch(HashMap<String,Object> map);
	/*--------------------성록--------------------*/
	public void insertDiary(Diary diary);
	public void updateDiary();
	public void deleteDiary(int diary_num);
	public List<Diary> selectAllDiary();
	public List<Diary> selectAllDiaryByEmail(HashMap<String,Object> map);
	public List<Diary> selectAllDiaryByEmailandDate(HashMap<String,Object> map);
	public HashMap<String,Object> getNextAI();
	public int countAllDiary(int m_mail);
	public HashMap<String,Object> selectOneDiary(int diary_num);
}
