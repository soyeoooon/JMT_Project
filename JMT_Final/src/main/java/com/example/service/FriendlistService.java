package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FriendListDao;
import com.example.model.FriendList;

@Service
public class FriendlistService {
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
}
