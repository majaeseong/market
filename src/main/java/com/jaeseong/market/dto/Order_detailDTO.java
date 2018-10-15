package com.jaeseong.market.dto;

public class Order_detailDTO {

	private int id, order_id, menu_id, quantity, successed;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSuccessed() {
		return successed;
	}

	public void setSuccessed(int successed) {
		this.successed = successed;
	}

	
	
}
