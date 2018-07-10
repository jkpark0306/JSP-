<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.regex.Pattern"%>
<%@page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 조회</title>
<style type="text/css">
 
    table, td, th   {
 
    border:1px solid green;
 
    }
 
    th{
 
    background-color:green;
 
    color:white;
 
    }
 
</style>


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
		
	    ResultSet rs = null;
	    
	    Statement stmt = conn.createStatement();
	    
	    String sql = "select * from BOARD where idx = " + idx;
	    
	    rs = stmt.executeQuery(sql);
	    
	    while(rs.next())
	    {
	    	request.setAttribute("idx",rs.getString("IDX"));
	    	request.setAttribute("writer",rs.getString("writer"));
	    	request.setAttribute("regdate",rs.getString("regdate"));
	    	request.setAttribute("count",rs.getString("count"));
	    	request.setAttribute("title",rs.getString("title"));
	    	request.setAttribute("content",rs.getString("content"));
	    	
		}
		conn.close();
		
		}catch(Exception e)
		{
			out.println("MySQL Database Connection Something Problem. <hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
%>
	

<body>
	<h1>게시글 조회</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<td>${idx}</td>
			<th>작성자</th>
			<td>${writer }</td>
			<th>날짜</th>
			<td>${regdate }</td>
			<th>조회수</th>
			<td>${count}</td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6">${title }</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6">${content }</td>
		</tr>
	</table>
	<a href="delete.jsp?idx=${idx }">게시글 삭제</a>
	<a href="list.jsp">목록으로</a>

</body>

</html>


