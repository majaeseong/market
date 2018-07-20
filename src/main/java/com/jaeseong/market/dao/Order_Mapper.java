package com.jaeseong.market.dao;

import java.util.List;

import com.jaeseong.market.dto.OrderForViewDTO;
import com.jaeseong.market.dto.Order_DTO;
import com.jaeseong.market.dto.Order_detailDTO;

public interface Order_Mapper {

	int insertOrder(Order_DTO od);

	void insertOrder_detail(Order_detailDTO od);

	void orderFinished();

	List<OrderForViewDTO> getOrderByFinished();

	List<OrderForViewDTO> getMyOrderById(int id);

	int getOrderId(int id);

	void deleteOrderDetailById(int id);

	int countOrderDetailByOrderId(int order_id);

	void deleteOrder(int order_id);
}
