<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    






<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchaseViewAction?tranNo=0" method="post">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>

 		<td>${purchaseVO.purchaseProd.prodNo }</td>
	
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>

		<td>${purchaseVO.buyer.userId }</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
	

		<c:if test="${purchaseVO.paymentOption=='1' }">
		<td>
		
			���ݱ���
		
		</td>

		</c:if>
		<c:if test="${purchaseVO.paymentOption=='2' }">
		<td>
		
			�ſ뱸��
		
		</td>

		</c:if>
		
		
		
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>

		<td>${purchaseVO.buyer.userName }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>

		<td>${purchaseVO.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>

		<td>${purchaseVO.divyAddr }</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>

		<td>${purchaseVO.divyRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>

		<td>${purchaseVO.divyDate }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>