package com.offcn.house.service;

import java.util.List;

import com.offcn.house.pojo.District;

public interface DistrictService {

	/**
	 * 查询所有区域
	 * @return
	 */
	public List<District> findDistrict();
}
