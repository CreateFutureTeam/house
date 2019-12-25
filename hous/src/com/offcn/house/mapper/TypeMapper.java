package com.offcn.house.mapper;

import java.util.List;

import com.offcn.house.pojo.Type;

public interface TypeMapper {
	/**
	 * 查询所有房屋类型
	 * @return
	 */
	public List<Type> findAllType();
	
}