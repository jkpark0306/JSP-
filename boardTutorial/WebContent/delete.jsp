<%@page import="java.util.regex.Pattern"%>
<%@page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 조회</title>



</head>
<%
	String idx = request.getParameter("idx");
	try
	{
		Connection conn = null;
		
		String driverName = "com.mysql.jdbc.Driver";
		
		String url = "jdbc:mysql://125.141.59.79:3306/ASM_DB?autoReconnect=true&useSSL=false";            //접속 URL정보와 포트번호(oracle포트), sid(oracle버전)

		String id = "jkpark";
	    
	    String pw = "wlrb1234@";

	    Class.forName(driverName);
		
	    conn=DriverManager.getConnection(url,id,pw);
	    
	    Statement stmt = conn.createStatement();
	    
	    String sql = "delete from BOARD where idx = " + idx;
	    
	    stmt.executeUpdate(sql);
	    

	conn.close();
	
	}catch(Exception e)
	{
		out.println("MySQL Database Connection Something Problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
<script>
	alert("게시글이 삭제되었습니다.");
	location.href='redirect.jsp';
</script>
<bodY>
</bodY>
</html>


