package com.model2.mvc.service.product.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Baguni;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {

	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDAO;
	public void setProductDao(ProductDao productDao) {
		this.productDAO=productDao;
	}
	public ProductServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	//했음
	public void updateStock(Product product) throws Exception {
		productDAO.updateStock(product);
	}
	//했음
	@Override
	public void addProduct(Product productVO) throws Exception {
		// TODO Auto-generated method stub
		productDAO.insertProduct(productVO);
	}
	//했음
	@Override
	public Product getProduct(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		
		return productDAO.findProduct(prodNo);
	}

	//했음
	@Override
	public void updateProduct(Product productVO) throws Exception {
		// TODO Auto-generated method stub
		productDAO.updateProduct(productVO);

	}
	//했음
	public void jangbaguni(Baguni baguni) throws Exception {
		productDAO.insertBaguni(baguni);
	}
	//했음
	public int findBaguni(Baguni baguni) throws Exception{
		
		return productDAO.findBaguni(baguni);
	}
	//했음
	public void updateViewNumber(Product product) throws Exception{
		
		productDAO.updateViewNumber(product);
	}
	
	public int totalCount(Search search) throws Exception{
		
		return productDAO.getTotalCount(search);
	}
	
	@Override
	public Map<String, Object> getProductList(Search searchVO) throws Exception {
		List<Purchase> list = productDAO.getProductList(searchVO);
		int totalCount = productDAO.getTotalCount(searchVO);
		for(int i=0;i<list.size();i++) {
			System.out.println(i+"번째 list::"+list.get(i));
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		System.out.println("list.size():"+list.size());
		map.put("totalCount", new Integer(totalCount));
		System.out.println("totalCount:"+new Integer(totalCount));
		return map;
	}
	


}
