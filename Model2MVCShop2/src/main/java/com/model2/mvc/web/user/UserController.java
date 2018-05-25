package com.model2.mvc.web.user;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Kakao;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserController(){
		
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
	
	
	
	

	
	
	
	
	@RequestMapping("addUserViewAction")
	public String addUserView() throws Exception {

		System.out.println("/addUserView.do");
		
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping(value="addUserAction")
	public String addUser( @ModelAttribute("user") User user ) throws Exception {
		
		System.out.println("/addUser.do");
		//Business Logic
		userService.addUser(user);
		
		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping(value="getUserAction")
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/getUser.do");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping(value="updateUserViewAction")
	public String updateUserView( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/updateUserView.do");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}
	
	@RequestMapping(value="updateUserAction")
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/updateUser.do");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/user/getUserAction?userId="+user.getUserId();
	}
	
	@RequestMapping(value="loginViewAction")
	public String loginView() throws Exception{
		
		System.out.println("/loginView.do");

		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping(value="loginAction" ,method=RequestMethod.POST)
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/login.do");
		//Business Logic
		
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return "redirect:/index.jsp";
	}
	@RequestMapping(value="loginAction" ,method=RequestMethod.GET)
	public String kakaoLogin(HttpServletRequest request,@RequestParam("userId") String userId , HttpSession session ) throws Exception{
		
		System.out.println("kakaoLogin start()....");
		System.out.println("Request.getQuery : "+request.getQueryString());
		//Business Logic
		System.out.println("userId : "+userId);
		User dbUser=userService.getUser(userId);
		
		
			session.setAttribute("user", dbUser);
		
		
		return "redirect:/index.jsp";
	}
	
	
	
	@RequestMapping(value="loginAction/{userId}" ,method=RequestMethod.POST)
	public String login(@ModelAttribute("user") User user , HttpSession session,@PathVariable String userId ) throws Exception{
		
		System.out.println("/login.do");
		//Business Logic
		System.out.println("user Id = == = = = = = =" +userId);
		User dbUser=userService.getUser(user.getUserId());
		
//		if( user.getPassword().equals(dbUser.getPassword())){
//			session.setAttribute("user", dbUser);
//		}
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="logoutAction")
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/logout.do");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="checkDuplicationAction")
	public String checkDuplication( @RequestParam("userId") String userId , Model model ) throws Exception{
		
		System.out.println("/checkDuplication.do");
		//Business Logic
		boolean result=userService.checkDuplication(userId);
		// Model 과 View 연결
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/user/checkDuplication.jsp";
	}
	
	@RequestMapping(value="listUserAction")
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listUser.do");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	}
}