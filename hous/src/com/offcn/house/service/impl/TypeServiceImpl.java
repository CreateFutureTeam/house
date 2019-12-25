package com.offcn.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.offcn.house.mapper.TypeMapper;
import com.offcn.house.pojo.Type;
import com.offcn.house.service.TypeService;
@Service("/typeService")
public class TypeServiceImpl implements TypeService {
	@Resource
	private TypeMapper typeMapper;
	@Override
	public List<Type> findAllType() {
		
		return typeMapper.findAllType() ;
	}

}
