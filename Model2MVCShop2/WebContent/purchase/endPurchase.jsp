<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    






<html>
<head>
<title>Insert title here</title>

</head>

<body>

<form name="updatePurchase" >

다음과 같이 구매가 되었습니다.

<table border=1>
	<tr>
		<td>물품번호</td>

 		<td>${purchaseVO.purchaseProd.prodNo }</td>
	
		<td></td>
	</tr>
	<tr>
		<td>구매자아이디</td>

		<td>${purchaseVO.buyer.userId }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매방법</td>
	

		<c:if test="${purchaseVO.paymentOption=='1' }">
		<td>
		
			현금구매
		
		</td>

		</c:if>
		<c:if test="${purchaseVO.paymentOption=='2' }">
		<td>
		
			신용구매
		
		</td>

		</c:if>
		
		
		
		<td></td>
	</tr>
	<tr>
		<td>구매자이름</td>

		<td>${purchaseVO.buyer.userName }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자연락처</td>

		<td>${purchaseVO.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자주소</td>

		<td>${purchaseVO.divyAddr }</td>
		<td></td>
	</tr>
		<tr>
		<td>구매요청사항</td>

		<td>${purchaseVO.divyRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>배송희망일자</td>

		<td>${purchaseVO.divyDate }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>