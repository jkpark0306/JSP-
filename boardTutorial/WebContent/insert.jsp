<%@page import="java.util.regex.Pattern"%>
<%@page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խñ� ����Ʈ</title>
</head>

<%
	request.setCharacterEncoding("euc-kr");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String regdate = request.getParameter("regdate");
	int count = 10000;

	String content = request.getParameter("content");
if(title == "" ||title == null) out.println("title�� null�Դϴ�.");
 
if(writer == "" ||writer == null)
    out.println("writer�� null�Դϴ�.");   
else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
    out.println("�̸��� ������ �ƴմϴ�.");
 
if(regdate == "" ||regdate == null)
    out.println("regdate�� null�Դϴ�.");
else if(!Pattern.matches("^[0-9]*$", regdate))
    out.println("���������� �ƴմϴ�.");
 
if(content == "" ||content == null) out.println("content�� null�Դϴ�.");

try {
	Connection conn = null;
	
    String driverName = "com.mysql.jdbc.Driver"; //�����ͺ��̽��� �����ϱ����� ����̹��� �ε��մϴ�.

    String url = "jdbc:mysql://125.141.59.79:3306/ASM_DB?autoReconnect=true&useSSL=false&characterEncoding=UTF8";            //���� URL������ ��Ʈ��ȣ(oracle��Ʈ), sid(oracle����)

	String id = "jkpark";
    
    String pw = "wlrb1234@";

    Class.forName(driverName);
	
    conn=DriverManager.getConnection(url,id,pw);
    //Connection con = DriverManager.getConnection(url,"jkpark","wlrb1234@");    // getCo... : �������� url, id, pw

    out.println("Mysql �����ͺ��̽� db�� ���������� �����߽��ϴ�");
	
    Statement stmt = conn.createStatement();
    
    	String sql = "INSERT INTO BOARD"+
    					"(title,writer,regdate,count,content)"+
    					"values('"+title+"', '"+writer+"', now(), '1', '"+content+"')";
    	
    					
    				stmt.executeUpdate(sql);
    conn.close();
    
    

} catch (Exception e) {

    out.println("Mysql �����ͺ��̽� db ���ӿ� ������ �ֽ��ϴ�. <hr>");

    out.println(e.getMessage());

    e.printStackTrace();

}
finally{
	out.print("<script>location.href='list.jsp';</script>");
}

%>
<body>
</body>

</html>


