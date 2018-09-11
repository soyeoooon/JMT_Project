package com.example.model;

public class RepResult {
	private int represult_num;
	private String represult_content;
	public int getRepresult_num() {
		return represult_num;
	}
	public void setRepresult_num(int represult_num) {
		this.represult_num = represult_num;
	}
	public String getRepresult_content() {
		return represult_content;
	}
	public void setRepresult_content(String represult_content) {
		this.represult_content = represult_content;
	}
	@Override
	public String toString() {
		return "RepResult [represult_num=" + represult_num + ", represult_content=" + represult_content + "]";
	}
	
}
