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
<title>���� �����ȸ</title>

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
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
<%-- 		<td colspan="11">��ü  <%= resultPage.getTotalCount() %> �Ǽ�,	���� <%= resultPage.getCurrentPage() %> ������</td> --%>
		<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�,	���� ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">���Ź�ǰ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
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
		
		<td align="left">����
				
					���ſϷ�
				���� �Դϴ�.</td>
		<td></td>

<%-- 		<%}else if(vo.getTranCode().trim().equals("1")){ %> --%>
		</c:if>
		<c:if test="${list.tranCode.trim()=='1' }">
				
		<td align="left">����
				
					�����
<%-- 				���� �Դϴ�. <a href="/updateTranCodeByProd.do?tranNo=<%=vo.getTranNo()%>&tranCode=2">���ǵ���</a></td> --%>
					���� �Դϴ�. <a href="/updateTranCodeByProd.do?tranNo=${list.tranNo }&tranCode=2">���ǵ���</a></td>
				
		<td></td>
		<td align="left">
<%-- 		<%}else if(vo.getTranCode().trim().equals("2")){ %> --%>
		</c:if>
		<c:if test="${list.tranCode.trim()=='2' }">
		
		<td align="left">����
				
					��ۿϷ�
				�����Դϴ�.
		<td></td>

		
<%-- 		<%} %> --%>
		</c:if>
<%-- 		<td align="left"><a href="/getPurchase.do?tranNo=<%=vo.getTranNo()%>"><%=vo.getTranNo() %></a> --%>
			
			<c:if test="${list.tranCode.trim()=='0' }">
			<td align="left"><a href="/getPurchase.do?tranNo=${list.tranNo }">�����ϱ�</a>
			</c:if>
			<c:if test="${list.tranCode.trim()=='1'||list.tranCode.trim()=='2' }">
			<td align="left">�����Ұ���</a>
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
					�� ����
			<% }else{ %>
					<a href="/listPurchase.do?currentPage=<%=resultPage.getCurrentPage()-1 %>">�� ����</a>
			<% } %>



			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>

						<a href="/listPurchase.do?&currentPage=<%=i%>"><%=i %></a>
			<% 	}  %>
	



			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="/listPurchase.do?currentPage=<%=resultPage.getCurrentPage()+1 %>">���� ��</a>
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