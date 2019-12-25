package com.offcn.house.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offcn.house.pojo.User;
import com.offcn.house.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;
	
	@RequestMapping("/login")
	@ResponseBody
	public String login(HttpSession session,@RequestParam(defaultValue="")String name,@RequestParam(defaultValue="")String password) {
		String str=null;
		User user = userService.login(name, password);
		if(user!=null){
			//如果是房客跳转到house_list
			//如果是销售员跳转到manage
			if(user.getIsadmin().trim().equals("1".trim())) {
				
				str="{\"result\":\"admin\"}";
			}else{
				str="{\"result\":\"tenants\"}";
			}
			
		}else {
			str="{\"result\":\"false\"}";
		}
		session.setAttribute("userSession",user);
		return str;
	}
	//注册
	@RequestMapping("/register")
	public String register(User user){
		int num= userService.register(user);
		System.out.println(num);
		return "redirect:/page/login.jsp";
	}
	
	//检查用户名是否重复
	@RequestMapping("/existName")
	@ResponseBody
	public String existName(String name){
		User user = userService.findUserByName(name);
		if(user!=null) {
			return "{\"result\":\"success\"}";
		}else {
			return "{\"result\":\"false\"}";
		}
		
	}
	
	//注销
	@RequestMapping("/exist")
	public String exist(HttpSession session) {
		session.removeAttribute("userSession");
		return "redirect:/page/login.jsp";
	}
	
	@RequestMapping("/isExist")
	@ResponseBody
	public String isExit(User user) {
		User u = userService.findUserByName(user.getName());
		if(u==null)
			return "true";
		else
			return "false";
	}

}













