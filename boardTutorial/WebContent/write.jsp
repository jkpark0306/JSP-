<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>°Ô½Ã±Û ÀÔ·ÂÆû</title>
</head>

<body>
		<script>
		
	
		function formCheck() {
			
			var length = document.forms[0].length-1; 
			// submitÀ» Á¦¿ÜÇÑ ¸ðµç inputÅÂ±×ÀÇ °¹¼ö¸¦ °¡Á®¿È
			 
			for(var i = 0; i < length; i++){     // ·çÇÁ¸¦ µ¹¸é¼­
			 
			    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
			 
			        alert(document.forms[0][i].name + " pp"); // °æ°íÃ¢À» ¶ç¿ì°í
			 
			        document.forms[0][i].focus();           // nullÀÎ ÅÂ±×¿¡ Æ÷Ä¿½º¸¦ ÁÜ
			 
			        return false;
			 
			    }//end if
			    
			}
			
			return true;


		}
	</script>
	<form action='insert.jsp' method='post' onsubmit='return formCheck();'>
		title : <input type="text" name="title" /><br /> writer : <input type="text" name="writer" /><br /> date
		: <input type="text" name="regdate" /><br /> content : <input type = "text" name="content"/><br /> <input type="submit" value = 'test' />
	</form>
	


</body>

</html>
