package com.service;

import java.util.List;

import com.entity.Street;

/**
 * @version 时间：2018年6月15日 上午10:45:38
 *
 */
public interface IStreetService {
	Street selectByPrimaryKey(Integer i);
	List<Street> selectByDistrict_id(Integer i);
	Street selectStreetById(Integer i);
	Street selectStreetByName(String s);
}
