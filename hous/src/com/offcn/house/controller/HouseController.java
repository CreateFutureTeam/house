package com.offcn.house.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.house.pojo.House;
import com.offcn.house.pojo.Type;
import com.offcn.house.pojo.User;
import com.offcn.house.service.HouseService;
import com.offcn.house.service.TypeService;



@Controller
@RequestMapping("/house")
public class HouseController {
	@Resource
	private HouseService houseService;
	@Resource
	private TypeService typeService;
	//增加房屋
	@RequestMapping("/add")
	public String add(HttpSession session,House house) {
		User user =(User)session.getAttribute("userSession");
		house.setUserId(user.getId());
		int num = houseService.addHouse(house);
		System.out.println(num);
		return "redirect:/page/manage.jsp";
	}
	//查看所有房屋
	@RequestMapping("/findAll")
	@ResponseBody
	public PageInfo<House> findAll(HttpSession session,@RequestParam(defaultValue="1")Integer pageIndex,
			@RequestParam(defaultValue="")String title,
			@RequestParam(defaultValue="")String price,
			@RequestParam(defaultValue="")Integer typeId,
			@RequestParam(defaultValue="0")String floorage,Date beginTime,Date endTime) throws ParseException{
		User user=(User)session.getAttribute("userSession");
		String[] prices = price.split("-");
		String[] floorages = floorage.split("-");
		
		if(user!=null) {
			PageHelper.startPage(pageIndex,2);
			House house =new House ();
			house.setTitle(title);
			house.setMinPrice(Integer.parseInt(prices[0]));
			house.setMaxPrice(Integer.parseInt(prices[1]));
			house.setTypeId(typeId);
			house.setMinFloorage(Integer.parseInt(floorages[0]));
			house.setMaxFloorage(Integer.parseInt(floorages[1]));
			if(beginTime!=null && endTime!=null){
				house.setBeginTime(beginTime);
				house.setEndTime(endTime);
			}else if(beginTime!=null){
				house.setBeginTime(beginTime);
			}else if(endTime!=null){
				house.setEndTime(endTime);
			}
			List<House> list = houseService.findByCondition(house);
			PageInfo<House> pageInfo=new PageInfo<House>(list);
			return pageInfo;
			
		}
		return new PageInfo<House>();
	}
	
	//管理员查看所有房屋
		@RequestMapping("/findAllAdmin")
		@ResponseBody
		public PageInfo<House> findAll(HttpSession session,@RequestParam(defaultValue="1")Integer pageIndex){
			User user=(User)session.getAttribute("userSession");
			
			if(user!=null) {
				PageHelper.startPage(pageIndex,2);
				List<House> list = houseService.findAll();
				PageInfo<House> pageInfo=new PageInfo<House>(list);
				return pageInfo;
			}
			return new PageInfo<House>();
		}
	//去修改页面
	@RequestMapping("/goUpdate/{id}")
	public String goUpdate(HttpSession session,@PathVariable("id")Integer id) {
		House house = houseService.findById(id);
		List<Type> typeList = typeService.findAllType();
		session.setAttribute("typeList",typeList);
		session.setAttribute("house",house);
		return "redirect:/page/update.jsp";
	}
	//修改
	@RequestMapping("/updateSave")
	public String updateSave(House house) {
		int num = houseService.update(house);
		System.out.println(num);
		return "redirect:/page/manage.jsp";
	}
	
	//删除
	@RequestMapping("/goDelete")
	@ResponseBody
	public String goDelete(HttpSession session,Integer id) {
		
		User user=(User)session.getAttribute("userSession");
		House house = houseService.findByIds(id);
		System.out.println(user.getId());
		System.out.println(house.getUserId());
		if(user!=null) {
			if(user.getId().equals(house.getUserId())){
				houseService.delete(id);
				return "{\"result\":\"success\"}";
			}else {
				return "{\"result\":\"false\"}";
			}
		}else {
			
			return "{\"result\":\"not exist\"}";
		}
		
	}
	//根据标题查找
	@RequestMapping("/judgeTitle")
	@ResponseBody
	public String judgeTitle(String title){
		House houseName = houseService.findByName(title);
			
		 if(title.equals("")){
			return  "{\"result\":\"empty\"}";
		}else if(houseName!=null){
			return "{\"result\":\"success\"}";
		}else {
			return "{\"result\":\"false\"}";
		}
		}
	//修改标题查找
		@RequestMapping("/judgeTitleUpdate")
		@ResponseBody
		public String judgeTitleUpdate(String title,Integer id){
			House house1 = houseService.findByName(title);
			House house2 = houseService.findByIds(id);
			if(house1!=null && house2!=null) {
				if(house1.getTitle().equals(house2.getTitle())) {
					return "{\"result\":\"false\"}";
				}else{
					return "{\"result\":\"success\"}";
				}
			}else {
				return "{\"result\":\"empty\"}";
			}
		}
}
