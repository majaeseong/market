package com.jaeseong.market.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jaeseong.market.dao.MemberMapper;
import com.jaeseong.market.dao.MenuMapper;
import com.jaeseong.market.dto.MemberDTO;
import com.jaeseong.market.dto.MenuDTO;

@Service
public class AdminService {

	@Autowired
	MemberMapper mem_mapper;
	@Autowired
	MenuMapper menu_mapper;
	
	
	List<MemberDTO> getAllMemberByAuth(int auth){
		return mem_mapper.getAllMemberByAuth(auth);
	}
	
	List<MenuDTO> getAllMenu(){
		return menu_mapper.getAllMenu();
	}
}
