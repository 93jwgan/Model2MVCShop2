package com.model2.mvc.web.rest;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
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
import com.model2.mvc.service.domain.Baguni;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestContoller {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	public ProductRestContoller() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	@RequestMapping(value="json/addProductAction", method=RequestMethod.POST)
	public String addProductAction(@RequestBody Product product,@RequestParam("message")String message) throws Exception {
		System.out.println("message : "+message);
		productService.addProduct(product);
		
		return "1";
	}
	
	@RequestMapping(value="json/addProductAction", method=RequestMethod.GET)
	public String addProduct(@ModelAttribute("product") Product product,@RequestParam("message")String message) throws Exception {
		System.out.println("message : "+message );
		productService.addProduct(product);
		
		return "1";
	}
	
	@RequestMapping(value="json/getProductAction")
	public Product getProductAction(@RequestParam("menu") String menu,
																@RequestParam("prodNo") String prodNo,@RequestParam("viewNumber")String viewNumber,Model model) throws Exception {
		System.out.println("getProductAction() start");
		
				Product product = new Product();	
				product.setViewNumber(Integer.parseInt(viewNumber));
				product.setProdNo(Integer.parseInt(prodNo));
				productService.updateViewNumber(product);
		
		
		model.addAttribute("productVO",  productService.getProduct(Integer.parseInt(prodNo)));
		model.addAttribute("menu", menu);
		
		System.out.println("getProductAction() end");
		
		return productService.getProduct(Integer.parseInt(prodNo));
	}

	@RequestMapping(value="json/listProductAction/{menu}")
	public Map listProductAction(@PathVariable String menu,
																@RequestBody Search search) throws Exception {
		System.out.println("---------------------");
		System.out.println(menu);
		System.out.println(search);
		System.out.println("---------------------");
		
		search.setPageSize(pageSize);			
		
		
		return productService.getProductList(search);
	}


	
	
}
