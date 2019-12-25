package com.offcn.house.service;

import java.util.List;

import com.offcn.house.pojo.Street;

public interface StreetService {
	/**
	 * 查询所有街道
	 * @return
	 */
	public List<Street> findAllStreet();
	
	/**
	 * 根据区域id查询
	 * @param id
	 * @return
	 */
	public List<Street> findAllStreetById(Integer id,Integer strId);
}
