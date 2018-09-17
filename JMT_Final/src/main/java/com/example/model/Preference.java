package com.example.model;

public class Preference {
   private int m_num;
   private int prefer_price;
   private int prefer_mood;
   private int prefer_distance;
   private int prefer_service;
   private int prefer_health;
   public int getM_num() {
      return m_num;
   }
   public void setM_num(int m_num) {
      this.m_num = m_num;
   }
   public int getPrefer_price() {
      return prefer_price;
   }
   public void setPrefer_price(int prefer_price) {
      this.prefer_price = prefer_price;
   }
   public int getPrefer_mood() {
      return prefer_mood;
   }
   public void setPrefer_mood(int prefer_mood) {
      this.prefer_mood = prefer_mood;
   }
   public int getPrefer_distance() {
      return prefer_distance;
   }
   public void setPrefer_distance(int prefer_distance) {
      this.prefer_distance = prefer_distance;
   }
   public int getPrefer_service() {
      return prefer_service;
   }
   public void setPrefer_service(int prefer_service) {
      this.prefer_service = prefer_service;
   }
   public int getPrefer_health() {
      return prefer_health;
   }
   public void setPrefer_health(int prefer_health) {
      this.prefer_health = prefer_health;
   }
   @Override
   public String toString() {
      return "Preference [m_num=" + m_num + ", prefer_price=" + prefer_price + ", prefer_mood=" + prefer_mood
            + ", prefer_distance=" + prefer_distance + ", prefer_service=" + prefer_service + ", prefer_health="
            + prefer_health + "]";
   }
   public Preference(int m_num, int prefer_price, int prefer_mood, int prefer_distance, int prefer_service,
         int prefer_health) {
      this.m_num = m_num;
      this.prefer_price = prefer_price;
      this.prefer_mood = prefer_mood;
      this.prefer_distance = prefer_distance;
      this.prefer_service = prefer_service;
      this.prefer_health = prefer_health;
   }
   
   public Preference() {
      // TODO Auto-generated constructor stub
   }
}