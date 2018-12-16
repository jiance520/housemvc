package com.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.UsersMapper;
import com.entity.Users;
import com.service.IUsersService;

/**
 * @version 时间：2018年6月15日 上午10:49:08
 *
 */
@Service("usersService")
public class UsersService implements IUsersService{
	private UsersMapper usersMapper;

	public UsersMapper getUsersMapper() {
		return usersMapper;
	}
	@Autowired
	public void setUsersMapper(UsersMapper usersMapper) {
		this.usersMapper = usersMapper;
	}
	public void insertSelective(Users users){
		usersMapper.insertSelective(users);
	}
	public Users selectByUserPwd(Map map){
		Users users = usersMapper.selectByUserPwd(map);
		return users;
	}
}
