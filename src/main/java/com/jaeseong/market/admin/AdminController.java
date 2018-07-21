package com.jaeseong.market.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jaeseong.market.dto.MemberDTO;
import com.jaeseong.market.dto.MenuDTO;



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
	
	///////////////////////--Member menu--////////////////////////
	
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

	
	///////////////////////--Menu menu--////////////////////////
	
	@RequestMapping(value="/edit_menu", method=RequestMethod.GET)
	public String edit_menu(@RequestParam int id, Model model) {
		
		if(id!=0) {
			model.addAttribute("menu", service.getMenuById(id));
		}
		else {
			model.addAttribute("id", id);
		}
		return "admin/menu_edit";
	}
	
	@RequestMapping(value="/edit_menu", method=RequestMethod.POST)
	public String edit_menu(MenuDTO mdto) {
		
		if(mdto.getId()==0) {
			service.addMenu(mdto);
		}
		else {
			service.editMenu(mdto);
		}
		return "redirect:home?menu_num=1";
	}
	
	
	
	///////////////////////--Common menu--////////////////////////
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
	
	///////////////////////--Excel Down--////////////////////////
	@RequestMapping(value = "/excelConvert")
	public String excelConvert(Model model) {
		List<MenuDTO> m_list = service.getAllMenu();
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		for(int i=0;i<m_list.size();i++) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("name", m_list.get(i).getMname());
			map.put("price", m_list.get(i).getPrice()+"");
			map.put("todaysold", m_list.get(i).getTodaysold()+"");
			map.put("money", (m_list.get(i).getPrice()*m_list.get(i).getTodaysold())+"");
		
			list.add(0, map);
		}
		
		service.setZeroTodaySold();
		
		model.addAttribute("list", list);

		return "admin/excel";
	}
}
