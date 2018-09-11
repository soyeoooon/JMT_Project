package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.EvaluationDao;
import com.example.model.Evaluation;

@Service
public class EvaluationService {
	@Autowired
	EvaluationDao evaluationDao;

	public List<Evaluation> selectAllEvaluationByEmail(int m_num) {
		return evaluationDao.selectAllEvaluationByEmail(m_num);
	}

	public int countEvaluationLikeByEmail(int m_num) {
		return evaluationDao.countEvaluationLikeByEmail(m_num);
	}

	public int countEvaluationMarkByEmail(int m_num) {
		return evaluationDao.countEvaluationMarkByEmail(m_num);
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
		if(getCountEforRByEmail(m_num, r_num)>0){
			evaluationDao.updateEvaluation(map);
		}else{
			evaluationDao.insertEvaluation(map);
		}
	}
}
