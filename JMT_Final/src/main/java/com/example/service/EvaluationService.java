package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.EvaluationDao;
import com.example.model.Evaluation;

@Service
public class EvaluationService {
	/*--------------------성록--------------------*/
	@Autowired
	EvaluationDao evaluationDao;

	public List<Evaluation> selectAllEvaluationByNum(int m_num) {
		return evaluationDao.selectAllEvaluationByNum(m_num);
	}

	public int countEvaluationLikeByNum(int m_num) {
		return evaluationDao.countEvaluationLikeByNum(m_num);
	}

	public int countEvaluationMarkByNum(int m_num) {
		return evaluationDao.countEvaluationMarkByNum(m_num);
	}

	public double getGrade(int r_num) {
		if (evaluationDao.getCountGradeForRestaurant(r_num) > 0) {
			return evaluationDao.getAllGradeForRestaurant(r_num) / evaluationDao.getCountGradeForRestaurant(r_num);
		} else {
			return 0;
		}
	}

	public List<HashMap<String, Object>> getRestaurantByEV(int m_num) {
		return evaluationDao.getRestaurantByEV(m_num);
	}

	public double getEvaluationRestaurantByEmail(int m_num, int r_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		map.put("r_num", r_num);
		if (getCountEforRByEmail(m_num, r_num) > 0)
			return evaluationDao.selectOneEvaluation(map);
		else
			return 0.5;
	}

	public int getCountEforRByEmail(int m_num, int r_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		map.put("r_num", r_num);
		return evaluationDao.getCountEforRByEmail(map);
	}

	public void setEforRByEmail(int m_num, int r_num, double e_grade) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		map.put("r_num", r_num);
		map.put("e_grade", e_grade);
		if (getCountEforRByEmail(m_num, r_num) > 0) {
			evaluationDao.updateEvaluation(map);
		} else {
			evaluationDao.insertEvaluation(map);
		}
	}
}
