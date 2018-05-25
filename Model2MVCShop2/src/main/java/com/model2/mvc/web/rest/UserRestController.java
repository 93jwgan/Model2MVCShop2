package com.model2.mvc.web.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Kakao;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 Controller
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserRestController(){
		
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="json/link",method=RequestMethod.GET)
	public User link(@ModelAttribute Kakao kakao) throws Exception {
		User user = userService.getUser(kakao.getUserId());
		
		
		System.out.println(kakao.getKakaoId());
		System.out.println(kakao.getUserId());
		if(user !=null) {
		userService.linkKakao(kakao);
		return user;
		}else {
			return new User();	
		}
	}
	
	
	@RequestMapping(value="json/kakaoId",method=RequestMethod.GET)
	public Kakao kakaoId(@RequestParam("name") String name) throws Exception {
		System.out.println("/kakaoId");
		System.out.println("-------------");
		System.out.println(name);

		if(userService.getKakaoId(name)==null) {
			userService.addKakaoId(name);
		}
		return userService.getKakaoId(name);
	}
	
	@RequestMapping(value="json/getUserAction/{userId}" ,method=RequestMethod.GET)
	public User getUser( @PathVariable String userId  ) throws Exception {
		
		System.out.println("/getUserAction");
		//Business Logic
		User user = userService.getUser(userId);
		
		return user;
	}
	
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(@RequestBody User user , HttpSession session ) throws Exception{
		
		
		
		System.out.println("/user/login : POST");
		System.out.println("-----------");
		
		System.out.println("-----------");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		

		
		return dbUser;
	}

	@RequestMapping(value="json/listUser" ,method=RequestMethod.POST)
	public Map listUser(@RequestBody Search search) throws Exception{
		
		System.out.println("/listUser.do");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		Map resultMap =  new HashMap();
				
		resultMap.put("list", map.get("list"));
		resultMap.put("resultPage", resultPage);
		resultMap.put("search",search);
		
		return resultMap;
	}
}