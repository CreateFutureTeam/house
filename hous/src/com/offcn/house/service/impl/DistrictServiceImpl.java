package com.offcn.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.offcn.house.mapper.DistrictMapper;
import com.offcn.house.pojo.District;
import com.offcn.house.service.DistrictService;
@Service("/districtService")
public class DistrictServiceImpl implements DistrictService {
	@Resource
	private DistrictMapper districtMapper;
	@Override
	public List<District> findDistrict() {
		
		return districtMapper.findDistrict();
	}

}
