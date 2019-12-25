package com.offcn.house.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offcn.house.pojo.Type;
import com.offcn.house.service.TypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
	@Resource
	private TypeService typeService;
	@RequestMapping("/all")
	@ResponseBody
	public List<Type> findAll(){
		//类型
		List<Type> typeList = typeService.findAllType();
		return typeList;
	}
}
