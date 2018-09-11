package com.example.service;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.DiaryDao;
import com.example.model.Diary;

@Service
public class DiaryService {

	@Autowired
	DiaryDao diaryDao;

	public List<Diary> selectAllDiaryByEmail(int m_mail, int readPage) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("m_mail", m_mail);
		map.put("rowNum", (readPage-1)*10);
		return diaryDao.selectAllDiaryByEmail(map);
	}
	public int countAllDiaryByEmail(int m_mail){
		return diaryDao.countAllDiary(m_mail);
	}

	public List<Diary> selectAllDiaryByEmailandDate(int m_mail, String diary_date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_mail", m_mail);
		map.put("diary_date", diary_date);
		return diaryDao.selectAllDiaryByEmailandDate(map);
	}

	public void insertDiary(Diary diary) {
		diaryDao.insertDiary(diary);
	}
	
	public int getNextAI(){
		Integer result = ((BigInteger) diaryDao.getNextAI().get("Auto_increment")).intValue();
		return result;
	}
	public void deleteDiary(int diary_num){
		diaryDao.deleteDiary(diary_num);
	}
	public HashMap<String,Object> selectOneDiary(int diary_num){
		return diaryDao.selectOneDiary(diary_num);
	}

}
