package com.example.model;

public class Restaurant {
	private int r_num;
	private String r_name;
	private String r_phone;
	private String r_address;
	private double r_lat;
	private double r_lon;
	private String r_category1;
	private String r_category2;
	private String r_price;
	private String r_enjoy;
	private String r_rundate;
	private String r_runtime;
	private String r_intro;
	private String r_menu;
	private String r_photo;
	// 수정(v2)
	private int r_count;

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_phone() {
		return r_phone;
	}

	public void setR_phone(String r_phone) {
		this.r_phone = r_phone;
	}

	public String getR_address() {
		return r_address;
	}

	public void setR_address(String r_address) {
		this.r_address = r_address;
	}

	public double getR_lat() {
		return r_lat;
	}

	public void setR_lat(double r_lat) {
		this.r_lat = r_lat;
	}

	public double getR_lon() {
		return r_lon;
	}

	public void setR_lon(double r_lon) {
		this.r_lon = r_lon;
	}

	public String getR_category1() {
		return r_category1;
	}

	public void setR_category1(String r_category1) {
		this.r_category1 = r_category1;
	}

	public String getR_category2() {
		return r_category2;
	}

	public void setR_category2(String r_category2) {
		this.r_category2 = r_category2;
	}

	public String getR_price() {
		return r_price;
	}

	public void setR_price(String r_price) {
		this.r_price = r_price;
	}

	public String getR_enjoy() {
		return r_enjoy;
	}

	public void setR_enjoy(String r_enjoy) {
		this.r_enjoy = r_enjoy;
	}

	public String getR_rundate() {
		return r_rundate;
	}

	public void setR_rundate(String r_rundate) {
		this.r_rundate = r_rundate;
	}

	public String getR_runtime() {
		return r_runtime;
	}

	public void setR_runtime(String r_runtime) {
		this.r_runtime = r_runtime;
	}

	public String getR_intro() {
		return r_intro;
	}

	public void setR_intro(String r_intro) {
		this.r_intro = r_intro;
	}

	public String getR_menu() {
		return r_menu;
	}

	public void setR_menu(String r_menu) {
		this.r_menu = r_menu;
	}

	public String getR_photo() {
		return r_photo;
	}

	public void setR_photo(String r_photo) {
		this.r_photo = r_photo;
	}

	@Override
	public String toString() {
		return "Restaurant [r_num=" + r_num + ", r_name=" + r_name + ", r_phone=" + r_phone + ", r_address=" + r_address
				+ ", r_lat=" + r_lat + ", r_lon=" + r_lon + ", r_category1=" + r_category1 + ", r_category2="
				+ r_category2 + ", r_price=" + r_price + ", r_enjoy=" + r_enjoy + ", r_rundate=" + r_rundate
				+ ", r_runtime=" + r_runtime + ", r_intro=" + r_intro + ", r_menu=" + r_menu + ", r_photo=" + r_photo
				+ "]";
	}

}
