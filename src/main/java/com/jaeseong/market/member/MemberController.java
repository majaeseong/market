package com.jaeseong.market.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jaeseong.market.dto.MemberDTO;



@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/home", method=RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		model.addAttribute("loginUser",(MemberDTO)session.getAttribute("loginUser"));
		model.addAttribute("menu", service.getAllMenu());
		return "/member/home";
	}
	
	@RequestMapping(value = "/home", method=RequestMethod.POST)
	public String home(HttpServletRequest request, HttpSession session) {
		
		String[] menu = request.getParameterValues("menu[]");
		String[] num = request.getParameterValues("num[]");
		
		MemberDTO mem = (MemberDTO)session.getAttribute("loginUser");
		
		service.orderProceed(mem.getId(),menu,num);
		
		return "redirect:/member/home";
	}
	
	
	
	@RequestMapping(value = "/order")
	public String order() {
		// order_list of finished 0
		return "/member/order";
	}
	
}
