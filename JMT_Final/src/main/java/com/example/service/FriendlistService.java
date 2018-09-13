package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FriendListDao;
import com.example.model.FriendList;

@Service
public class FriendlistService {
	/*--------------------성록--------------------*/
	@Autowired
	FriendListDao friendListDao;
	
	public List<FriendList> selectAllFriendListByEmail(int email_num){
		return friendListDao.selectAllFriendListByEmail(email_num);
	}
	
	public List<Integer> selectApplyFriendListByEmail(int email_num){
		List<Integer> fl = friendListDao.selectApplyFriendListByEmailreq(email_num);
		List<Integer> fl2 = friendListDao.selectApplyFriendListByEmailresp(email_num);
		for(int number : fl2){
			fl.add(number);
		}
		return fl;
	}
	public List<Integer> selectReqFriendListByEmail(int email_num){
		return friendListDao.selectReqFriendListByEmail(email_num);
	}
	public void updateFriend(int req_mail,int resp_mail){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("req_mail", req_mail);
		map.put("resp_mail", resp_mail);
		friendListDao.updateFriendList(map);
	}
	public void deleteFriend(int req_mail,int resp_mail){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("req_mail", req_mail);
		map.put("resp_mail", resp_mail);
		friendListDao.deleteFriendList(map);
	}
	public int isFriend(int req_mail,int resp_mail){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("req_mail", req_mail);
		map.put("resp_mail", resp_mail);
		if(friendListDao.isFriend(map)>0)
			return 1; // 이미친구
		else if(friendListDao.isFriend2(map)>0)
			return 2; // 내가 신청한 상황
		else if(friendListDao.isFriend3(map)>0)
			return 3; // 상대가 신청한 상황
		else
			return 4; // 친구아닌상황
	}

	public void insertFriendList(int req_mail, int resp_mail) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("req_mail", req_mail);
		map.put("resp_mail", resp_mail);
		friendListDao.insertFriendList(map);
	}
}
