package com.example.model;

public class PhotoDeco {
	private int p_lat;
	private int p_lon;
	private String p_imgname;
	private String p_foodname;
	private String p_price;
	private String p_emo;
	private String p_comment;
	public int getP_lat() {
		return p_lat;
	}
	public void setP_lat(int p_lat) {
		this.p_lat = p_lat;
	}
	public int getP_lon() {
		return p_lon;
	}
	public void setP_lon(int p_lon) {
		this.p_lon = p_lon;
	}
	public String getP_imgname() {
		return p_imgname;
	}
	public void setP_imgname(String p_imgname) {
		this.p_imgname = p_imgname;
	}
	public String getP_foodname() {
		return p_foodname;
	}
	public void setP_foodname(String p_foodname) {
		this.p_foodname = p_foodname;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_emo() {
		return p_emo;
	}
	public void setP_emo(String p_emo) {
		this.p_emo = p_emo;
	}
	public String getP_comment() {
		return p_comment;
	}
	public void setP_comment(String p_comment) {
		this.p_comment = p_comment;
	}
	@Override
	public String toString() {
		return "PhotoDeco [p_lat=" + p_lat + ", p_lon=" + p_lon + ", p_imgname=" + p_imgname + ", p_foodname="
				+ p_foodname + ", p_price=" + p_price + ", p_emo=" + p_emo + ", p_comment=" + p_comment + "]";
	}
	
}
