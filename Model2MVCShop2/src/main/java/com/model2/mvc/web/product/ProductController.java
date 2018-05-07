package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Baguni;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;





@Controller
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping("/addProduct.do")
	public String addProductAction(@ModelAttribute("product") Product product,HttpServletRequest request) throws Exception {

		productService.addProduct(product);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping("/getProduct.do")
	public String getProductAction(@RequestParam("menu") String menu,
																@RequestParam("prodNo") String prodNo,
																HttpServletRequest request,Model model) throws Exception {
		System.out.println("getProductAction() start");
		String viewNumber = request.getParameter("viewNumber");
		String resultPage="";
		if(menu.equals("manage")) {
			resultPage = "forward:/product/addProductView.jsp";
		}else if(menu.equals("search")||menu.equals("purchase")){
			if(menu.equals("search"))
			{
				Product product = new Product();	
				product.setViewNumber(Integer.parseInt(viewNumber));
				product.setProdNo(Integer.parseInt(prodNo));
				productService.updateViewNumber(product);
			}
			resultPage ="forward:/product/detailProduct.jsp";
		}
		model.addAttribute("productVO",  productService.getProduct(Integer.parseInt(prodNo)));
		model.addAttribute("menu", menu);
		System.out.println("getProductAction() end");

		return resultPage;
	}
	
	@RequestMapping("/jangbaguni.do")
	public String jangbaguniAction(@RequestParam("prod_no") String prodNo,HttpServletRequest request,HttpSession session,Model model) throws Exception {
		
		User userVO = (User)session.getAttribute("user");		
		int resutlNumber=0;

		Baguni baguni =new Baguni();
		baguni.setProdNo(Integer.parseInt(prodNo));
		baguni.setUserId(userVO.getUserId());
		resutlNumber=productService.findBaguni(baguni);

		System.out.println("resutlNumber====="+resutlNumber);
		if(resutlNumber==0) {
		productService.jangbaguni(baguni );			
		}	
		
		model.addAttribute("resutlNumber", resutlNumber);
			
		return "forward:/product/baguni.jsp";
	}
	
	
	@RequestMapping("/listProduct.do")
	public String listProductAction(@RequestParam("menu") String menu,
																@ModelAttribute("search") Search search,
																HttpSession session,HttpServletRequest request,
																Model model) throws Exception {
		
		User userVO = (User)session.getAttribute("user");
		
		if(menu==null) {
			menu =(String)request.getAttribute("menu");
		}

		int currentPage =1;
		if(search.getCurrentPage() !=0) {
			currentPage=search.getCurrentPage();
		}
		search.setCurrentPage(currentPage);

		search.setPageSize(pageSize);
	
		Map<String,Object> map = productService.getProductList(search);
		
		Page resultPage	= 
				new Page( currentPage, ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("ListUserAction ::"+resultPage);
		
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("map", map);
		model.addAttribute("searchVO",search);
		model.addAttribute("menu", menu);
		
		
		return "forward:/product/listproduct.jsp";
	}
	
	@RequestMapping("/updateProduct.do")
	public String updateProductAction(		@ModelAttribute("product") Product product
																			,@RequestParam("prodNo") String prodNo
																			,HttpServletRequest request,
																			Model model) throws Exception {

		String menu = request.getParameter("menu");
		product.setProdNo(Integer.parseInt(prodNo));		
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		productService.updateProduct(product);
		
		product = productService.getProduct(Integer.parseInt(prodNo));
		
		model.addAttribute("productVO", product);
		model.addAttribute("menu", menu);
		
		return "forward:/product/detailProduct.jsp";
	}
	
	
	
	
	
}
