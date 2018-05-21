<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){

	$("td.ct_btn01:contains('검색')").on("click",function(){
		
		fncGetUserList(1);
		
	});
	$("tr.ct_list_pop td:nth-child(3)").on("click",function(){
// 		alert("iiii::::"+$(this).text().trim());
// 		var number = Number($(this).parent().children().eq(0).text().trim());
// 		alert("====="+number);
		
		var prodNo = Number($(this).children().eq(0).val());
		
		
		var viewNumber = Number($(this).children().eq(1).val());
		
		
		

	if(${menu=='search'}){
		self.location="/product/getProductAction?prodNo="+prodNo+"&menu=search&viewNumber="+(viewNumber+1);
		
	}else if(${menu=='manage'}){
		self.location="/product/getProductAction?prodNo="+prodNo+"&menu=search";
	}
	});
	$("td:contains('배송하기')").on("click",function(){
		var number = $(this).parent().children().eq(0).text().trim();
		//alert("number == "+number);
		
	});
	
	
	
})

function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage);
   	$("form").attr("method","POST").attr("action","/product/listProductAction").submit();
}


</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<c:if test="${menu=='search'}">
<form name="detailForm">

</c:if>
<c:if test="${menu=='manage'}">
<form name="detailForm" action="/product/listProductAction?" method="post">

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

							<c:if test="${menu =='search'}">
							상품 목록조회
							</c:if>

							<c:if test="${menu =='manage'}">
							상품 관리
							</c:if>

					
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

		<c:if test="${searchVO.searchCondition!=null }">

				<c:if test="${searchVO.searchCondition=='0' }">
			<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" selected>상품번호</option>
				<option value="1">상품명</option>
				<option value="2">상품가격</option>
			</select>

				</c:if>
				<c:if test="${searchVO.searchCondition=='1' }">
			<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" >상품번호</option>
				<option value="1" selected>상품명</option>
				<option value="2">상품가격</option>
			</select>

			</c:if>
			<c:if test="${searchVO.searchCondition=='2' }">
			<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px" value=>
				<option value="0" >상품번호</option>
				<option value="1" >상품명</option>
				<option value="2" selected>상품가격</option>
			</select>
			</c:if>

						

			<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" value=${search.searchKeyword }>
		</td>

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

	
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<input type ="hidden" name="menu" value=${menu }>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						검색
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
		<c:set var="i" value="0"/>
		<c:forEach var="list" items="${map.list}">
		<c:set var="i" value="${ i+1 }" />
	<tr class="ct_list_pop">

			<td align="center">${i}</td>




		<td></td>

				<c:if test="${menu=='search' }">
				
				

					<td align="left">${list.purchaseProd.prodName}
					<input type="hidden" name=${list.purchaseProd.prodNo } value="${list.purchaseProd.prodNo}">
					<input type="hidden" name=${list.purchaseProd.viewNumber } value = "${list.purchaseProd.viewNumber }">
					</td>
				

				</c:if>
				<c:if test="${menu=='manage'}">

				<td align="left">${list.purchaseProd.prodName }</td>
				
			

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
	
			구매 완료 배송하기
	
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

	

	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>


</form>

</div>
</body>
</html>
    