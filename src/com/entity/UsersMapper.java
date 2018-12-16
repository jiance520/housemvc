package com.entity;

import java.util.Map;

/**
 * @version 时间：2018年6月15日 上午10:36:11
 *
 */
public interface UsersMapper {
	void insertSelective(Users users);

	Users selectByUserPwd(Map map);
}
