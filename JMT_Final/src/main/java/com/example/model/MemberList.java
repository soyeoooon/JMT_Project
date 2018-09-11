package com.example.model;

public class MemberList {
	private int m_num;
	private int email_num;
	private String m_nick;
	private String m_pwd;
	private String m_photo;
	private String m_intro;
	private String m_level;
	private String m_naver;
	private String m_kakao;
	private String m_facebook;
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}
	public String getM_level() {
		return m_level;
	}
	public void setM_level(String m_level) {
		this.m_level = m_level;
	}
	public String getM_naver() {
		return m_naver;
	}
	public void setM_naver(String m_naver) {
		this.m_naver = m_naver;
	}
	public String getM_kakao() {
		return m_kakao;
	}
	public void setM_kakao(String m_kakao) {
		this.m_kakao = m_kakao;
	}
	public String getM_facebook() {
		return m_facebook;
	}
	public void setM_facebook(String m_facebook) {
		this.m_facebook = m_facebook;
	}
	public int getEmail_num() {
		return email_num;
	}
	public void setEmail_num(int email_num) {
		this.email_num = email_num;
	}
	@Override
	public String toString() {
		return "MemberList [m_num=" + m_num + ", email_num=" + email_num + ", m_nick=" + m_nick + ", m_pwd=" + m_pwd
				+ ", m_photo=" + m_photo + ", m_intro=" + m_intro + ", m_level=" + m_level + ", m_naver=" + m_naver
				+ ", m_kakao=" + m_kakao + ", m_facebook=" + m_facebook + "]";
	}
	
}
