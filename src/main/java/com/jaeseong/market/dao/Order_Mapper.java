package com.jaeseong.market.dao;

import com.jaeseong.market.dto.Order_detailDTO;

public interface Order_Mapper {

	int insertOrder(int id);

	void insertOrder_detail(Order_detailDTO od);
	
}
