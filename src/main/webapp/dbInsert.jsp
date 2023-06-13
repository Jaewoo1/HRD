<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="DBPKG.*" %>

<%
request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지, 반드시 처리, request임 response 아님

String sql = "INSERT INTO MEMBER_TBL_02 VALUES (?, ?, ?, ?, ?, ?, ?)";
Connection con = DBConnection.getConnection();
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setInt(1, Integer.parseInt(request.getParameter("custno")));
pstmt.setString(2, request.getParameter("custname"));
pstmt.setString(3, request.getParameter("phone"));
pstmt.setString(4, request.getParameter("address"));
pstmt.setString(5, request.getParameter("joindate"));
pstmt.setString(6, request.getParameter("grade"));
pstmt.setString(7, request.getParameter("city"));

pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:forward page="index.jsp"></jsp:forward>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<%-- 꼭 다시 연결 닫아주기 --%>
<% 
DBConnection.getClose(con, pstmt);
%>
</html>