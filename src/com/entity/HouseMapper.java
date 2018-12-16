package com.entity;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * @version 时间：2018年6月15日 上午10:29:27
 *
 */
public interface HouseMapper {
	List<House> selectSearch(Map map);
	List<House> selectPage(Map map);
	House selectByPrimaryKey(Integer i);
	void updateByPrimaryKeySelective(House house);
	void insertSelective(House house);
	void deleteByPrimaryKey(Integer i);
	int selectHouseCount();
	int selectHouseCountMap(Map map);
}
