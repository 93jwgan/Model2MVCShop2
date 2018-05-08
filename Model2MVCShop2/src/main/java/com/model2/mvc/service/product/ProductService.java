package com.model2.mvc.service.product;


import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Baguni;
import com.model2.mvc.service.domain.Product;



public interface ProductService {
	
	public void updateStockCode(Product product) throws Exception;
	
	public void addProduct(Product productVO) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public Map<String,Object> getProductList(Search searchVO) throws Exception;

	public void updateProduct(Product productVO) throws Exception;
	
	public void jangbaguni(Baguni baguni) throws Exception;
	
	public int findBaguni(Baguni baguni) throws Exception;
	
	public void updateViewNumber(Product product) throws Exception;
	
	public void updateStock(Product product) throws Exception;
	
	public int totalCount(Search search) throws Exception;
	
}