package com.offcn.house.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offcn.house.pojo.District;
import com.offcn.house.service.DistrictService;

@Controller
@RequestMapping("/district")
public class DistrictController {
	@Resource 
	private DistrictService districtService;
	@RequestMapping("/all")
	@ResponseBody
	public List<District> findAll() {
		List<District> list = districtService.findDistrict();
		return list;
	}
}
