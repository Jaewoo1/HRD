<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="DBPKG.*"%>
<%
String sql = "SELECT mb.CUSTNO, mb.CUSTNAME, DECODE(mb.GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원') GRADE, "
		+ "SUM(mo.PRICE) PRICE " + "FROM MEMBER_TBL_02 mb, MONEY_TBL_02 mo " + "WHERE mb.CUSTNO = mo.CUSTNO "
		+ "GROUP BY mb.CUSTNO, mb.CUSTNAME, GRADE " + "ORDER BY SUM(mo.PRICE) desc";

Connection con = DBConnection.getConnection();
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리</title>
</head>
<style>
th {
	width: 100px;
}

td {
	text-align: center;
	font-size: 13px;
}

th:nth-child(3), :nth-child(4) {
	width: 130px;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="section">
		<h2>회원매출조회</h2>
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("custno")%></td>
				<td><%=rs.getString("custname")%></td>
				<td><%=rs.getString("grade")%></td>
				<td><%=rs.getString("price")%></td>
			</tr>

			<%
			}
			%>
		</table>
	</section>
</body>
</html>