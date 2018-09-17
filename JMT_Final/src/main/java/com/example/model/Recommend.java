package com.example.model;

public class Recommend {
	   private int user_x_num;
	   private int rank_num;
	   private int r_num_final;
	   private double r_score_final;
	   public int getUser_x_num() {
	      return user_x_num;
	   }
	   public void setUser_x_num(int user_x_num) {
	      this.user_x_num = user_x_num;
	   }
	   public int getRank_num() {
	      return rank_num;
	   }
	   public void setRank_num(int rank_num) {
	      this.rank_num = rank_num;
	   }
	   public int getR_num_final() {
	      return r_num_final;
	   }
	   public void setR_num_final(int r_num_final) {
	      this.r_num_final = r_num_final;
	   }
	   public double getR_score_final() {
	      return r_score_final;
	   }
	   public void setR_score_final(double r_score_final) {
	      this.r_score_final = r_score_final;
	   }
	   @Override
	   public String toString() {
	      return "Recommend [user_x_num=" + user_x_num + ", rank_num=" + rank_num + ", r_num_final=" + r_num_final
	            + ", r_score_final=" + r_score_final + "]";
	   }
	   
	   
	}
