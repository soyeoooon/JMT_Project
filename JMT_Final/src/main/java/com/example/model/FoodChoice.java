package com.example.model;

public class FoodChoice {
   private int m_num;
   private String choice_food;
   private double choice_score;
   
   public FoodChoice(int m_num, String choice_food, double choice_score) {
      this.m_num = m_num;
      this.choice_food = choice_food;
      this.choice_score = choice_score;
   }


   @Override
   public String toString() {
      return "FoodChoice [m_num=" + m_num + ", choice_food=" + choice_food + ", choice_score=" + choice_score + "]";
   }


   public int getM_num() {
      return m_num;
   }


   public void setM_num(int m_num) {
      this.m_num = m_num;
   }


   public String getChoice_food() {
      return choice_food;
   }


   public void setChoice_food(String choice_food) {
      this.choice_food = choice_food;
   }


   public double getChoice_score() {
      return choice_score;
   }


   public void setChoice_score(double choice_score) {
      this.choice_score = choice_score;
   }


   public FoodChoice() {
      // TODO Auto-generated constructor stub
   }
}