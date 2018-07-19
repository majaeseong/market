package com.jaeseong.market.dao;

import java.util.List;

import com.jaeseong.market.dto.MenuDTO;

public interface MenuMapper {

	List<MenuDTO> getAllMenu();

	void del_menu(int id);

	MenuDTO getMenuById(int id);

	void addMenu(MenuDTO mdto);

	void editMenu(MenuDTO mdto);
}
