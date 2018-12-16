package com.service;

import java.util.Map;

import com.entity.Users;

/**
 * @version 时间：2018年6月15日 上午10:45:56
 *
 */
public interface IUsersService {
	void insertSelective(Users users);

	Users selectByUserPwd(Map map);
}
