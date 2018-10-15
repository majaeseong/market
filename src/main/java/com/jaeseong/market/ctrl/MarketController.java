package com.jaeseong.market.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jaeseong.market.service.marketService;


@Controller
public class MarketController {
	
	@Autowired
	marketService service;
	
	@RequestMapping(value = "/order")
	public String order(Model model) {
		
		model.addAttribute("menu0", service.getAllMenuByKind(0));
		model.addAttribute("menu1", service.getAllMenuByKind(1));
		return "order/order";
	}
	
	@RequestMapping(value = "/test")
	public String test(String[] menu_num) {
		
		System.out.println("saaasdsasasasa");
		for(int i=0;i<menu_num.length;i++) {
			System.out.println(menu_num[i]);
		}
		
		return "order/order";
	}
	
	
}
