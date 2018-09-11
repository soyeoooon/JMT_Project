package com.example.model;

public class BigCategory {
	private int big_num;
	private String big_name;
	public int getBig_num() {
		return big_num;
	}
	public void setBig_num(int big_num) {
		this.big_num = big_num;
	}
	public String getBig_name() {
		return big_name;
	}
	public void setBig_name(String big_name) {
		this.big_name = big_name;
	}
	@Override
	public String toString() {
		return "BigCategory [big_num=" + big_num + ", big_name=" + big_name + "]";
	}
	
}
