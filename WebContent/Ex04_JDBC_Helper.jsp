
<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Connection conn = null;
    	conn = ConnectionHelper.getConnection("oracle");
    	System.out.println(conn);
    	//conn.close();
    	
    	conn = ConnectionHelper.getConnection("oracle","hr","1004");
    	System.out.println(conn);
    	
    	// Connection 객체로부터 정보
    	
    	// 5개의 Page >> DB연결 >> ConnectionHelper.getConnection("oracle"); >> 새로운 객체
    	// 하나의 연결 객체를 만들어서 사용(공유)하면 되지 않을까? => singleton(학습용) => 현업(DB)(POOL)
  	 
    	Connection conn2 = null;
    	conn2 =SingletonHelper.getConnection("oracle");
     	
    	Connection conn3 = null;
    	conn3 =SingletonHelper.getConnection("oracle");
    	
    	System.out.println(conn2 == conn3);
    	System.out.println(conn2);
    	System.out.println(conn3);
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 연결여부: <%=conn.isClosed() %><br>
 재정의 : <%=conn.toString() %><br>
 ProductName : <%=conn.getMetaData().getDatabaseProductName()%><br>
 ProductVersion : <%=conn.getMetaData().getDatabaseProductVersion()%><br>
</body>
</html>