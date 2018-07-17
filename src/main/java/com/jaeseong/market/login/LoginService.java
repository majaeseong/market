package com.jaeseong.market.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jaeseong.market.dao.MemberMapper;
import com.jaeseong.market.dto.MemberDTO;

@Service
public class LoginService {
	
	@Autowired
	MemberMapper mapper;
	
	MemberDTO getMemberByUserId(String userid) {
		return mapper.getMemberByUserId(userid);
	}
	
	int loginConfirm(String userid, String password) {
		MemberDTO member = mapper.getMemberByUserId(userid);
		
		if(member==null) {
			return 0;
		}
		else if(member!=null && !password.equals(member.getPassword())) {
			return 0;
		}else {
			return 1;
		}
		
	}
}
