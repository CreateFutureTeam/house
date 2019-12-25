package com.offcn.house.mapper;

import java.util.List;

import com.offcn.house.pojo.House;

public interface HouseMapper {
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
	 * 根据id查询房屋
	 * @param id
	 * @return
	 */
	public House findByIds(Integer id);
	/**
	  *修改
	 * @param house
	 * @return
	 */
	public int update(House house);
	/**
	 * 	删除
	 * @param id
	 * @return
	 */
	public int delete(Integer id);

	/**
	 *  模糊查询
	 * @param house
	 * @return
	 */
	public List<House> findByCondition(House house);
	/**
	 * 根据标题查询房子
	 * @param name
	 * @return
	 */
	public House findByName(String title);
	
}