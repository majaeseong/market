package com.jaeseong.market.dao;

import java.util.List;

import com.jaeseong.market.dto.OrderForViewDTO;
import com.jaeseong.market.dto.Order_DTO;
import com.jaeseong.market.dto.Order_detailDTO;

public interface OrderMapper {

	void addOrder(Order_DTO od);
	
	void addOrder_detail(Order_detailDTO otdo);

	List<OrderForViewDTO> getOrderByKinds(int kinds);

	void finished(int id);

}
