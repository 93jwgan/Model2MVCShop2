<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%@page import = "com.model2.mvc.domain.Product" %> 
<%@page import="com.model2.mvc.domain.User" %>
<%@page import ="com.model2.mvc.domain.Purchase" %>
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.common.*" %>


<%
HashMap<String,Object> map=(HashMap<String,Object>)request.getAttribute("map");
List<Purchase> list = (ArrayList<Purchase>)map.get("list");
Page resultPage=(Page)request.getAttribute("resultPage");
Search search=(Search)request.getAttribute("searchVO");
%>
 --%>


<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetUserList(currentPage){
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listPurchase.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
<%-- 		<td colspan="11">전체  <%= resultPage.getTotalCount() %> 건수,	현재 <%= resultPage.getCurrentPage() %> 페이지</td> --%>
		<td colspan="11">전체 ${resultPage.totalCount } 건수,	현재 ${resultPage.currentPage } 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">구매물품</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	
<%-- 	<%for(int i=0;i<list.size();i++){ --%>
<!-- 		Purchase vo = (Purchase)list.get(i); %> -->
	<c:set var="i" value="0" />
		<c:forEach var="list" items="${map.list}">
			<c:set var="i" value="${ i+1 }" />
	<tr class="ct_list_pop">
		<td align="center">
			${i}
		</td>
		<td></td>
		<td align="left">
<%-- 			<a href="/getUser.do?userId=<%=vo.getBuyer().getUserId() %>"><%=vo.getBuyer().getUserId() %></a> --%>
			<a href="/getUser.do?userId=${list.buyer.userId }">${list.buyer.userId }</a>
		</td>
		<td></td>
<%-- 		<td align="left"><%=vo.getBuyer().getUserName() %></td> --%>
		
<%-- 			<td align="left"><a href="/getProduct.do?menu=purchase&prodNo=<%=vo.getPurchaseProd().getProdNo()%>"><%=vo.getPurchaseProd().getProdName() %></a></td> --%>
			<td align="left"><a href="/getProduct.do?menu=purchase&prodNo=${list.purchaseProd.prodNo }">${list.purchaseProd.prodName }</a></td>
		<td></td>
<%-- 		<td align="left"><%=vo.getReceiverPhone() %></td> --%>
		<td align="left">${list.receiverPhone }</td>
		<td></td>
<%-- 		<%if(vo.getTranCode().trim().equals("0")){ %> --%>
		<c:if test="${list.tranCode.trim()=='0' }">
		
		<td align="left">현재
				
					구매완료
				상태 입니다.</td>
		<td></td>

<%-- 		<%}else if(vo.getTranCode().trim().equals("1")){ %> --%>
		</c:if>
		<c:if test="${list.tranCode.trim()=='1' }">
				
		<td align="left">현재
				
					배송중
<%-- 				상태 입니다. <a href="/updateTranCodeByProd.do?tranNo=<%=vo.getTranNo()%>&tranCode=2">물건도착</a></td> --%>
					상태 입니다. <a href="/updateTranCodeByProd.do?tranNo=${list.tranNo }&tranCode=2">물건도착</a></td>
				
		<td></td>
		<td align="left">
<%-- 		<%}else if(vo.getTranCode().trim().equals("2")){ %> --%>
		</c:if>
		<c:if test="${list.tranCode.trim()=='2' }">
		
		<td align="left">현재
				
					배송완료
				상태입니다.
		<td></td>

		
<%-- 		<%} %> --%>
		</c:if>
<%-- 		<td align="left"><a href="/getPurchase.do?tranNo=<%=vo.getTranNo()%>"><%=vo.getTranNo() %></a> --%>
			
			<c:if test="${list.tranCode.trim()=='0' }">
			<td align="left"><a href="/getPurchase.do?tranNo=${list.tranNo }">수정하기</a>
			</c:if>
			<c:if test="${list.tranCode.trim()=='1'||list.tranCode.trim()=='2' }">
			<td align="left">수정불가능</a>
			</c:if>

		
		
		
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
<%-- 	<%} %> --%>
	</c:forEach>
	
	
		
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		 
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%-- 
		<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="/listPurchase.do?currentPage=<%=resultPage.getCurrentPage()-1 %>">◀ 이전</a>
			<% } %>



			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>

						<a href="/listPurchase.do?&currentPage=<%=i%>"><%=i %></a>
			<% 	}  %>
	



			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="/listPurchase.do?currentPage=<%=resultPage.getCurrentPage()+1 %>">이후 ▶</a>
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