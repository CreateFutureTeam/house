package com.offcn.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.offcn.house.mapper.UserMapper;
import com.offcn.house.pojo.User;
import com.offcn.house.service.IUserService;
@Service("/userService")
public class UserServiceImpl implements IUserService {
	
	@Resource
	private UserMapper userMapper;

	@Override
	public User login(String name,String password) {
		
		return userMapper.login(name, password);
	}

	@Override
	public int register(User user){
		
		return userMapper.register(user);
	}

	@Override
	public User findUserByName(String name) {
		
		return userMapper.findUserByName(name);
	}

}
