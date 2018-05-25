<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>로그인 화면</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">

	
	function kakao(){
		
		
		Kakao.init('0d97f53ee557d3f90681bbd4eba9d38f');
		
		Kakao.Auth.login({
		    success: function(authObj) {	        	 
		    	
		    	
		    	Kakao.API.request({
		    		url:'/v1/user/me',
		    		success:function(res){
						
		    			$.ajax({
				    		type:"GET",
				    		dataType:"json",
				    		url:"/user/json/kakaoId",
				    		data : {"name" : res.id},
				    		success:function(JSONData,status){
				    			
				    			$("input[name='userId']").val(JSONData.userId);
				    			
				    			if(JSONData.userId !=null){
				    				$("form").attr("method","GET").attr("action","/user/loginAction").attr("target","_parent").submit();
				    			}else{
				    				
				    				window.open("/user/kakao.jsp?kakaoId="+res.id,"popWin", 
											"left=300,top=200,width=300,height=200,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no")
// 				    				self.location="addUserView.jsp";
				    			}
				    		}
				    	})
		    		}
		    	})

	          },	
	          fail: function(err) {
	              alert(JSON.stringify(err));
	           }
		})
		
		
		
	}

	$( function() {
		
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#userId").focus();
		
		//==> 추가된부분 : "Login"  Event 연결
		$("img[src='/images/btn_login.gif']").on("click" , function() {

			var id=$("input:text").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("input:text").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("input:password").focus();
				return;
			}
			
			//$("form").attr("method" , "POST");
			//$("form").attr("action" , "/login.do");
			//$("form").attr("target" , "_parent");
		    //$("form").submit();
			//==> 위의 4실행문과 같은의미			    
			$("form").attr("method","POST").attr("action","/user/loginAction").attr("target","_parent").submit();
			
		});
	});
	
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("img[src='/images/btn_add.gif']").on("click" , function() {
			self.location = "/user/addUserViewAction"
		});
	});

</script>

</head>

<body bgcolor="#ffffff" text="#000000" >

<form name="loginForm">

<div align="center">

<TABLE WITH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD ALIGN="CENTER" VALIGN="MIDDLE">

<table width="650" height="390" border="5" cellpadding="0" cellspacing="0" bordercolor="#D6CDB7">
  <tr> 
    <td width="10" height="5" align="left" valign="top" bordercolor="#D6CDB7">
    	<table width="650" height="390" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="305">
            <img src="/images/logo-spring.png" width="305" height="390"/>
          </td>
          <td width="345" align="left" valign="top" background="/images/login02.gif">
          	<table width="100%" height="220" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="30" height="100">&nbsp;</td>
                <td width="100" height="100">&nbsp;</td>
                <td height="100">&nbsp;</td>
                <td width="20" height="100">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="50">&nbsp;</td>
                <td width="100" height="50">
                	<img src="/images/text_login.gif" width="91" height="32"/>
                </td>
                <td height="50">&nbsp;</td>
                <td width="20" height="50">&nbsp;</td>
              </tr>
              <tr> 
                <td width="200" height="50" colspan="4"></td>
              </tr>              
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_id.gif" width="100" height="30"/>
                </td>
                <td height="30">
                  <input 	type="text" name="userId"  class="ct_input_g" 
                  				style="width:180px; height:19px"  maxLength='50'/>          
          		</td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_pas.gif" width="100" height="30"/>
                </td>
                <td height="30">                    
                    <input 	type="password" name="password" class="ct_input_g" 
                    				style="width:180px; height:19px"  maxLength="50" />
                </td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="20">&nbsp;</td>
                <td width="100" height="20">&nbsp;</td>
                <td height="20" align="center">
   				    <table width="136" height="20" border="0" cellpadding="0" cellspacing="0">
                       <tr> 
                         <td width="56">
                         	<a href="javascript:kakao()">
                         		<img src="/images/kakao/kakao_login_btn_small.png" width="56" height="20" border="0"/>
                         	</a>
                         </td>
                       
                       
                         <td width="56">
                         	
                         		<img src="/images/btn_login.gif" width="56" height="20" border="0"/>
                         	</a>
                         </td>
                         <td width="10">&nbsp;</td>
                         <td width="70">
                         	
                         		<img src="/images/btn_add.gif" width="70" height="20" border="0">
                         	
                         </td>
                       </tr>
                     </table>
                 </td>
                 <td width="20" height="20">&nbsp;</td>
                </tr>
              </table>
            </td>
      	</tr>                            
      </table>
      </td>
  </tr>
</table>
</TD>
</TR>
</TABLE>

</div>

</form>

</body>
</html>