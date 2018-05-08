package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Baguni;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;


public interface ProductDao {
	
	public void updateStockCode(Product product) throws Exception;
	
	public void updateStock(Product product) throws Exception;
	
	public void updateViewNumber(Product product) throws Exception;
	
	public void insertBaguni(Baguni baguni) throws Exception;
	
	public int findBaguni(Baguni baguni) throws Exception;
	
	public  void insertProduct(Product productVO ) throws Exception;
	
	public Product findProduct(int prodNo) throws Exception;
	
	public void updateProduct(Product productVO) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public List<Purchase> getProductList(Search searchVO) throws Exception;
	

}
