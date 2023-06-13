<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="DBPKG.*" %>
<%
	request.setCharacterEncoding("UTF-8"); // 한글처리
	
	String sql = "UPDATE MEMBER_TBL_02 " + 
				 " SET CUSTNAME=?, PHONE=?, ADDRESS=?, JOINDATE=?, GRADE=?, CITY=? " +
				 " WHERE CUSTNO=" + Integer.parseInt(request.getParameter("custno"));
	Connection con = DBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("custname")); // ?의 첫번째
	pstmt.setString(2, request.getParameter("phone"));
	pstmt.setString(3, request.getParameter("address"));
	pstmt.setString(4, request.getParameter("joindate"));
	pstmt.setString(5, request.getParameter("grade"));
	pstmt.setString(6, request.getParameter("city"));
	
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="listSelectUpdate.jsp"></jsp:forward>
</body>
</html>