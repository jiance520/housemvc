package com.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.District;
import com.entity.House;
import com.entity.Type2;
import com.entity.Users;
import com.service.IDistrictService;
import com.service.IHouseService;
import com.service.IType2Service;
import com.service.IUsersService;

/**
 * @version 时间：2018年7月3日 下午10:37:25
 *
 */
@Controller
public class UserController {
	private IUsersService ius;
	private IHouseService ihs;
	private IDistrictService ids;
	private IType2Service its;
//	private IStreetService iss;
	
	public IUsersService getIus() {
		return ius;
	}
	@Autowired
	public void setIus(IUsersService ius) {
		this.ius = ius;
	}
	public IHouseService getIhs() {
		return ihs;
	}
	@Autowired
	public void setIhs(IHouseService ihs) {
		this.ihs = ihs;
	}
	public IDistrictService getIds() {
		return ids;
	}
	@Autowired
	public void setIds(IDistrictService ids) {
		this.ids = ids;
	}
	public IType2Service getIts() {
		return its;
	}
	@Autowired
	public void setIts(IType2Service its) {
		this.its = its;
	}
	@RequestMapping("RegisterAction")
	public ModelAndView register(ModelAndView mav,String name,String password,Integer tel,String username){
		Users users = new Users();
		users.setIsadmin("1");
		users.setName(name);
		users.setPassword(password);
		users.setTelephone(tel.toString());
		users.setUsername(username);
		ius.insertSelective(users);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("password", password);
		map.put("username", name);
		mav.addAllObjects(map);
		System.out.println("测试registerAction");
		mav.setViewName("login");
		return mav;
	}
}
