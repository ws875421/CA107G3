<%@page import="com.member.model.MemberVo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>

<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	MemberVo memberVo = (MemberVo) request.getAttribute("memberVo"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>�|����� - listOneMember.jsp</title>

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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�|����� - ListOneMember.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�|���s��</th>
		<th>�|���m�W</th>
		<th>�b��</th>
		<th>�K�X</th>
		<th>�ʧO</th>
		<th>�H�c</th>
		<th>������</th>
		<th>�q��</th>
		<th>���A</th>
		<th>���]�l�B</th>
		<th>�︹</th>

	</tr>
	<tr>
		<td>		<%=memberVo.getMem_no()%> 				</td>
		<td>		<%=memberVo.getMem_name()%> 			</td>
		<td>		<%=memberVo.getMem_account()%> 			</td>
		<td>		<%=memberVo.getMem_pwd()%> 				</td>
		<td>		<%=memberVo.getMem_gender().equals("M")?"�k":"�k"%> 			</td>
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