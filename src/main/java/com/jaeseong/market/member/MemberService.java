package com.jaeseong.market.member;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jaeseong.market.dao.MenuMapper;
import com.jaeseong.market.dao.Order_Mapper;
import com.jaeseong.market.dto.MenuDTO;
import com.jaeseong.market.dto.OrderForViewDTO;
import com.jaeseong.market.dto.Order_DTO;
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

	@Transactional(rollbackFor=SQLException.class)
	public void orderProceed(int id, String[] menu, String[] num) {
		Order_DTO o = new Order_DTO();
		o.setMem_id(id);
		o_mapper.insertOrder(o);
		
		int order_id = o.getId();
		
		for(int i=0;i<menu.length;i++) {
			Order_detailDTO od = new Order_detailDTO();
			od.setMenu_id(Integer.parseInt(menu[i]));
			od.setOrder_id(order_id);
			od.setQuantity(Integer.parseInt(num[i]));
			System.out.println(num[i]);
			
			o_mapper.insertOrder_detail(od);
			
			menu_mapper.plusTodaySoldById(Integer.parseInt(menu[i]), Integer.parseInt(num[i]));
		}
		
	}

	public void orderFinished() {
		o_mapper.orderFinished();
		
	}

	public List<OrderForViewDTO> getOrderByFinished() {
		return o_mapper.getOrderByFinished();
	}

	public List<OrderForViewDTO> getMyOrderById(int id) {
		return o_mapper.getMyOrderById(id);
	}

	@Transactional(rollbackFor=SQLException.class)
	public void delOrderById(int id) {
		//order_id를 가져온다.
		System.out.println("okay?");
		int order_id = o_mapper.getOrderId(id);
		//detail을 삭제한다.
		o_mapper.deleteOrderDetailById(id);
		//detail에 같은 order가 있는지 확인한다.
		//없다면 order_id도 삭제한다.
		if(o_mapper.countOrderDetailByOrderId(order_id)==0) {
			o_mapper.deleteOrder(order_id);
		}
		
	}

}
