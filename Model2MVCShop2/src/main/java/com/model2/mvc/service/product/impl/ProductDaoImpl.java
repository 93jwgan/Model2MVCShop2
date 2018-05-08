package com.model2.mvc.service.product.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Baguni;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDao;




@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ProductDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	public void updateStockCode(Product product) throws Exception{
		sqlSession.update("ProductMapper.updateStockCode",product);
	}
	
	public void updateStock(Product product) throws Exception{
		sqlSession.update("ProductMapper.updateStock",product);
	}
	
	public void updateViewNumber(Product product) throws Exception{
		sqlSession.update("ProductMapper.updateViewNumber",product);
	}
	
	public void insertBaguni(Baguni baguni) throws Exception {
		sqlSession.insert("ProductMapper.insertBaguni",baguni);
	}
	public int findBaguni(Baguni baguni) throws Exception{
		int returnNumber=0;
		if(sqlSession.selectOne("ProductMapper.findBaguni",baguni)!=null) {
			returnNumber=1;
		}
		return returnNumber;
	}
	public  void insertProduct(Product productVO ) throws Exception {
		sqlSession.insert("ProductMapper.insertProduct",productVO);
	}

	public Product findProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.findProduct",prodNo);
	}
	public void updateProduct(Product productVO) throws Exception {
		sqlSession.update("ProductMapper.updateProduct",productVO);
	}
	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {		
		return sqlSession.selectOne("ProductMapper.getTotalCount",search);
	}
	public List<Purchase> getProductList(Search searchVO) throws Exception {
	
		return sqlSession.selectList("ProductMapper.getProductList", searchVO);
	}
	


}
