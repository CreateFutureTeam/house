package com.offcn.house.mapper;

import java.util.List;

import com.offcn.house.pojo.District;

public interface DistrictMapper {
	/**
	 * 查询所有区域
	 * @return
	 */
	public List<District> findDistrict();
}