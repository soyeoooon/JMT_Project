package com.example.model;

public class FriendList {
	private int req_mail;
	private int resp_mail;
	private int f_status;

	public int getReq_mail() {
		return req_mail;
	}

	public void setReq_mail(int req_mail) {
		this.req_mail = req_mail;
	}

	public int getResp_mail() {
		return resp_mail;
	}

	public void setResp_mail(int resp_mail) {
		this.resp_mail = resp_mail;
	}

	public int getF_status() {
		return f_status;
	}

	public void setF_status(int f_status) {
		this.f_status = f_status;
	}

	@Override
	public String toString() {
		return "Friendlist [req_mail=" + req_mail + ", resp_mail=" + resp_mail + ", f_status=" + f_status + "]";
	}
	public FriendList(int req_mail, int resp_mail, int f_status) {
		this.req_mail = req_mail;
		this.resp_mail = resp_mail;
		this.f_status = f_status;
	}

}
