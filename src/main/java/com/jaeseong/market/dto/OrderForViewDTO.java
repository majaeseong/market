package com.jaeseong.market.dto;

import java.sql.Timestamp;

public class OrderForViewDTO {
	private String mname, menu;
	private int id, quantity;
	private Timestamp t;
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getT() {
		return t;
	}
	public void setT(Timestamp t) {
		this.t = t;
	}
	
}
