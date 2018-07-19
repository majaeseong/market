package com.jaeseong.market.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jaeseong.market.dto.MemberDTO;



@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	
	@RequestMapping(value = "/home")
	public String home(Model model, HttpSession session) {
		
		model.addAttribute("loginUser",(MemberDTO)session.getAttribute("loginUser"));
		return "/member/home";
	}
	
	@RequestMapping(value = "/order")
	public String order() {
		
		return "/member/order";
	}
	
}
