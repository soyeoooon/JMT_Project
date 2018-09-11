package com.example.dao;

import java.util.HashMap;

import com.example.model.RestModify;

public interface IRestModifyDao {
	//맛집 수정 로그 기록
	public void insert(RestModify RestModify);
	
	//로그중에서 가장 최신 1개 가져오기
	public HashMap<String, Object> selectLast(int r_num);
	
	
	/*--------------------소연-------------------*/
	//신고처리되면 해당 기록 삭제 위해 레코드 가져오기
	public RestModify selectModify(String r_name);
	
	//위에서 받은 번호를 가지고 신고된 상세정보 기록 삭제하기
	public void deleteModify(int rm_num);
}
