package com.entity;

import java.util.List;

/**
 * @version 时间：2018年6月15日 上午10:28:59
 *
 */
public interface DistrictMapper {
	District selectByPrimaryKey(Integer i);
	List<District> selectAll();
}
