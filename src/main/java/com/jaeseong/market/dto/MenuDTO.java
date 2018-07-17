package com.jaeseong.market.dto;

public class MenuDTO {
	private int id, price, todaysold;
	private String mname;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTodaysold() {
		return todaysold;
	}
	public void setTodaysold(int todaysold) {
		this.todaysold = todaysold;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}

	
}
