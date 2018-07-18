package com.jaeseong.market.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/member_add", method=RequestMethod.GET)
	public String member_add() {
		
		return "admin/member_add";
	}
	
	@RequestMapping(value="/id_check", produces="application/json")
	@ResponseBody public int id_check(@RequestParam String userid) {
		int result=0;
		MemberDTO mem = service.getMemberByUserId(userid);
		if(mem==null) result=1;
		return result;
	}
	
	@RequestMapping(value="/member_add", method=RequestMethod.POST)
	public String member_add(MemberDTO mdto) {
		
		service.insertMember(mdto);
		
		return "redirect:home?menu_num=0";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String member_add(@RequestParam int menu_num, @RequestParam int id) {
		
		if(menu_num==0) {
			service.del_member(id);
			return "redirect:home";
		}else {
			service.del_menu(id);
			return "redirect:home?menu_num=1";
		}
	}
	
}
