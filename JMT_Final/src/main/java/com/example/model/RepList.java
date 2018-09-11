package com.example.model;

public class RepList {
	private int replist_num;
	private String replist_content;
	public int getReplist_num() {
		return replist_num;
	}
	public void setReplist_num(int replist_num) {
		this.replist_num = replist_num;
	}
	public String getReplist_content() {
		return replist_content;
	}
	public void setReplist_content(String replist_content) {
		this.replist_content = replist_content;
	}
	@Override
	public String toString() {
		return "RepList [replist_num=" + replist_num + ", replist_content=" + replist_content + "]";
	}
	
}
