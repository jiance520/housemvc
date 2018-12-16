package com.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.District;
import com.entity.DistrictMapper;
import com.service.IDistrictService;

/**
 * @version 时间：2018年6月15日 上午10:47:14
 *
 */
@Service("districtService")
public class DistrictService implements IDistrictService{
	private DistrictMapper districtMapper;
	
	public DistrictMapper getDistrictMapper() {
		return districtMapper;
	}
	@Autowired
	public void setDistrictMapper(DistrictMapper districtMapper) {
		this.districtMapper = districtMapper;
	}
	@Override
	public District selectByPrimaryKey(Integer i) {
		District district = districtMapper.selectByPrimaryKey(i);
		return district;
	}
	@Override
	public List<District> selectAll() {
		List<District>  list = districtMapper.selectAll();
		return list;
	}
}
