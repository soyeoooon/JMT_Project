package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.MemberList;

public interface MemberListDao {
	//수정(v2)
		public void insert(MemberList memberList);
		public Integer naverCheck(String id);
		public Integer kakaoCheck(String id);
	/*--------------------성록--------------------*/
	//public void insertMemberList();
	public void updateMemberList(HashMap<String,Object> map);
	public void updateIntro(HashMap<String,Object> map);
	public void deleteMemberList();
	//public MemberList selectOneMemberList(String m_mail); //소연-> 변경하여 씀
	//public MemberList selectOneMemberListByNum(int m_num);
	//public List<MemberList> selectAllMemberList();
	public int getM_NumByEmailNum(int email_num);
	public List<MemberList> getAllByNick(String search);
	
	public List<MemberList> selectAllMemberList();
	
	/*--------------------소연--------------------*/
	public void insertMemberList(MemberList memberList);
	public int getCountMember();
	public MemberList selectOneMemberList(int email_num); //이메일 번호로 조회
	public MemberList selectOneMemberListByNum(int m_num); //회원번호로 조회
	
	public MemberList selectOneMemberListByPwd(MemberList memberList); //비밀번호 일치여부용
	
	/*--------------------용화--------------------*/
	//유저정보
	public MemberList selectOne(int m_num);
		
	//다른사람 프로필 가져오기(유저정보, 평가정보들)
	public HashMap<String, Object> OthersSelect(int m_num);
}
