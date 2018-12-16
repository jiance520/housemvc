package com.test;

import java.util.Date;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.House;
import com.entity.Street;
import com.service.IHouseService;
import com.service.IStreetService;
import com.service.IUsersService;

/**
 * @version 时间：2018年7月4日 下午3:51:00
 *
 */
public class Test {

	public static void main(String[] args) {
		AbstractApplicationContext aac = new ClassPathXmlApplicationContext("applicationContext.xml");
		IHouseService ihs = (IHouseService)aac.getBean("houseService");
		IUsersService ius = (IUsersService)aac.getBean("usersService");
		IStreetService iss = (IStreetService)aac.getBean("streetService");
		House house = new House();
		if(house.getTitle()==null||house.getTitle().equals("")){
			house.setTitle("新房");
		}
		if(house.getTypeId()==null||house.getTypeId().equals("")){
			house.setTypeId(1000);
		}
		if(house.getFloorage()==null||house.getFloorage().equals("")){
			house.setFloorage(90);
		}
		if(house.getPrice()==null||house.getPrice().equals("")){
			house.setPrice(600);
		}
		if(house.getContact()==null||house.getContact().equals("")){
			house.setContact("123456");
		}
		if(house.getDescription()==null||house.getDescription().equals("")){
			house.setDescription("备注");
		}
		if(house.getStreetId()==null||house.getStreetId().equals("")){
			house.setStreetId(1000);
		}
		if(house.getPubdate()==null||house.getPubdate().equals("")){
			house.setPubdate(new Date());
		}
		Street streetobj = iss.selectStreetById(house.getStreetId());
		house.setUserId(1013);
		house.setStreetId(streetobj.getId());
		house.setStreet(streetobj);
		house.setImage("images/thumb_house.gif");//可不改，这个没有改的内容。
		ihs.updateByPrimaryKeySelective(house);
		System.out.println("执行UpdateAction成功");
//		private IDistrictService ids;
//		private IType2Service its;
//		private IStreetService iss;
//		ius.insertSelective(users);
//		System.out.println(ihs.selectByPrimaryKey(1000));
	}

}
