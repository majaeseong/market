package com.jaeseong.market.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jaeseong.market.dao.MenuMapper;
import com.jaeseong.market.dao.OrderMapper;
import com.jaeseong.market.dto.MenuDTO;
import com.jaeseong.market.dto.Order_DTO;
import com.jaeseong.market.dto.Order_detailDTO;

@Service
public class marketService {
	
	@Autowired
	MenuMapper mMapper;
	
	@Autowired
	OrderMapper oMapper;
	
	public List<MenuDTO> getAllMenuByKind(int kind) {
		
		return mMapper.getAllMenuByKind(kind);
	}

	@Transactional(rollbackFor=SQLException.class)
	public int add_order(String[] menu_num) {
		//add order
		Order_DTO od = new Order_DTO();
		oMapper.addOrder(od);
		int id = od.getId();
		
		//add order_detail
		for(int i=0;i<menu_num.length;i++) {
			if(!menu_num[i].equals("0")) {
				
				Order_detailDTO odto = new Order_detailDTO();
				odto.setMenu_id(i+1);
				odto.setOrder_id(id);
				odto.setQuantity(Integer.parseInt(menu_num[i]));
				
				oMapper.addOrder_detail(odto);
			}
		}
		
		return id;
		
	}

}
