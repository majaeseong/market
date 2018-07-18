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
	
	MemberDTO getMemberByUserId(String userid) {
		return mem_mapper.getMemberByUserId(userid);
	}

	public void insertMember(MemberDTO mdto) {
		mem_mapper.insertMember(mdto);
		
	}

	public void del_member(int id) {
		mem_mapper.del_member(id);
		
	}

	public void del_menu(int id) {
		menu_mapper.del_menu(id);
		
	}
}
