package com.offcn.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.offcn.house.mapper.StreetMapper;
import com.offcn.house.pojo.Street;
import com.offcn.house.service.StreetService;
@Service("/streetService")
public class StreetServiceImpl implements StreetService {
	@Resource
	private StreetMapper streetMapper;
	@Override
	public List<Street> findAllStreet() {
		
		return streetMapper.findAllStreet();
	}
	@Override
	public List<Street> findAllStreetById(Integer id,Integer strId) {
		
		return streetMapper.findAllStreetById(id,strId);
	}

}
