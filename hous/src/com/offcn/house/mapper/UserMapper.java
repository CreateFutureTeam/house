package com.offcn.house.mapper;

import org.apache.ibatis.annotations.Param;

import com.offcn.house.pojo.User;

public interface UserMapper {
	/**
	 * 登录
	 * @param name
	 * @param password
	 * @return
	 */
	public User login(@Param("name")String name,@Param("password")String password);
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public int register(User user);
	/**
	 * 查询用户名是否相等
	 * @param name
	 * @return
	 */
	public User findUserByName(String name);
}


















