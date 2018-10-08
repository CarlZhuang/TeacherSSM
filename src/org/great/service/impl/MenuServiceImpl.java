package org.great.service.impl;

import java.util.List;

import org.great.bean.MenuBean;
import org.great.mapper.MenuMapper;
import org.great.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuMapper menuMapper;
	public List<MenuBean> findAllMenus() {
		return menuMapper.findAllMenus();
	}
}
