package com.service;

import java.util.List;

import com.entity.Type2;

/**
 * @version 时间：2018年6月15日 上午10:46:09
 *
 */
public interface IType2Service {
	Type2 selectByPrimaryKey(Integer i);
	List<Type2> selectAll();
}
