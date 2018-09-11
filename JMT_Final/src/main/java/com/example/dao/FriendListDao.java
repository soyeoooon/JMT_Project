package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.model.FriendList;

public interface FriendListDao {
	public void insertFriendList();
	public void updateFriendList();
	public void deleteFriendList();
	public List<FriendList> selectAllFriendList();
	public List<FriendList> selectAllFriendListByEmail(int email_num);
	public List<Integer> selectApplyFriendListByEmailreq(int email_num);
	public List<Integer> selectApplyFriendListByEmailresp(int email_num);
	
	/*--------------------용화--------------------*/
	//친구 추가
	public void insert(FriendList friendList);
		
	//친구 상태 수정(0:대기, 1:친구상태)
	public void update(FriendList friendList);
		
	//본인과 타인이 친구인지 확인
	public String connection(HashMap<String, Integer> map);
}
