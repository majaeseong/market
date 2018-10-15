package com.jaeseong.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jaeseong.market.dao.MenuMapper;
import com.jaeseong.market.dto.MenuDTO;

@Service
public class marketService {
	
	@Autowired
	MenuMapper mMapper;

	public List<MenuDTO> getAllMenuByKind(int kind) {
		
		return mMapper.getAllMenuByKind(kind);
	}

}
