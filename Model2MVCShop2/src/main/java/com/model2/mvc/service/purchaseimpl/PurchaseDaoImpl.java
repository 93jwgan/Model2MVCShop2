package com.model2.mvc.service.purchaseimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}
	//했음
	@Override
	public void insertPurchase(Purchase purchaseVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("PurchaseMapper.insertPurchase",purchaseVO);
		
	}

	@Override
	public Map<String, Object> getPurchaseList(Search searchVO, String buyerId) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("search",searchVO);
		map.put("buyerId", buyerId);
		
		List<Purchase> list = new ArrayList<Purchase>();
		list =sqlSession.selectList("PurchaseMapper.purchaseList",map);
		map.put("totalCount",  sqlSession.selectOne("PurchaseMapper.getTotalCount",buyerId));
		map.put("list", list);
		return map;
	}
	//했음
	@Override
	public Purchase findPurchase(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne("PurchaseMapper.findPurchase",tranNo);
	}
	//했음
	@Override
	public Purchase findPurchase2(int ProdNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PurchaseMapper.findPurchase2",ProdNo);
	}
	//했음
	@Override
	public void updatePurchase(Purchase purchaseVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("PurchaseMapper.updatePurchase",purchaseVO);
	}
	//했음
	@Override
	public void updateTranCode(Purchase purchaseVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("PurchaseMapper.updateTranCode",purchaseVO);
	}
	
	@Override
	public int getTotalCount(String buyerId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PurchaseMapper.getTotalCount",buyerId);
	}

	
	
	
	
	
}
