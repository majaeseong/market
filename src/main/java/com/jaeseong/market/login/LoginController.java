package com.jaeseong.market.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jaeseong.market.dto.MemberDTO;


@Controller
public class LoginController {
	
	@Autowired
	LoginService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		if(session.getAttribute("loginUser")!=null) {
			MemberDTO mem = (MemberDTO) session.getAttribute("loginUser");
			MemberDTO member = service.getMemberByUserId(mem.getUserid());
			if(member.getAuth()==0) {
				return "redirect:member/home";
			}
			else {
				return "redirect:admin/home";
			}
		}
		return "login/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDTO mdto, Model model,HttpSession session) {
		
		int result = service.loginConfirm(mdto.getUserid(), mdto.getPassword());
		
		if(result==0) {
			model.addAttribute("msg", "id or password not match");
			return "login/login";
		}else {
			MemberDTO member = service.getMemberByUserId(mdto.getUserid());
			session.setAttribute("loginUser",member);
			if(member.getAuth()==0) {
				return "redirect:member/home";
			}
			else {
				return "redirect:admin/home";
			}
		}
	}
	
	
}
