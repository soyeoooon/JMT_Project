package com.example.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.EmailDao;
import com.example.dao.MemberListDao;
import com.example.model.Email;
import com.example.model.MemberList;

@Service
public class MemberListService {

	@Autowired
	MemberListDao memberListDao;

	@Autowired
	EmailDao emailDao;
	/*--------------------성록--------------------*/
	public MemberList selectOneMemberListByNum(int email_num) {
		return memberListDao.selectOneMemberListByNum(email_num);
	}

	public List<MemberList> selectOneMember(List<Integer> friendNums) {
		List<MemberList> friendList = new ArrayList<MemberList>();
		for (int friend : friendNums) {
			friendList.add(memberListDao.selectOneMemberListByNum(friend));
		}
		return friendList;
	}
	public String getFriendPhoto(int friendNum){
		if(memberListDao.selectOneMemberListByNum(friendNum).getM_photo()==null){
			return "0";
		}else{
			return memberListDao.selectOneMemberListByNum(friendNum).getM_photo();
		}
	}
	public int getM_NumByEmailNum(int email_num) {
		return memberListDao.getM_NumByEmailNum(email_num);
	}
	public void updateMemberlist(int email_num,String m_nick,String m_pwd){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("email_num", email_num);
		map.put("m_nick", m_nick);
		map.put("m_pwd", m_pwd);
		memberListDao.updateMemberList(map);
	}
	public void updateIntro(int email_num,String m_intro){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("email_num", email_num);
		map.put("m_intro", m_intro);
		memberListDao.updateIntro(map);
	}
	public List<MemberList> getMemberListByNick(String search){
		return memberListDao.getAllByNick(search);
	}

	// ----------------------------------소연추가---------------------------------------------//

	public int join(HashMap<String, Object> params) {
		MemberList memberList = new MemberList();
		if (emailDao.selectEmail((String) params.get("email")) == null) {
			emailDao.insertEmail((String) params.get("email"));

			memberList.setEmail_num(emailDao.getEmailNum((String) params.get("email")));
			memberList.setM_nick((String) params.get("name"));
			memberList.setM_pwd((String) params.get("pwd"));

			memberListDao.insertMemberList(memberList);
			return 1;
		}
		return 0;
	}

	public int login(HashMap<String, Object> params) {
		if (emailDao.selectEmail((String) params.get("email")) != null) {
			int email_num = emailDao.selectEmail((String) params.get("email")).getEmail_num();
			MemberList memberList = new MemberList();
			memberList.setEmail_num(email_num);
			memberList.setM_pwd((String)params.get("pwd"));
			
			if(memberListDao.selectOneMemberListByPwd(memberList)!=null) {
				return 1;
			} 
			else {
				return 0;// 이메일과 비번 불일치
			}
		} 
		else {
			return -1; // 이메일 없는경우
		}

	}
	
	public MemberList getOneMember(String email) {
		if(email!=null) {
			Email e =emailDao.selectEmail(email);
			return memberListDao.selectOneMemberList(e.getEmail_num());
		}
		return null;
	}
	
	public int getCountMember() {
		return memberListDao.getCountMember();
	}


}












