package com.offcn.house.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.offcn.house.pojo.Street;

public interface StreetMapper {
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
	public List<Street> findAllStreetById(@Param("id")Integer id,@Param("strId")Integer strId);
}