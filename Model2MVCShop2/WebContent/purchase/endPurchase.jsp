<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%-- <%@page import = "com.model2.mvc.domain.Product" %> 
<%@page import="com.model2.mvc.domain.User" %>
<%@page import ="com.model2.mvc.domain.Purchase" %>

<%
	Purchase vo = (Purchase)request.getAttribute("purchaseVO");
	User user=(User)vo.getBuyer();
	Product product=(Product)vo.getPurchaseProd();
%>
    --%>
    
    






<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" action="/updatePurchaseView.do?tranNo=0" method="post">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
<%-- 		<td><%=product.getProdNo() %></td> --%>
 		<td>${purchaseVO.purchaseProd.prodNo }</td>
	
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
<%-- 		<td><%=user.getUserId() %></td> --%>
		<td>${purchaseVO.buyer.userId }</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
	
<%-- 		<% if(vo.getPaymentOption().equals("1")) {%> --%>
		<c:if test="${purchaseVO.paymentOption=='1' }">
		<td>
		
			���ݱ���
		
		</td>
<%-- 		<%}else if(vo.getPaymentOption().equals("2")) { %> --%>
		</c:if>
		<c:if test="${purchaseVO.paymentOption=='2' }">
		<td>
		
			�ſ뱸��
		
		</td>
<%-- 		<%} %> --%>
		</c:if>
		
		
		
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
<%-- 		<td><%=user.getUserName() %></td> --%>
		<td>${purchaseVO.buyer.userName }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
<%-- 		<td><%=vo.getReceiverPhone() %></td> --%>
		<td>${purchaseVO.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
<%-- 		<td><%=vo.getDivyAddr() %></td> --%>
		<td>${purchaseVO.divyAddr }</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
<%-- 		<td><%=vo.getDivyRequest() %></td> --%>
		<td>${purchaseVO.divyRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
<%-- 		<td><%=vo.getDivyDate() %></td> --%>
		<td>${purchaseVO.divyDate }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>