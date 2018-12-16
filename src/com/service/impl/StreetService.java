package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.StreetMapper;
import com.entity.Street;
import com.service.IStreetService;

/**
 * @version 时间：2018年6月15日 上午10:48:06
 *
 */
@Service("streetService")
public class StreetService implements IStreetService{
	private StreetMapper streetMapper;

	public StreetMapper getStreetMapper() {
		return streetMapper;
	}
	@Autowired
	public void setStreetMapper(StreetMapper streetMapper) {
		this.streetMapper = streetMapper;
	}
	@Override
	public Street selectByPrimaryKey(Integer i) {
		Street street = streetMapper.selectByPrimaryKey(i);
		return street;
	}
	@Override
	public List<Street> selectByDistrict_id(Integer i) {
		List<Street> list = streetMapper.selectByDistrict_id(i);
		return list;
	}
	@Override
	public Street selectStreetById(Integer i){
		return streetMapper.selectStreetById(i);
	}
	@Override
	public Street selectStreetByName(String s) {
		return streetMapper.selectStreetByName(s);
	}
}
