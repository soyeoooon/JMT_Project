package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.MemberList;

public interface MemberListDao {
	public void insertMemberList(MemberList memberList);
	public void updateMemberList();
	public void deleteMemberList();
	public MemberList selectOneMemberList(int email_num); //이메일 번호로 조회
	public MemberList selectOneMemberListByNum(int m_num); //회원번호로 조회
	public List<MemberList> selectAllMemberList();
	
	public MemberList selectOneMemberListByPwd(MemberList memberList); //비밀번호 일치여부용
	
	/*--------------------용화--------------------*/
	//유저정보
	public MemberList selectOne(int m_num);
		
	//다른사람 프로필 가져오기(유저정보, 평가정보들)
	public HashMap<String, Object> OthersSelect(int m_num);
}
