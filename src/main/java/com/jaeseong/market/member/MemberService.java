package com.jaeseong.market.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jaeseong.market.dao.MenuMapper;
import com.jaeseong.market.dao.Order_Mapper;
import com.jaeseong.market.dto.MenuDTO;
import com.jaeseong.market.dto.Order_detailDTO;

@Service
public class MemberService {

	@Autowired
	MenuMapper menu_mapper;
	
	@Autowired
	Order_Mapper o_mapper;
	
	public List<MenuDTO> getAllMenu() {
		return menu_mapper.getAllMenu();
	}

	@Transactional
	public void orderProceed(int id, String[] menu, String[] num) {
		
		int order_id = o_mapper.insertOrder(id);
		
		for(int i=0;i<menu.length;i++) {
			Order_detailDTO od = new Order_detailDTO();
			od.setMenu_id(Integer.parseInt(menu[i]));
			od.setOrder_id(order_id);
			od.setQuantity(Integer.parseInt(num[i]));
			
			o_mapper.insertOrder_detail(od);
			
			menu_mapper.plusTodaySoldById(Integer.parseInt(menu[i]));
		}
		
	}

}
