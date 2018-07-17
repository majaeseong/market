package com.jaeseong.market.dao;


import com.jaeseong.market.dto.MemberDTO;

public interface MemberMapper {
	MemberDTO getMemberByUserId(String userid);
}
