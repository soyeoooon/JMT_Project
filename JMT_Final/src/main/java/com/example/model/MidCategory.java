package com.example.model;

public class MidCategory {
	private int mid_num;
	private int big_num;
	private String mid_name;
	public int getMid_num() {
		return mid_num;
	}
	public void setMid_num(int mid_num) {
		this.mid_num = mid_num;
	}
	public int getBig_num() {
		return big_num;
	}
	public void setBig_num(int big_num) {
		this.big_num = big_num;
	}
	public String getMid_name() {
		return mid_name;
	}
	public void setMid_name(String mid_name) {
		this.mid_name = mid_name;
	}
	@Override
	public String toString() {
		return "MidCategory [mid_num=" + mid_num + ", big_num=" + big_num + ", mid_name=" + mid_name + "]";
	}
	
}
