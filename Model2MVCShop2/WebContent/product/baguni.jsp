<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<c:if test="${resutlNumber==1 }">
이미 장바구니에 등록된 상품입니다.
</c:if>
<c:if test="${resutlNumber==0 }">
장바구니에 등록되었습니다.
</c:if>

</html>