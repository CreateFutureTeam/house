package com.offcn.house.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offcn.house.pojo.Street;
import com.offcn.house.service.StreetService;

@Controller
@RequestMapping("/street")
public class StreetController {
	@Resource
	private StreetService streetService;
	@RequestMapping("/all")
	@ResponseBody
	public List<Street> findAll(@RequestParam(defaultValue="0")Integer id,@RequestParam(defaultValue="0")Integer strId){
		//街道
		List<Street> list= streetService.findAllStreetById(id,strId);
		for (Street street : list) {
			System.out.println(street.getName());
		}
		return list;
	}
	
	@RequestMapping("/alls")
	@ResponseBody
	public List<Street> findAlls(){
		//街道
		List<Street> list= streetService.findAllStreet();
		for (Street street : list) {
			System.out.println(street.getName());
		}
		return list;
	}
}
