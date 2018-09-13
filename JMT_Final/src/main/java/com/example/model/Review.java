package com.example.model;

import java.util.Date;

public class Review {
	private int rev_num;
	private int r_num;
	private int m_num;
	private String rev_content;
	private double rev_grade;
	private Date rev_date;
	private String rev_path;
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
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
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public double getRev_grade() {
		return rev_grade;
	}
	public void setRev_grade(double rev_grade) {
		this.rev_grade = rev_grade;
	}
	public Date getRev_date() {
		return rev_date;
	}
	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}
	public String getRev_path() {
		return rev_path;
	}
	public void setRev_path(String rev_path) {
		this.rev_path = rev_path;
	}
	@Override
	public String toString() {
		return "Review [rev_num=" + rev_num + ", r_num=" + r_num + ", m_num=" + m_num + ", rev_content=" + rev_content
				+ ", rev_grade=" + rev_grade + ", rev_date=" + rev_date + ", rev_path=" + rev_path + "]";
	}
	
	//수정(v1)
		public Review(int rev_num, int r_num, int m_num, String rev_content, double rev_grade, Date rev_date,
				String rev_path) {
			this.rev_num = rev_num;
			this.r_num = r_num;
			this.m_num = m_num;
			this.rev_content = rev_content;
			this.rev_grade = rev_grade;
			this.rev_date = rev_date;
			this.rev_path = rev_path;
		}
		
		public Review() {
		}
	
}
