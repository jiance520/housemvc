package com.service;

import java.util.List;

import com.entity.District;

/**
 * @version 时间：2018年6月15日 上午10:44:43
 *
 */
public interface IDistrictService {
	District selectByPrimaryKey(Integer i);
	List<District> selectAll();
}
