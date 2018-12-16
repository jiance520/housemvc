package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.CustomEditorConfigurer;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.entity.District;
import com.entity.House;
import com.entity.Street;
import com.entity.Type2;
import com.entity.Users;
import com.service.IDistrictService;
import com.service.IHouseService;
import com.service.IStreetService;
import com.service.IType2Service;
import com.service.IUsersService;

/**
 * @version 时间：2018年7月4日 下午8:01:57
 *
 */
@Controller
public class HouseController {
	private IUsersService ius;
	private IHouseService ihs;
	private IDistrictService ids;
	private IType2Service its;
	private IStreetService iss;
	public HouseController() {
		super();
	}
	public IHouseService getIhs() {
		return ihs;
	}
	@Autowired
	public void setIhs(IHouseService ihs) {
		this.ihs = ihs;
	}
	public IStreetService getIss() {
		return iss;
	}
	@Autowired
	public void setIss(IStreetService iss) {
		this.iss = iss;
	}
	
	public IUsersService getIus() {
		return ius;
	}
	@Autowired
	public void setIus(IUsersService ius) {
		this.ius = ius;
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
	@RequestMapping("/LoginAction")
	public ModelAndView login(ModelAndView mav,String name,String password,HttpSession session){
//		if(mav==null){
//			mav= new ModelAndView();
//		}
		Map loginmap = new HashMap();
		loginmap.put("name", name);
		loginmap.put("password", password);
		Map<String,Object> modelMap = new HashMap<String,Object>();
		Users users = ius.selectByUserPwd(loginmap);
		if(users!=null){
//			搜索页默认显示最新的4个房源
			Map defaultmap = new HashMap();
			defaultmap.put("num", 0);
			List<House> defaultlist = ihs.selectPage(defaultmap);
//			所有的房屋类型
			List<Type2> type2list = its.selectAll();
			
//			所有的区
			List<District> districtlist = ids.selectAll();
//			初始化用来分页的表单数据
			
			int count = ihs.selectHouseCount();//记录条数
			int pageall = 0;//总页数，每页4条，第1页是1.如果两个数都是整数,那结果就是整数,
			if(count>0){
				if(count%4==0){
					pageall = count/4;
				}
				else{
					pageall = count/4+1;//如“10/3”，结果为3，余数为1
				}
			}
			modelMap.put("page", 1);
			modelMap.put("title", "");
			modelMap.put("price", "");
			modelMap.put("districtId", "");
			modelMap.put("streetId", "");
			modelMap.put("typeId", "");
			modelMap.put("floorage","");
			modelMap.put("pageall", pageall);
			
			session.setAttribute("type2list", type2list);//所有的房屋类型
			session.setAttribute("districtlist", districtlist);//所有的区
			modelMap.put("defaultlist", defaultlist);//搜索页默认显示最新房源
			session.setAttribute("users", users);//当前登陆用户信息
			mav.addAllObjects(modelMap);
			System.out.println("测试login");
			mav.setViewName("index");
			return mav;
		}
		else{
			mav.setViewName("login");
			return mav;
		}
	}
	@RequestMapping("SearchAction")
	public ModelAndView search(ModelAndView mav,String title,String price,String floorage,String districtId,String streetId,String typeId,String page){
//		用于多条件查询，分页查询，
		if(page==null){
			page="1";
		}
		if(title==null){
			title="";
		}
		if(price==null){
			price="";
		}
		if(districtId==null){
			districtId="";
		}
		if(streetId==null){
			streetId="";
		}
		if(typeId==null){
			typeId="";
		}
		if(floorage==null){
			floorage="";
		}
		HashMap map = new HashMap();
		map.put("title", title);//模糊查询
		map.put("price", price);//区间查询
		map.put("typeId", typeId);
		map.put("floorage", floorage);//区间查询
		int pagenum = Integer.parseInt(page);
//		地区不为空，要查询所有街道
//		地区不为空，街道不为空，按街道查询
//		地区为空，街道肯定也为空，查询结果为空。
//		地区和街道做一个streetlist处理(难点)。
		List<Integer> streetidlist = null;
		if(districtId!=null&&!districtId.equals("")){
//			如果街道的id不为空
			if(streetId!=null&&!streetId.equals("")){
				int streetid = Integer.parseInt(streetId);
				streetidlist = new ArrayList();
				streetidlist.add(Integer.valueOf(streetid));
				map.put("streetidlist", streetidlist);
			}
//			如果街道的id为空
			else{
				List<Street> streetlist = iss.selectByDistrict_id(Integer.parseInt(districtId));
//				如果街道查询到值
				if(streetlist!=null&&!streetlist.isEmpty()){
					streetidlist = new ArrayList();
					for(Street streetobj:streetlist){
						streetidlist.add(Integer.valueOf(streetobj.getId()));
					}
					map.put("streetidlist",streetidlist);
				}
				else{
					streetidlist = new ArrayList();
					streetidlist.add(0);
					map.put("streetidlist",streetidlist);
//					如果街道没有查询到值，应该显示为空
					map.put("num", null);//通过limit(n1,n1+4);查询
				}
			}
		}
//		int count = ihs.selectHouseCount();//记录条数
		int count = ihs.selectHouseCountMap(map);//记录条数
		int pageall = 0;//总页数，每页4条，第1页是1.如果两个数都是整数,那结果就是整数,
		if(count>0){
			if(count%4==0){
				pageall = count/4;
			}
			else{
				pageall = count/4+1;//如“10/3”，结果为3，余数为1
			}
			map.put("num", (pagenum-1)*4);//通过limit(n1,n1+4);查询
		}
		Map<String,Object> modelMap = new HashMap<String,Object>();
		modelMap.put("page", pagenum);
		modelMap.put("title", title);
		modelMap.put("price", price);
		modelMap.put("districtId", districtId);//districtid
		modelMap.put("streetId",streetId);//不是对象是id
		modelMap.put("typeId", typeId);//不是对象是id
		modelMap.put("floorage",floorage);//floorage面积
		modelMap.put("pageall", pageall);
		List<House> defaultlist = ihs.selectSearch(map);
		modelMap.put("defaultlist", defaultlist);
		mav.addAllObjects(modelMap);
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("PageAction")
	public ModelAndView pageAction(ModelAndView mav,HttpServletRequest request,String title,String price,String floorage,String districtId,String streetId,String typeId,String page){
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap map = new HashMap();
		int pagenum = Integer.parseInt(page);//当前页数,不能大于pageall,也不能小于0.
		List<House> defaultlist = new ArrayList();
		map.put("title", title);//模糊查询
		map.put("price", price);//区间查询
		map.put("typeId", typeId);
		map.put("floorage", floorage);//区间查询
//		地区和街道做一个streetlist处理(难点)。
		List streetidlist = new ArrayList();
		if(districtId!=null&&!districtId.equals("")){
//			如果街道的id不为空
			if(streetId!=null&&!streetId.equals("")){
				int streetid = Integer.parseInt(streetId);
				streetidlist.add(streetid);
				map.put("streetidlist", streetidlist);
			}
//			如果街道的id为空
			else{
				List<Street> streetlist = iss.selectByDistrict_id(Integer.parseInt(districtId));
				for(Street streetobj:streetlist){
					streetidlist.add(streetobj.getId());
				}
				System.out.println("streetidlist"+streetidlist);
				map.put("streetidlist",streetidlist);
			}
		}
		int count = ihs.selectHouseCountMap(map);//记录条数
		int pageall = 0;//总页数，每页4条，第1页是1.如果两个数都是整数,那结果就是整数,
		if(count>0){
			if(count%4==0){
				pageall = count/4;
			}
			else{
				pageall = count/4+1;//如“10/3”，结果为3，余数为1
			}
			if(pagenum<1){
				pagenum=1;
			}
			else if(pagenum>pageall){
				pagenum=pageall;
			}
			map.put("num", (pagenum-1)*4);//通过limit(n1,n1+4);查询
		}
		modelMap.put("page", pagenum);
		modelMap.put("title", title);
		modelMap.put("price", price);
		modelMap.put("districtId", districtId);
		modelMap.put("streetId", streetId);
		modelMap.put("typeId", typeId);
		modelMap.put("floorage", floorage);
		modelMap.put("pageall", pageall);
		System.out.println("page"+page);
		System.out.println("pageall"+pageall);
		defaultlist = ihs.selectSearch(map);
		request.getSession().setAttribute("defaultlist", defaultlist);//保存当前分页的数据
		mav.addAllObjects(modelMap);
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("ReloadAction")
	public ModelAndView reload(ModelAndView mav){
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap map = new HashMap();
		int count = ihs.selectHouseCount();//记录条数
		int pageall = 0;//总页数，每页4条，第1页是1.如果两个数都是整数,那结果就是整数,
		int pagenum = Integer.parseInt("1");//当前页数,不能大于pageall,也不能小于0.
		if(count>0){
			if(count%4==0){
				pageall = count/4;
			}
			else{
				pageall = count/4+1;//如“10/3”，结果为3，余数为1
			}
			if(pagenum<1){
				pagenum=1;
			}
			else if(pagenum>pageall){
				pagenum=pageall;
			}
			map.put("num", (pagenum-1)*4);//通过limit(n1,n1+4);查询
		}
		modelMap.put("page", pagenum);
		modelMap.put("pageall", pageall);
		List<House> defaultlist = ihs.selectPage(map);
		modelMap.put("defaultlist", defaultlist);//保存当前分页的数据
		mav.addAllObjects(modelMap);
		mav.setViewName("modify");
		return mav;
	}
	@RequestMapping("ModifyPageAction")
	public ModelAndView modifyPage(ModelAndView mav,String title,String price,String floorage,String districtId,String streetId,String typeId,String page){
		Map<String,Object> modelMap = new HashMap<String,Object>();
		if(page==null){
			page="1";
		}
		if(title==null){
			title="";
		}
		if(price==null){
			price="";
		}
		if(districtId==null){
			districtId="";
		}
		if(streetId==null){
			streetId="";
		}
		if(typeId==null){
			typeId="";
		}
		if(floorage==null){
			floorage="";
		}
		HashMap map = new HashMap();
		int count = ihs.selectHouseCount();//记录条数
		int pageall = 0;//总页数，每页4条，第1页是1.如果两个数都是整数,那结果就是整数,
		int pagenum = Integer.parseInt(page);//当前页数,不能大于pageall,也不能小于0.
		if(count>0){
			if(count%4==0){
				pageall = count/4;
			}
			else{
				pageall = count/4+1;//如“10/3”，结果为3，余数为1
			}
			if(pagenum<1){
				pagenum=1;
			}
			else if(pagenum>pageall){
				pagenum=pageall;
			}
			map.put("num", (pagenum-1)*4);//通过limit(n1,n1+4);查询
		}
		map.put("title", title);//模糊查询
		map.put("price", price);//区间查询
		map.put("typeId", typeId);
		map.put("floorage", floorage);//区间查询
//		地区和街道做一个streetlist处理(难点)。
//		地区不为空，要查询所有街道
//		地区不为空，街道不为空，按街道查询
//		地区为空，街道肯定也为空，查询结果为空。
//		地区和街道做一个streetlist处理(难点)。
		List<Integer>  streetidlist = null;
		if(districtId!=null&&!districtId.equals("")){
//			如果街道的id不为空
			if(streetId!=null&&!streetId.equals("")){
				int streetid = Integer.parseInt(streetId);
				streetidlist = new ArrayList();
				streetidlist.add(Integer.valueOf(streetid));
				map.put("streetidlist", streetidlist);
			}
//			如果街道的id为空
			else{
				List<Street> streetlist = iss.selectByDistrict_id(Integer.parseInt(districtId));
				streetidlist = new ArrayList();
//				如果街道查询到值
				if(streetlist!=null&&!streetlist.isEmpty()){
					for(Street streetobj:streetlist){
						streetidlist.add(Integer.valueOf(streetobj.getId()));
					}
					System.out.println("streetidlist"+streetidlist);
					map.put("streetidlist",streetidlist);
				}
				else{
					streetidlist = new ArrayList();
					streetidlist.add(0);
					map.put("streetidlist",streetidlist);
//					如果街道没有查询到值，应该显示为空
					map.put("num", null);//通过limit(n1,n1+4);查询
				}
			}
		}
		modelMap.put("page", pagenum);
		modelMap.put("title", title);
		modelMap.put("price", price);
		modelMap.put("districtId", districtId);
		modelMap.put("streetId", streetId);
		modelMap.put("typeId", typeId);
		modelMap.put("floorage", floorage);
		modelMap.put("pageall", pageall);
		List<House> defaultlist = ihs.selectPage(map);
		modelMap.put("defaultlist", defaultlist);//保存当前分页的数据
		mav.addAllObjects(modelMap);
		mav.setViewName("modify");
		return mav;
	}
	@RequestMapping("ModifyAction")
	public ModelAndView modifyAction(ModelAndView mav,String houseid){
		Map<String,Object> modelMap = new HashMap<String,Object>();		
		House house = ihs.selectByPrimaryKey(Integer.parseInt(houseid));//重新加载id=1000的数据
		modelMap.put("houseupdate", house);
		System.out.println("modifyservlet执行成功"+house);
		mav.addAllObjects(modelMap);
		mav.setViewName("update");
		return mav;
	}
	@RequestMapping("UpdateAction")
	public ModelAndView updateAction(ModelAndView mav,HttpServletRequest request,House house){
		Map<String,Object> modelMap = new HashMap<String,Object>();
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
//		else{
//			DateFormat format = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy",Locale.US);//创建时间格式。
//			try {
//				Date date = format.parse(house.getPubdate());//创建一个指定时间。
//				house.setPubdate(date);
//			} 
//			catch (ParseException e) {
//				e.printStackTrace();
//			}
//		}		
		Street streetobj = iss.selectStreetById(house.getStreetId());
		Users user = (Users)request.getSession().getAttribute("users");
		Integer userId = user.getId();
		house.setUserId(userId);
		house.setStreetId(streetobj.getId());
		house.setStreet(streetobj);
		house.setImage("images/thumb_house.gif");//可不改，这个没有改的内容。
		ihs.updateByPrimaryKeySelective(house);
		System.out.println("执行UpdateAction成功");
		mav.addAllObjects(modelMap);
		mav.setViewName("redirect:ReloadAction");
		return mav;
	}
	@RequestMapping("InsertAction")
	public ModelAndView insertAction(ModelAndView mav,HttpServletRequest request,House house){
		Map<String,Object> modelMap = new HashMap<String,Object>();
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
		house.setImage("images/thumb_house.gif");//可不改，这个没有改的内容。		
		Street streetobj = iss.selectStreetById(house.getStreetId());
		house.setStreetId(streetobj.getId());		
		house.setStreet(streetobj);		
		Users user = (Users)request.getSession().getAttribute("users");
		Integer userId = user.getId();
		house.setUserId(userId);		
		
		System.out.println(house);
		ihs.insertSelective(house);//如果街道，地区，房屋类型数据库数据是固定的，那么，只需要修改房屋信息。
//		INSERT INTO house ( USER_ID, TYPE_ID, TITLE, DESCRIPTION, PRICE, PUBDATE, FLOORAGE, CONTACT, STREET_ID, IMAGE ) VALUES ( 1013, 1001, '大房子', '就是好', 345, NOW(), 100, '12345', 1000, 'images/thumb_house.gif'); 
		System.out.println("InsertAction执行成功");
		mav.addAllObjects(modelMap);
		mav.setViewName("redirect:ReloadAction");
		return mav;
	}
//	@ResponseBody
	@RequestMapping("StreetAction")
	public void streetAction(HttpServletRequest request,HttpServletResponse response,String districtid) throws IOException{
//		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset-UTF-8");
		PrintWriter out = response.getWriter();
		List<Street> streetlist = iss.selectByDistrict_id(Integer.parseInt(districtid));
		String streetlistjson = JSON.toJSONString(streetlist);
		out.print(streetlistjson);
		out.flush();
		out.close();
	}
	@RequestMapping("DeleteAction")
	public ModelAndView deleteAction(ModelAndView mav,String houseid){
		Map<String,Object> modelMap = new HashMap<String,Object>();
		ihs.deleteByPrimaryKey(Integer.parseInt(houseid));
		System.out.println("DeleteAction执行成功");
		mav.addAllObjects(modelMap);
		mav.setViewName("redirect:ReloadAction");
		return mav;
	}
//	@RequestMapping("ReloadAction")
//	public ModelAndView search2(ModelAndView mav){
//		Map<String,Object> modelMap = new HashMap<String,Object>();
//		mav.addAllObjects(modelMap);
//		mav.setViewName("modify");
//		return mav;
//	}
	//springmvc默认时间对象的格式yyyy/MM/dd，不是2018-11-11，使用时把以下代码放在指定@Cotroller类的内部即可。
    @InitBinder  // 定义时间转化格式 yyyy-MM-dd
    public void binder(ServletRequestDataBinder bind){
        // 定义时间转化格式
        SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");        
        // 把类型和格式绑定
        bind.registerCustomEditor(Date.class, new CustomDateEditor(smf, true));
    }   
}
