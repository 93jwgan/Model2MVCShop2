package com.model2.mvc.service.purchaseimpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDAO;
	public void setPurchaseDao(PurchaseDao purchaseDAO) {
		this.purchaseDAO=purchaseDAO;
	}
	public PurchaseServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	//했음
	@Override
	public void addPurchase(Purchase purchaseVO) throws Exception {
		// TODO Auto-generated method stub
		purchaseDAO.insertPurchase(purchaseVO);
	}
    //했음
	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDAO.findPurchase(tranNo);
	}
	//했음
	@Override
	public Purchase getPurchase2(int ProdNo) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDAO.findPurchase2(ProdNo);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search searchVO, String buyerId) throws Exception {
		// TODO Auto-generated method stub
		
		return purchaseDAO.getPurchaseList(searchVO, buyerId);
	}
	@Override
	public HashMap<String, Object> getSaleList(Search searchVO) throws Exception {
		// TODO Auto-generated method stub
		
		return null;
	}
	//했음
	@Override
	public void updatePurcahse(Purchase purchaseVO) throws Exception {
		// TODO Auto-generated method stub
		purchaseDAO.updatePurchase(purchaseVO);
	}
	//했음
	@Override
	public void updateTranCode(Purchase purchaseVO) throws Exception {
		// TODO Auto-generated method stub
		purchaseDAO.updateTranCode(purchaseVO);
		
	}
	public int getTotalCount(String buyerId) throws Exception{
		
		return purchaseDAO.getTotalCount(buyerId);

	}



}
