<%@page import="com.member.model.MemberVo"%>
<%@page import="com.member.model.MemberService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	MemberService memberService = new MemberService();
    List<MemberVo> list = memberService.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllEmp.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 1200px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有會員資料 - listAllEmp.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>會員編號</th>
		<th>會員姓名</th>
		<th>帳號</th>
		<th>密碼</th>
		<th>性別</th>
		<th>信箱</th>
		<th>身分證</th>
		<th>電話</th>
		<th>狀態</th>
		<th>大頭貼</th>
		<th>錢包餘額</th>
		<th>綽號</th>
		<th>修改</th>
		<th>刪除</th>
		
		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="memberVo" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${memberVo.mem_no}</td>
			<td>${memberVo.mem_name}</td>
			<td>${memberVo.mem_account}</td>
			<td>${memberVo.mem_pwd}</td>
			<td>${(memberVo.mem_gender=='M')? '男':'女'}</td>
			<td>${memberVo.mem_mail}</td>
			<td>${memberVo.mem_id}</td>
			<td>${memberVo.mem_tel}</td>
			<td>${memberVo.mem_status}</td>
			<td><img  src="<%= request.getContextPath()%>/member/outImage2.do?mem_no='${memberVo.mem_no}'"></td>
			<td>${memberVo.mem_balance}</td>
			<td>${memberVo.mem_nickname}</td>
	

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="mem_no"  value="${memberVo.mem_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="mem_no"  value="${memberVo.mem_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>


</form>

</body>
</html>