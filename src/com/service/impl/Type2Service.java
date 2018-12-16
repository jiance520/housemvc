package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Type2Mapper;
import com.entity.Type2;
import com.service.IType2Service;

/**
 * @version 时间：2018年6月15日 上午10:48:38
 *
 */
@Service("type2Service")
public class Type2Service implements IType2Service{
	private Type2Mapper type2Mapper;

	public Type2Mapper getType2Mapper() {
		return type2Mapper;
	}
	@Autowired
	public void setType2Mapper(Type2Mapper type2Mapper) {
		this.type2Mapper = type2Mapper;
	}
	@Override
	public Type2 selectByPrimaryKey(Integer i) {
		Type2 type2 = type2Mapper.selectByPrimaryKey(i);
		return type2;
	}
	@Override
	public List<Type2> selectAll() {
		List<Type2> list = type2Mapper.selectAll();
		return list;
	}
}
