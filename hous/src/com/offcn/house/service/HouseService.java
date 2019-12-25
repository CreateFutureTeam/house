package com.offcn.house.service;

import java.util.List;

import com.offcn.house.pojo.House;

public interface HouseService {
	/**
	 * 增加房屋
	 * @param house
	 * @return
	 */
	public int addHouse(House house);
	/**
	 * 查询所有
	 * @return
	 */
	public List<House> findAll();
	
	/**
	 * 根据id查询房屋
	 * @param id
	 * @return
	 */
	public House findById(Integer id);
	
	/**
	  *修改
	 * @param house
	 * @return
	 */
	public int update(House house);
	
	public int delete(Integer id);
	
	public House findByIds(Integer id);
	
	public List<House> findByCondition(House house);
	
	/**
	 * 根据标题查询房子
	 * @param name
	 * @return
	 */
	public House findByName(String title);

}
