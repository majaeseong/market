package com.jaeseong.market.dao;

import com.jaeseong.market.dto.Order_DTO;
import com.jaeseong.market.dto.Order_detailDTO;

public interface OrderMapper {

	void addOrder(Order_DTO od);
	
	void addOrder_detail(Order_detailDTO otdo);

}
