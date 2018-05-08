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
<%System.out.println("listproduct.jsp ������ menu ::" +(String)request.getAttribute("menu")); %>

<html>
<head>
<title>��ǰ �����ȸ</title>

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
							��ǰ �����ȸ
							</c:if>
<%-- 					<% }else if(menu.equals("manage")){%> --%>
							<c:if test="${menu =='manage'}">
							��ǰ ����
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
				<option value="0" selected>��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2">��ǰ����</option>
			</select>
<%-- 			<%}else if(search.getSearchCondition().equals("1")){ %> --%>
				</c:if>
				<c:if test="${searchVO.searchCondition=='1' }">
			<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" >��ǰ��ȣ</option>
				<option value="1" selected>��ǰ��</option>
				<option value="2">��ǰ����</option>
			</select>
<%-- 			<%}else if(search.getSearchCondition().equals("2")){%> --%>
			</c:if>
			<c:if test="${searchVO.searchCondition=='2' }">
			<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px" value=>
				<option value="0" >��ǰ��ȣ</option>
				<option value="1" >��ǰ��</option>
				<option value="2" selected>��ǰ����</option>
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
				<option value="0">��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2">��ǰ����</option>
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
						<a href="javascript:fncGetUserList('1');">�˻�</a>
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
<%-- 		<td colspan="11" >��ü  <%= resultPage.getTotalCount() %> �Ǽ�,	���� <%= resultPage.getCurrentPage() %> ������</td> --%>
		<td colspan="11" >��ü  ${resultPage.totalCount} �Ǽ�,	���� ${resultPage.currentPage }  ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȸ��</td>	
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

			�Ǹ���
	
			</td>	
			
			</c:if>
			<c:if test="${list.purchaseProd.stockCode.trim() =='0' }">
			<td align="left">
			
			������
			
			</td>
			</c:if>
		</c:if>
		<c:if test="${menu=='manage' }">
			<c:if test="${list.tranCode.trim() ==null}" >
			<td align="left">
			
			�Ǹ���
			
			</td>
			</c:if>
			<c:if test="${list.tranCode.trim() =='0' }">			
			<td align="left">
	
			���� �Ϸ� <a href="/updateTranCodeByProd.do?tranNo=${list.tranNo}&tranCode=1&menu=manage">����ϱ�</a>
	
			</td>
			</c:if>
			<c:if test="${list.tranCode.trim() =='1' }">
			<td align="left">

			��ۿϷ�
	
			</td>
			</c:if>
			<c:if test="${list.tranCode.trim() =='2' }">
			<td align="left">

			��ۿϷ�
	
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
					�� ����
			<% }else{ %>
					<a href="/listProduct.do?searchCondition=<%=search.getSearchCondition()%>&searchKeyword=<%=search.getSearchKeyword()%>&menu=<%=menu%>&currentPage=<%=resultPage.getCurrentPage()-1 %>">�� ����</a>
			<% } %>



			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
 					//<a href="/listProduct.do?searchCondition=<%=searchVO.getSearchCondition()%>&searchKeyword=<%=searchVO.getSearchKeyword()%>&menu=<%=menu%>&currentPage=<%=i+1%>"><%=i %></a> 
						<a href="/listProduct.do?searchCondition=<%=search.getSearchCondition()%>&searchKeyword=<%=search.getSearchKeyword()%>&menu=<%=menu%>&currentPage=<%=i%>"><%=i %></a>
			<% 	}  %>
	



			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="/listProduct.do?searchCondition=<%=search.getSearchCondition()%>&searchKeyword=<%=search.getSearchKeyword()%>&menu=<%=menu%>&currentPage=<%=resultPage.getCurrentPage()+1 %>">���� ��</a>
			<% } %>
	
		--%>
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%-- 
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>
		--%>
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
    