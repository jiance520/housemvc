package com.entity;

import java.util.List;

/**
 * @version 时间：2018年6月15日 上午10:30:13
 *
 */
public interface Type2Mapper {
	Type2 selectByPrimaryKey(Integer i);
	List<Type2> selectAll();
}
