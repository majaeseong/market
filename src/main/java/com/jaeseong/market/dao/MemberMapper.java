package com.jaeseong.market.dao;


import java.util.List;

import com.jaeseong.market.dto.MemberDTO;

public interface MemberMapper {
	MemberDTO getMemberByUserId(String userid);
	List<MemberDTO> getAllMemberByAuth(int auth);
	void insertMember(MemberDTO mdto);
	void del_member(int id);
	void editMember(MemberDTO mdto);
}
