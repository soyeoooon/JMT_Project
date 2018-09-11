package com.example.model;

import java.util.Date;

public class RestModify {
	public int rm_num;
	public String rm_name;
	public String rm_phone;
	public String rm_address;
	public double rm_lat;
	public double rm_lon;
	public String rm_category1;
	public String rm_category2;
	public String rm_price;
	public String rm_enjoy;
	public String rm_rundate;
	public String rm_runtime;
	public String rm_intro;
	public String rm_menu;
	public String rm_photo;
	public Date rm_date;
	public int r_num;
	public int m_num;
	public int getRm_num() {
		return rm_num;
	}
	public void setRm_num(int rm_num) {
		this.rm_num = rm_num;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getRm_phone() {
		return rm_phone;
	}
	public void setRm_phone(String rm_phone) {
		this.rm_phone = rm_phone;
	}
	public String getRm_address() {
		return rm_address;
	}
	public void setRm_address(String rm_address) {
		this.rm_address = rm_address;
	}
	public double getRm_lat() {
		return rm_lat;
	}
	public void setRm_lat(double rm_lat) {
		this.rm_lat = rm_lat;
	}
	public double getRm_lon() {
		return rm_lon;
	}
	public void setRm_lon(double rm_lon) {
		this.rm_lon = rm_lon;
	}
	public String getRm_category1() {
		return rm_category1;
	}
	public void setRm_category1(String rm_category1) {
		this.rm_category1 = rm_category1;
	}
	public String getRm_category2() {
		return rm_category2;
	}
	public void setRm_category2(String rm_category2) {
		this.rm_category2 = rm_category2;
	}
	public String getRm_price() {
		return rm_price;
	}
	public void setRm_price(String rm_price) {
		this.rm_price = rm_price;
	}
	public String getRm_enjoy() {
		return rm_enjoy;
	}
	public void setRm_enjoy(String rm_enjoy) {
		this.rm_enjoy = rm_enjoy;
	}
	public String getRm_rundate() {
		return rm_rundate;
	}
	public void setRm_rundate(String rm_rundate) {
		this.rm_rundate = rm_rundate;
	}
	public String getRm_runtime() {
		return rm_runtime;
	}
	public void setRm_runtime(String rm_runtime) {
		this.rm_runtime = rm_runtime;
	}
	public String getRm_intro() {
		return rm_intro;
	}
	public void setRm_intro(String rm_intro) {
		this.rm_intro = rm_intro;
	}
	public String getRm_menu() {
		return rm_menu;
	}
	public void setRm_menu(String rm_menu) {
		this.rm_menu = rm_menu;
	}
	public String getRm_photo() {
		return rm_photo;
	}
	public void setRm_photo(String rm_photo) {
		this.rm_photo = rm_photo;
	}
	public Date getRm_date() {
		return rm_date;
	}
	public void setRm_date(Date rm_date) {
		this.rm_date = rm_date;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	@Override
	public String toString() {
		return "RestModify [rm_num=" + rm_num + ", rm_name=" + rm_name + ", rm_phone=" + rm_phone + ", rm_address="
				+ rm_address + ", rm_lat=" + rm_lat + ", rm_lon=" + rm_lon + ", rm_category1=" + rm_category1
				+ ", rm_category2=" + rm_category2 + ", rm_price=" + rm_price + ", rm_enjoy=" + rm_enjoy
				+ ", rm_rundate=" + rm_rundate + ", rm_runtime=" + rm_runtime + ", rm_intro=" + rm_intro + ", rm_menu="
				+ rm_menu + ", rm_photo=" + rm_photo + ", rm_date=" + rm_date + ", r_num=" + r_num + ", m_num=" + m_num
				+ "]";
	}
	public RestModify(int rm_num, String rm_name, String rm_phone, String rm_address, double rm_lat, double rm_lon,
			String rm_category1, String rm_category2, String rm_price, String rm_enjoy, String rm_rundate,
			String rm_runtime, String rm_intro, String rm_menu, String rm_photo, Date rm_date, int r_num, int m_num) {
		this.rm_num = rm_num;
		this.rm_name = rm_name;
		this.rm_phone = rm_phone;
		this.rm_address = rm_address;
		this.rm_lat = rm_lat;
		this.rm_lon = rm_lon;
		this.rm_category1 = rm_category1;
		this.rm_category2 = rm_category2;
		this.rm_price = rm_price;
		this.rm_enjoy = rm_enjoy;
		this.rm_rundate = rm_rundate;
		this.rm_runtime = rm_runtime;
		this.rm_intro = rm_intro;
		this.rm_menu = rm_menu;
		this.rm_photo = rm_photo;
		this.rm_date = rm_date;
		this.r_num = r_num;
		this.m_num = m_num;
	}
	
	//소연 수정
	public RestModify(String rm_price, String rm_enjoy, String rm_rundate,
			String rm_runtime, String rm_intro, String rm_menu, int r_num) {
		this.rm_price = rm_price;
		this.rm_enjoy = rm_enjoy;
		this.rm_rundate = rm_rundate;
		this.rm_runtime = rm_runtime;
		this.rm_intro = rm_intro;
		this.rm_menu = rm_menu;
		this.r_num = r_num;
	
	}
	public RestModify() {}
}
