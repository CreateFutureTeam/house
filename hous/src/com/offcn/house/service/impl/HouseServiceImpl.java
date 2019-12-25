package com.offcn.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.offcn.house.mapper.HouseMapper;
import com.offcn.house.pojo.House;
import com.offcn.house.service.HouseService;
@Service("/hourService")
public class HouseServiceImpl implements HouseService{
	@Resource
	private HouseMapper houseMapper;
	@Override
	public int addHouse(House house) {
		
		return houseMapper.addHouse(house);
	}
	@Override
	public List<House> findAll() {
		
		return houseMapper.findAll();
	}
	@Override
	public House findById(Integer id) {
		
		return houseMapper.findById(id);
	}
	@Override
	public int update(House house) {
		
		return houseMapper.update(house);
	}
	@Override
	public int delete(Integer id) {
		
		return houseMapper.delete(id);
	}
	@Override
	public House findByIds(Integer id) {
		
		return houseMapper.findByIds(id);
	}
	@Override
	public List<House> findByCondition(House house) {
		
		return houseMapper.findByCondition(house);
	}
	@Override
	public House findByName(String title) {
		
		return houseMapper.findByName(title);
	}

}
