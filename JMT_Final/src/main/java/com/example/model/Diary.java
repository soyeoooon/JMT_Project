package com.example.model;

import java.util.Date;

public class Diary {
	private int diary_num;
	private int r_num;
	private int m_mail;
	private String diary_title;
	private String diary_content;
	private Date diary_date;
	private String diary_path;
	private String diary_weather;
	private String diary_friends;

	public Date getDiary_date() {
		return diary_date;
	}

	public void setDiary_date(Date diary_date) {
		this.diary_date = diary_date;
	}

	public int getDiary_num() {
		return diary_num;
	}

	public void setDiary_num(int diary_num) {
		this.diary_num = diary_num;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	
	public int getM_mail() {
		return m_mail;
	}

	public void setM_mail(int m_mail) {
		this.m_mail = m_mail;
	}

	public String getDiary_title() {
		return diary_title;
	}

	public void setDiary_title(String diary_title) {
		this.diary_title = diary_title;
	}

	public String getDiary_content() {
		return diary_content;
	}

	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}

	public String getDiary_path() {
		return diary_path;
	}

	public void setDiary_path(String diary_path) {
		this.diary_path = diary_path;
	}

	public String getDiary_weather() {
		return diary_weather;
	}

	public void setDiary_weather(String diary_weather) {
		this.diary_weather = diary_weather;
	}

	public String getDiary_friends() {
		return diary_friends;
	}

	public void setDiary_friends(String diary_friends) {
		this.diary_friends = diary_friends;
	}

	@Override
	public String toString() {
		return "Diary [diary_num=" + diary_num + ", r_num=" + r_num + ", m_mail=" + m_mail + ", diary_title="
				+ diary_title + ", diary_content=" + diary_content + ", diary_date=" + diary_date + ", diary_path="
				+ diary_path + ", diary_weather=" + diary_weather + ", diary_friends=" + diary_friends + "]";
	}

}
