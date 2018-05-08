<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%@page import = "com.model2.mvc.domain.Product" %> 
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.common.*" %>
<%@page import = "com.model2.mvc.domain.Purchase" %>


<%
	HashMap<String,Object> map=(HashMap<String,Object>)request.getAttribute("map");
	List<Purchase> list = (ArrayList<Purchase>)map.get("list");
	String menu = (String)request.getAttribute("menu");
	Page resultPage=(Page)request.getAttribute("resultPage");
	Search search=(Search)request.getAttribute("searchVO");
%>


--%>
<%System.out.println("listproduct.jsp 에서의 menu ::" +(String)request.getAttribute("menu")); %>

<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

function fncGetUserList(currentPage){
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();
}


</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<%-- <%if(menu.equals("search")){ %> --%>
<c:if test="${menu=='search'}">
<form name="detailForm" action="/listProduct.do?" method="post">
<%-- <%}else if(menu.equals("manage")){ %> --%>
</c:if>
<c:if test="${menu=='manage'}">
<form name="detailForm" action="/listProduct.do?" method="post">
<%-- <%} %> --%>
</c:if>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
<%-- 					<% if(menu.equals("search")){%> --%>
							<c:if test="${menu =='search'}">
							상품 목록조회
							</c:if>
<%-- 					<% }else if(menu.equals("manage")){%> --%>
							<c:if test="${menu =='manage'}">
							상품 관리
							</c:if>
<%-- 					<% }%> --%>
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
<%-- 		<%if(search.getSearchCondition() !=null){ %> --%>
		<c:if test="${searchVO.searchCondition!=null }">
<%-- 			<%if(search.getSearchCondition().equals("0")){ %> --%>
				<c:if test="${searchVO.searchCondition=='0' }">
			<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" selected>상품번호</option>
				<option value="1">상품명</option>
				<option value="2">상품가격</option>
			</select>
<%-- 			<%}else if(search.getSearchCondition().equals("1")){ %> --%>
				</c:if>
				<c:if test="${searchVO.searchCondition=='1' }">
			<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" >상품번호</option>
				<option value="1" selected>상품명</option>
				<option value="2">상품가격</option>
			</select>
<%-- 			<%}else if(search.getSearchCondition().equals("2")){%> --%>
			</c:if>
			<c:if test="${searchVO.searchCondition=='2' }">
			<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px" value=>
				<option value="0" >상품번호</option>
				<option value="1" >상품명</option>
				<option value="2" selected>상품가격</option>
			</select>
			</c:if>
<%-- 			<%} %> --%>
						
<%-- 			<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" value=<%=search.getSearchKeyword() %>> --%>
			<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" value=${search.searchKeyword }>
		</td>
<%-- 		<%}else{ %> --%>
			</c:if>
			<c:if test="${searchVO.searchCondition ==null }">
			<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0">상품번호</option>
				<option value="1">상품명</option>
				<option value="2">상품가격</option>
			</select>
			<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" >
		</td>
		</c:if>
<%-- 		<%} %> --%>
	
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<input type ="hidden" name="menu" value=${menu }>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetUserList('1');">검색</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
<%-- 		<td colspan="11" >전체  <%= resultPage.getTotalCount() %> 건수,	현재 <%= resultPage.getCurrentPage() %> 페이지</td> --%>
		<td colspan="11" >전체  ${resultPage.totalCount} 건수,	현재 ${resultPage.currentPage }  페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">조회수</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%--
		int no =list.size();
		
		for(int i=0;i<list.size();i++){
			//ProductVO vo = (ProductVO)list.get(i);
			Purchase purchase =(Purchase)list.get(i);
			Product vo = purchase.getPurchaseProd();
			
			
	--%>
	
	
		<c:forEach var="list" items="${map.list}">
		
	<tr class="ct_list_pop">
<%-- 		<td align="center"><%=vo.getProdNo()%></td> --%>
			<td align="center">${list.purchaseProd.prodNo}</td>

<%-- 		<%if(purchase.getTranCode()==null) {%> --%>
			<c:if test="${list.tranCode.trim()==null}">
				<td></td>
<%-- 				<% if(menu.equals("search")){%> --%>
				<c:if test="${menu =='search'}">
<%-- 				<td align="left"><a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>&menu=search"><%=vo.getProdName() %></td> --%>
				<td align="left"><a href="/getProduct.do?prodNo=${list.purchaseProd.prodNo}&menu=search&viewNumber=${list.purchaseProd.viewNumber+1}">${list.purchaseProd.prodName } trancode=null</td>
<%-- 				<% }else if(menu.equals("manage")){%> --%>
				</c:if>
				<c:if test="${menu=='manage'}">
<%-- 				<td align="left"><a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>&menu=manage"><%=vo.getProdName() %></a> --%>
				<td align="left"><a href="/getProduct.do?prodNo=${list.purchaseProd.prodNo}&menu=manage">${list.purchaseProd.prodName }</a>
<%-- 				<%} %> --%>
				</c:if>
		
<%-- 		<%}else if(purchase.getTranCode().trim().equals("0")) { %> --%>
			</c:if>
			<c:if test="${list.tranCode.trim()=='0' }">
				<td></td>
<%-- 				<% if(menu.equals("search")){%> --%>
				<c:if test="${menu=='search'}">
				
				
<%-- 				<td align="left"><%=vo.getProdName() %></td> --%>
				<td align="left"><a href="/getProduct.do?prodNo=${list.purchaseProd.prodNo}&menu=search&viewNumber=${list.purchaseProd.viewNumber+1}">${list.purchaseProd.prodName} trancode=0</a></td>
			
<%-- 				<% }else if(menu.equals("manage")){%> --%>
				</c:if>
				<c:if test="${menu=='manage'}">
<%-- 				<td align="left"><a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>&menu=manage"><%=vo.getProdName() %></a></td> --%>
				<td align="left"><a href="/getProduct.do?prodNo=${list.purchaseProd.prodNo}&menu=manage">${list.purchaseProd.prodName}</a></td>
				
					
<%-- 				<%} %> --%>		
			</c:if>
	
<%-- 		<%}else if(purchase.getTranCode().trim().equals("1")) {  %> --%>
			</c:if>
			<c:if test="${list.tranCode.trim()=='1'}">
		
		<td></td>
<%-- 				<% if(menu.equals("search")){%> --%>
					<c:if test="${menu=='search' }">
				
				
<%-- 				<td align="left"><%=vo.getProdName() %></td> --%>
				<td align="left"><a href="/getProduct.do?prodNo=${list.purchaseProd.prodNo}&menu=search&viewNumber=${list.purchaseProd.viewNumber+1}">${list.purchaseProd.prodName} trancode=1</a></td>
				
<%-- 				<% }else if(menu.equals("manage")){%> --%>
					</c:if>
					<c:if test="${menu=='manage'}">
<%-- 				<td align="left"><a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>&menu=manage"><%=vo.getProdName() %></a></td> --%>
					<td align="left"><a href="/getProduct.do?prodNo=${list.purchaseProd.prodNo}]&menu=manage">${list.purchaseProd.prodName}</a></td>
				
			
<%-- 				<%} %>		 --%>
			</c:if>
<%-- 		<%}else if(purchase.getTranCode().trim().equals("2")){ %> --%>
			</c:if>
			<c:if test="${list.tranCode.trim()=='2'}">
		<td></td>
<%-- 				<% if(menu.equals("search")){%> --%>
				<c:if test="${menu=='search' }">
				
				
<%-- 				<td align="left"><%=vo.getProdName() %></td> --%>
					<td align="left"><a href="/getProduct.do?prodNo=${list.purchaseProd.prodNo}&menu=search&viewNumber=${list.purchaseProd.viewNumber+1}">${list.purchaseProd.prodName} trancode=2</a></td>
				
<%-- 				<% }else if(menu.equals("manage")){%> --%>
				</c:if>
				<c:if test="${menu=='manage'}">
<%-- 				<td align="left"><a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>&menu=manage"><%=vo.getProdName() %></a></td> --%>
				<td align="left"><a href="/getProduct.do?prodNo=${list.purchaseProd.prodNo}&menu=manage">${list.purchaseProd.prodName }</a></td>
				
			
<%-- 				<%} %>		 --%>
				</c:if>
		
		
<%-- 		<%} %> --%>
		</c:if>
		
		
		
		
		
		<td></td>
		<td align="left">${list.purchaseProd.price}</td>
		<td></td>
		<td align="left">${list.purchaseProd.regDate }</td>
		<td></td>
		<c:if test="${menu=='search' }">
			<c:if test="${list.purchaseProd.stockCode.trim()==null }">
			<td align="left">

			판매중
	
			</td>	
			
			</c:if>
			<c:if test="${list.purchaseProd.stockCode.trim() =='0' }">
			<td align="left">
			
			재고없음
			
			</td>
			</c:if>
		</c:if>
		<c:if test="${menu=='manage' }">
			<c:if test="${list.tranCode.trim() ==null}" >
			<td align="left">
			
			판매중
			
			</td>
			</c:if>
			<c:if test="${list.tranCode.trim() =='0' }">			
			<td align="left">
	
			구매 완료 <a href="/updateTranCodeByProd.do?tranNo=${list.tranNo}&tranCode=1&menu=manage">배송하기</a>
	
			</td>
			</c:if>
			<c:if test="${list.tranCode.trim() =='1' }">
			<td align="left">

			배송완료
	
			</td>
			</c:if>
			<c:if test="${list.tranCode.trim() =='2' }">
			<td align="left">

			배송완료
	
			</td>
			</c:if>
		
		
		</c:if>
	<td align="left">${list.purchaseProd.viewNumber }</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	</c:forEach>
<%-- 	<%}	%> --%>
	

	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
		
		<%-- 
		<input type="hidden" id="currentPage" name="currentPage" value="1"/>
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="/listProduct.do?searchCondition=<%=search.getSearchCondition()%>&searchKeyword=<%=search.getSearchKeyword()%>&menu=<%=menu%>&currentPage=<%=resultPage.getCurrentPage()-1 %>">◀ 이전</a>
			<% } %>



			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
 					//<a href="/listProduct.do?searchCondition=<%=searchVO.getSearchCondition()%>&searchKeyword=<%=searchVO.getSearchKeyword()%>&menu=<%=menu%>&currentPage=<%=i+1%>"><%=i %></a> 
						<a href="/listProduct.do?searchCondition=<%=search.getSearchCondition()%>&searchKeyword=<%=search.getSearchKeyword()%>&menu=<%=menu%>&currentPage=<%=i%>"><%=i %></a>
			<% 	}  %>
	



			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="/listProduct.do?searchCondition=<%=search.getSearchCondition()%>&searchKeyword=<%=search.getSearchKeyword()%>&menu=<%=menu%>&currentPage=<%=resultPage.getCurrentPage()+1 %>">이후 ▶</a>
			<% } %>
	
		--%>
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%-- 
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %>
		--%>
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
    