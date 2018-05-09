package com.model2.mvc.web.purchase;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	UserService userService;
	public PurchaseController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="addPurchaseViewAction")
	public ModelAndView addPurchaseViewAction(@RequestParam("prod_no") String prodNo,HttpServletRequest request) throws Exception {
		
		System.out.println("addPurchaseViewAction() start...................");
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("number", "0");
		modelAndView.addObject("productVO", product);
		modelAndView.setViewName("forward:/purchase/addPurchase.jsp");
		System.out.println("addPurchaseViewAction() end...................");
		return modelAndView;
	}
	@RequestMapping(value="addPurchase")
	public ModelAndView addPurchase(@ModelAttribute("purchaseVO")Purchase purchase,
																		@ModelAttribute("product")Product product,
																		@RequestParam("buyerId")String userId,
																		HttpServletRequest request) throws Exception {
		System.out.println("addPurchase() start...............");
		Date orderDate = new Date(System.currentTimeMillis());
		User user = new User();
		user = userService.getUser(userId);
		
		
	
		productService.updateStock(product);
		product = productService.getProduct(product.getProdNo());
		
		if(product.getStock() ==0) {
			product.setStockCode("0");
			productService.updateStockCode(product);
		}
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setOrderDate(orderDate);
		purchase.setDivyAddr(request.getParameter("receiverAddr"));
		purchase.setDivyDate(request.getParameter("receiverDate"));
		purchase.setDivyRequest(request.getParameter("receiverRequest"));
		purchase.setTranCode("0");
		purchaseService.addPurchase(purchase);
		purchase.setBuyer(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/purchase/endPurchase.jsp");
		
		System.out.println("addPurchase() end...............");
		return modelAndView;
	}
	@RequestMapping(value="getPurchaseAction")
	public ModelAndView getPurchaseAction(@RequestParam("tranNo") int tranNo,HttpServletRequest request) throws Exception {
		System.out.println("getPurchaseAction() start..............");
		purchaseService.getPurchase(tranNo);
		
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("purchaseVO",purchaseService.getPurchase(tranNo));
		modelAndView.setViewName("forward:/purchase/purchaseDetail.jsp");
		System.out.println("getPurchaseAction() end..............");
		return modelAndView;
	}
	@RequestMapping(value="listPurchaseAction")
	public ModelAndView listPurchaseAction(@ModelAttribute("search")Search search ,
																					HttpSession session,HttpServletRequest request) throws Exception {
		
		System.out.println("listPurchaseAction() start............");
		User user = (User)session.getAttribute("user");
		
		int currentPage =1;
		if(search.getCurrentPage() !=0) {
			currentPage=search.getCurrentPage();
		}
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		
		Map<String,Object> map = purchaseService.getPurchaseList(search, user.getUserId());
		
		
		Page resultPage	= 
				new Page( currentPage, ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

	
		ModelAndView modelAndView = new ModelAndView();
		
		
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("map",map);
		
		modelAndView.addObject("searchVO",search);
	
		modelAndView.setViewName("forward:/purchase/listPurchase.jsp");
		System.out.println("listPurchaseAction() end............");
		return modelAndView;
	}
	@RequestMapping(value="updatePurchaseAction")
	public ModelAndView updatePurchaseAction(@ModelAttribute("purchaseVO") Purchase purchase,
																						@RequestParam("buyerId") String userId,
																						@RequestParam("tranNo") int tranNo,
																						HttpServletRequest request) throws Exception {
		System.out.println("updatePurchaseAction() start..........");
		Date orderDate = new Date(System.currentTimeMillis());
		purchase.setOrderDate(orderDate);
		purchase.setDivyAddr(request.getParameter("receiverAddr"));
		purchase.setDivyDate(request.getParameter("receiverDate"));
		purchase.setDivyRequest(request.getParameter("receiverRequest"));
		
		purchaseService.updatePurcahse(purchase);
		purchase.setBuyer(userService.getUser(userId));
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("PurchaseVO",purchase);
		modelAndView.setViewName("forward:/purchase/purchaseDetail.jsp");
		System.out.println("updatePurchaseAction() end.........");
		return modelAndView;
	}
	@RequestMapping(value="updatePurchaseViewAction")
	public ModelAndView updatePurchaseViewAction(@RequestParam("tranNo") int tranNo,
																									HttpServletRequest request) throws Exception {
		
		System.out.println("updatePurcahseViewAction() start..........");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchaseVO",purchaseService.getPurchase(tranNo));
		modelAndView.addObject("number", "1");
		modelAndView.setViewName( "forward:/purchase/addPurchase.jsp");
		System.out.println("updatePurcahseViewAction() end..........");
		return modelAndView;
	}
	@RequestMapping(value="updateTranCodeByProdAction")
	public ModelAndView updateTranCodeByProdAction(@ModelAttribute("purchase") Purchase purchase,
																										@RequestParam(value = "menu",required =false) String menu,
																											HttpServletRequest request) throws Exception {

		System.out.println("updateTranCodeByProdAction() start.........");
		String resultPage = null;
		purchaseService.updateTranCode(purchase);
		purchase = purchaseService.getPurchase(purchase.getTranNo());
		
		if(menu !=null) {			
			resultPage = "/listProduct.do";
		}else {
			resultPage = "/listPurchase.do";
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(resultPage);
		System.out.println("updateTranCodeByProdAction() end........");
		return modelAndView;
	}
	
	
}
