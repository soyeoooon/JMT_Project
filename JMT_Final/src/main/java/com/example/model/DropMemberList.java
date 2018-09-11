package com.example.model;

import java.util.Date;

public class DropMemberList {
	private int drop_num;
	private String drop_nick;
	private Date drop_date;
	public int getDrop_num() {
		return drop_num;
	}
	public void setDrop_num(int drop_num) {
		this.drop_num = drop_num;
	}
	public String getDrop_nick() {
		return drop_nick;
	}
	public void setDrop_nick(String drop_nick) {
		this.drop_nick = drop_nick;
	}
	public Date getDrop_date() {
		return drop_date;
	}
	public void setDrop_date(Date drop_date) {
		this.drop_date = drop_date;
	}
	@Override
	public String toString() {
		return "DropMemberList [drop_num=" + drop_num + ", drop_nick=" + drop_nick + ", drop_date=" + drop_date + "]";
	}
	
}
