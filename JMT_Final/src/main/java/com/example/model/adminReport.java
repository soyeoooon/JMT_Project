package com.example.model;

import java.util.Date;

public class adminReport {
	private int rep_num;
	private String r_name;
	private String rm_num;
	private String req;
	private	String resp;
	private String replist_content;
	private String represult_content;
	private Date rep_date1;
	private Date rep_date2;
	public int getRep_num() {
		return rep_num;
	}
	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}
	
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getRm_num() {
		return rm_num;
	}
	public void setRm_num(String rm_num) {
		this.rm_num = rm_num;
	}
	public String getReq() {
		return req;
	}
	public void setReq(String req) {
		this.req = req;
	}
	public String getResp() {
		return resp;
	}
	public void setResp(String resp) {
		this.resp = resp;
	}
	public String getReplist_content() {
		return replist_content;
	}
	public void setReplist_content(String replist_content) {
		this.replist_content = replist_content;
	}
	public String getRepresult_content() {
		return represult_content;
	}
	public void setRepresult_content(String represult_content) {
		this.represult_content = represult_content;
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
		return "adminReport [rep_num=" + rep_num + ", r_name=" + r_name + ", rm_num=" + rm_num + ", req=" + req
				+ ", resp=" + resp + ", replist_content=" + replist_content + ", represult_content=" + represult_content
				+ ", rep_date1=" + rep_date1 + ", rep_date2=" + rep_date2 + "]";
	}
	
	
	
	
	

	

}
