package com.jaeseong.market.member;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		MemberDTO mem = (MemberDTO)session.getAttribute("loginUser");
		
		model.addAttribute("loginUser",mem);
		model.addAttribute("menu", service.getAllMenu());
		return "/member/home";
	}
	
	
	
	@RequestMapping(value = "/home", method=RequestMethod.POST)
	public String orderCheck(HttpServletRequest request, HttpSession session) {
		
		String[] menu = request.getParameterValues("menu[]");
		String[] num = request.getParameterValues("num[]");
		String[] real_num = new String[menu.length];
		
		int real_num_index = 0;
		for(int i=0;i<num.length;i++) {
			if(!num[i].equals("0")) {
				real_num[real_num_index++]=num[i];
			}
				
		}
		
		for(int i=0;i<real_num.length;i++) {
			System.out.println("hi+ "+real_num[i]);
		}
		
		MemberDTO mem = (MemberDTO)session.getAttribute("loginUser");
		
		service.orderProceed(mem.getId(),menu,real_num);
		
		return "redirect:/member/home";
	}
	
	@RequestMapping(value = "/order")
	public String order() {
		return "/member/order";
	}
	
	@RequestMapping(value = "/delOrderById")
	public String delOrderById(@RequestParam int id) {
		service.delOrderById(id);
		
		return "redirect:/member/home";
	}
	
	@RequestMapping(value = "/getOrderByFinished")
	@ResponseBody public List<OrderForViewDTO> getOrderByFinished() {
		return service.getOrderByFinished();
	}
	
	
	@RequestMapping(value = "/orderFinished")
	@ResponseBody public void orderFinished() {
		service.orderFinished();
	}
	
	@RequestMapping(value = "/getMyOrder", produces="application/json")
	@ResponseBody public List<OrderForViewDTO> getMyOrder(HttpSession session) {
		MemberDTO mem = (MemberDTO)session.getAttribute("loginUser");
		return service.getMyOrderById(mem.getId());
	}
	
}
