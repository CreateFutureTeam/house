package com.offcn.house.service;

import java.util.List;

import com.offcn.house.pojo.Type;

public interface TypeService {
	/**
	 * 查询所有房屋类型
	 * @return
	 */
	public List<Type> findAllType();
}
