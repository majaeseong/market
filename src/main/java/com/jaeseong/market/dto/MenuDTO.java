package com.jaeseong.market.dto;

public class MenuDTO {
	private int id, price, todaysold;
	private String name;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
}
