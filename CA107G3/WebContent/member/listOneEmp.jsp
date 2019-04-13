<%@page import="com.member.model.MemberVo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	MemberVo memberVo = (MemberVo) request.getAttribute("memberVo"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>會員資料 - listOneMember.jsp</title>

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
	width: 1000px;
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

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>會員資料 - ListOneMember.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

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
		<th>錢包餘額</th>
		<th>綽號</th>

	</tr>
	<tr>
		<td>		<%=memberVo.getMem_no()%> 				</td>
		<td>		<%=memberVo.getMem_name()%> 			</td>
		<td>		<%=memberVo.getMem_account()%> 			</td>
		<td>		<%=memberVo.getMem_pwd()%> 				</td>
		<td>		<%=memberVo.getMem_gender().equals("M")?"男":"女"%> 			</td>
		<td>		<%=memberVo.getMem_mail()%> 			</td>
		<td>		<%=memberVo.getMem_id()%> 				</td>
		<td>		<%=memberVo.getMem_tel()%> 				</td>
		<td>		<%=memberVo.getMem_status()%> 			</td>
		<td>		<%=memberVo.getMem_balance()%> 			</td>
		<td>		<%=memberVo.getMem_nickname()%> 		</td>
	</tr>
</table>

</body>
</html>