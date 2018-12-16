package com.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.House;
import com.entity.DistrictMapper;
import com.entity.HouseMapper;
import com.entity.StreetMapper;
import com.entity.Type2Mapper;
import com.service.IHouseService;

/**
 * @version 时间：2018年6月15日 上午10:47:44
 *
 */
@Service("houseService")
public class HouseService  implements IHouseService{
	private HouseMapper houseMapper;
//	private DistrictMapper districtMapper;
//	private StreetMapper streetMapper;
//	private Type2Mapper type2Mapper;

	public HouseMapper getHouseMapper() {
		return houseMapper;
	}
	public HouseService() {
		super();
	}
	@Autowired
	public void setHouseMapper(HouseMapper houseMapper) {
		this.houseMapper = houseMapper;
	}
	@Override
	public List<House> selectSearch(Map map) {
		List<House> list = houseMapper.selectSearch(map);
		return list;
	}
	@Override
	public List<House> selectPage(Map map) {
		List<House> list = houseMapper.selectPage(map);
		return list;
	}

	@Override
	public House selectByPrimaryKey(Integer i) {
		House house = houseMapper.selectByPrimaryKey(i);
		return house;
	}
	@Override
	public void updateByPrimaryKeySelective(House house) {
		houseMapper.updateByPrimaryKeySelective(house);
	}

	@Override
	public void insertSelective(House house) {
		houseMapper.insertSelective(house);
	}
	@Override
	public void deleteByPrimaryKey(Integer i) {
		houseMapper.deleteByPrimaryKey(i);
	}
	@Override
	public int selectHouseCount() {
		return houseMapper.selectHouseCount();
	}
	@Override
	public int selectHouseCountMap(Map map) {
		return houseMapper.selectHouseCountMap(map);
	}
	
}
