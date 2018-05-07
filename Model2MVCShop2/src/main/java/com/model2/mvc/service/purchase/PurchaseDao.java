package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {

	public void insertPurchase(Purchase purchaseVO) throws Exception ;
	
	public Map<String, Object> getPurchaseList(Search searchVO, String buyerId) throws Exception;
	
	public Purchase findPurchase(int tranNo) throws Exception ;
	
	public Purchase findPurchase2(int ProdNo) throws Exception ;
	
	public void updatePurchase(Purchase purchaseVO) throws Exception ;
	
	public void updateTranCode(Purchase purchaseVO) throws Exception ;
	
	public int getTotalCount(String sql) throws Exception;
}
