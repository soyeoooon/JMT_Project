package com.example.model;

import java.util.Date;

public class Report {
	private int rep_num;
	private int rm_num;
	private int m_mail1;
	private int m_mail2;
	private int replist_num;
	private int replist_status;
	private Date rep_date1;
	private Date rep_date2;

	public int getRep_num() {
		return rep_num;
	}

	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}

	public int getRm_num() {
		return rm_num;
	}

	public void setRm_num(int rm_num) {
		this.rm_num = rm_num;
	}

	public int getM_mail1() {
		return m_mail1;
	}

	public void setM_mail1(int m_mail1) {
		this.m_mail1 = m_mail1;
	}

	public int getM_mail2() {
		return m_mail2;
	}

	public void setM_mail2(int m_mail2) {
		this.m_mail2 = m_mail2;
	}

	public int getReplist_num() {
		return replist_num;
	}

	public void setReplist_num(int replist_num) {
		this.replist_num = replist_num;
	}

	public int getReplist_status() {
		return replist_status;
	}

	public void setReplist_status(int replist_status) {
		this.replist_status = replist_status;
	}

	public Date getRep_date1() {
		return rep_date1;
	}

	public void setRep_date1(Date rep_date1) {
		this.rep_date1 = rep_date1;
	}

	public Date getRep_date2() {
		return rep_date2;
	}

	public void setRep_date2(Date rep_date2) {
		this.rep_date2 = rep_date2;
	}

	@Override
	public String toString() {
		return "Report [rep_num=" + rep_num + ", rm_num=" + rm_num + ", m_mail1=" + m_mail1 + ", m_mail2=" + m_mail2
				+ ", replist_num=" + replist_num + ", replist_status=" + replist_status + ", rep_date1=" + rep_date1
				+ ", rep_date2=" + rep_date2 + "]";
	}
	public Report(int rep_num, int rm_num, int m_mail1, int m_mail2, int replist_num, int replist_status, Date rep_date1,
			Date rep_date2) {
		this.rep_num = rep_num;
		this.rm_num = rm_num;
		this.m_mail1 = m_mail1;
		this.m_mail2 = m_mail2;
		this.replist_num = replist_num;
		this.replist_status = replist_status;
		this.rep_date1 = rep_date1;
		this.rep_date2 = rep_date2;
	}
	public Report() {
		// TODO Auto-generated constructor stub
	}

}
