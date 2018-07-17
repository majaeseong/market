package com.jaeseong.market.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jaeseong.market.dto.MemberDTO;



@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping(value = "/home")
	public String home(@RequestParam(defaultValue="0") int menu_num, Model model,HttpSession session) {
		
		if(menu_num==0) {
			model.addAttribute("admin_list", service.getAllMemberByAuth(0));
		}else {
			model.addAttribute("admin_list", service.getAllMenu());
		}
		model.addAttribute("loginUser",(MemberDTO)session.getAttribute("loginUser"));
		model.addAttribute("menu_num", menu_num);
		return "admin/home";
	}
	
	
}
