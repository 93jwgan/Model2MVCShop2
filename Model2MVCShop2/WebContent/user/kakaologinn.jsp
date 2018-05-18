<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Demo - Kakao JavaScript SDK</title>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>


 <a id="kakao-login-btn" image="  " Onclick=" "></a>
    <a href="http://developers.kakao.com/logout"></a>
    <script type='text/javascript'>
      
      
        Kakao.init('0d97f53ee557d3f90681bbd4eba9d38f');
      
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
        	  $.ajax({
        		type:"post",
        		dataType:"json",
        		url:"/user/loginAction/"
        		data : {JSON.parse(authObj).acces_token}
        		
        	  	
        	  })
        	  
        	  
        	  
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
      
    </script>



</body>
</html>