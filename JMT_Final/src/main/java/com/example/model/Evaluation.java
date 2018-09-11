package com.example.model;

public class Evaluation {
	private int r_num;
	private int m_num;
	private double e_grade;
	private boolean e_like;
	private boolean e_mark;
	public Evaluation() {
	}
	public Evaluation(int r_num, int m_num, double e_grade, boolean e_like, boolean e_mark) {
		this.r_num = r_num;
		this.m_num = m_num;
		this.e_grade = e_grade;
		this.e_like = e_like;
		this.e_mark = e_mark;
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
	public double getE_grade() {
		return e_grade;
	}
	public void setE_grade(double e_grade) {
		this.e_grade = e_grade;
	}
	public boolean getE_like() {
		return e_like;
	}
	public void setE_like(boolean e_like) {
		this.e_like = e_like;
	}
	public boolean getE_mark() {
		return e_mark;
	}
	public void setE_mark(boolean e_mark) {
		this.e_mark = e_mark;
	}
	@Override
	public String toString() {
		return "Evaluation [r_num=" + r_num + ", m_num=" + m_num + ", e_grade=" + e_grade + ", e_like=" + e_like
				+ ", e_mark=" + e_mark + "]";
	}
	
}
