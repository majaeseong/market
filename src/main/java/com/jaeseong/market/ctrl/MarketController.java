package com.jaeseong.market.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jaeseong.market.dto.OrderForViewDTO;
import com.jaeseong.market.service.marketService;


@Controller
public class MarketController {
	
	@Autowired
	marketService service;
	
	@RequestMapping(value = "/order")
	public String order(Model model, @RequestParam(required=false ,defaultValue="0") int order_id) {
		
		model.addAttribute("menu0", service.getAllMenuByKind(0));
		model.addAttribute("menu1", service.getAllMenuByKind(1));

		model.addAttribute("order_id", order_id);
		return "order/order";
	}
	
	@RequestMapping(value = "/add_order")
	public String add_order(String[] menu_num, Model model) {
		
		int result = service.add_order(menu_num);
		
		model.addAttribute("order_id", result);
		
		return "redirect:order";
	}
	
	@RequestMapping(value = "/gui")
	public String gui() {
		
		return "list_page/gui";
	}
	
	@RequestMapping(value = "/kitchen")
	public String kitchen() {
		
		return "list_page/kitchen";
	}
	
	
	@RequestMapping(value = "/getOrderByKinds")
	@ResponseBody public List<OrderForViewDTO> getOrderByFinished(@RequestParam int kinds) {
		return service.getOrderByKinds(kinds);
	}
	
	@RequestMapping(value = "/finished")
	public String finished(@RequestParam int id, @RequestParam int kinds) {
		
		service.finished(id);
		
		if(kinds==0) {
			return "redirect:gui";
		}else {
			return "redirect:kitchen";
		}
		
		
	}
	
	
}
