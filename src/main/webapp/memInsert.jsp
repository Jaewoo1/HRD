<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="DBPKG.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리</title>
<link rel="stylesheet" href="./css/basic.css" />
<style>
	td {
		text-align: left;
		width: 400px;
	}
	.but{ text-align: center; }
</style>
<script>
	function inCheck() {
		const custname = document.querySelector("#custname");
		if(!custname.value){
			alert("회원성명이 입력되지 않았습니다.");
			custname.focus();
			return false;
		}
		const phone = document.querySelector("#phone");
		if(!phone.value){
			alert("회원전화가 입력되지 않았습니다.");
			phone.focus();
			return false;
		}
		const address = document.querySelector("#address");
		if(!address.value){
			alert("회원주소가 입력되지 않았습니다.");
			address.focus();
			return false;
		}
		const joindate = document.querySelector("#joindate");
		if(!joindate.value){
			alert("가입일자가 입력되지 않았습니다.");
			joindate.focus();
			return false;
		}
		const grade = document.querySelector("#grade");
		if(!grade.value){
			alert("고객등급이 입력되지 않았습니다.");
			grade.focus();
			return false;
		}
		const city = document.querySelector("#city");
		if(!city.value){
			alert("도시코드가 입력되지 않았습니다.");
			city.focus();
			return false;
		}
		alert("회원등록이 완료 되었습니다!");
		return true;
	}
	
	function search() {
		window.location.href="listSelectUpdate.jsp";
	}
</script>
<script src="./js/basic.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<%
String sql = "select max(custno)+1 from member_tbl_02"; // db의 마지막번호+1 처리
Connection con = DBConnection.getConnection(); // db 접속
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
rs.next(); // db에서 가져온 자료가 한개
int maxCustno = rs.getInt(1); // db의 마지막번호 +1, 회원번호
%>

	<section class="section">
		<h2>홈쇼핑 회원 등록</h2>
		<form action="dbInsert.jsp" method="POST" onsubmit="return inCheck('in')">
		<table>
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" readonly="readonly" value="<%=maxCustno%>"></td>
				<%-- 주의  readonly value="<%=maxCustno%>"  주의 --%>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" id="custname"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone" id="phone" size="30"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" id="address" size="50"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate" id="joindate"></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP, B:일반, C:직원]</th>
				<td><input type="text" name="grade" id="grade"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" id="city"></td>
			</tr>
			<tr>
				<td colspan="2" class="but">
					<input type="submit" value="등록">
					<input type="button" value="조회" onclick="return search()">
				</td>
			</tr>
		</table>
		</form>
	</section>
</body>
<%
DBConnection.getClose(con, pstmt, rs);
%>
</html>