package com.service;

import java.util.List;
import java.util.Map;

import com.entity.House;

/**
 * @version 时间：2018年6月15日 上午10:45:15
 *
 */
public interface IHouseService {
	List<House> selectSearch(Map map);
	List<House> selectPage(Map map);
	House selectByPrimaryKey(Integer i);
	void updateByPrimaryKeySelective(House house);
	void insertSelective(House house);
	void deleteByPrimaryKey(Integer i);
	int selectHouseCount();
	int selectHouseCountMap(Map map);
}
