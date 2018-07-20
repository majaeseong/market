package com.jaeseong.market.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jaeseong.market.dto.MemberDTO;
import com.jaeseong.market.dto.OrderForViewDTO;



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
	
	@RequestMapping(value = "/orderCheck")
	public String orderCheck(HttpServletRequest request, HttpSession session) {
		
		String[] menu = request.getParameterValues("checkMenu[]");
		String[] num = request.getParameterValues("quantity[]");
		
		
		MemberDTO mem = (MemberDTO)session.getAttribute("loginUser");
		
		service.orderProceed(mem.getId(),menu,num);
		
		return "redirect:/member/home";
	}
	
	
	
	@RequestMapping(value = "/order")
	public String order() {
		return "/member/order";
	}
	
	@RequestMapping(value = "/getOrderByFinished")
	@ResponseBody public List<OrderForViewDTO> getOrderByFinished() {
		return service.getOrderByFinished();
	}
	
	
	@RequestMapping(value = "/orderFinished")
	@ResponseBody public void orderFinished() {
		service.orderFinished();
	}
	
}
