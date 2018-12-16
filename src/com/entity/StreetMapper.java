package com.entity;

import java.util.List;

/**
 * @version 时间：2018年6月15日 上午10:29:43
 *
 */
public interface StreetMapper {
	Street selectByPrimaryKey(Integer i);
	List<Street> selectByDistrict_id(Integer i);
	Street selectStreetById(Integer i);
	Street selectStreetByName(String s);
}
