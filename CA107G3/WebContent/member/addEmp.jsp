<%@page import="com.member.model.MemberVo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	MemberVo memVO = (MemberVo) request.getAttribute("memVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��Ʒs�W - addEmp.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�|����Ʒs�W - addEmp.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
--${not empty errorMsgs}
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>���u�m�W:</td>
		<td><input type="TEXT" name="mem_name" size="45" 
			 value="<%= (memVO==null)? "�d�ç�" : memVO.getMem_name()%>" /></td>
	</tr>
	<tr>
		<td>�|���b��:</td>
		<td><input type="TEXT" name="mem_account" size="45" 
			 value="<%= (memVO==null)? "qaz12345" : memVO.getMem_account()%>" /></td>
	</tr>
	<tr>
		<td>�|���K�X:</td>
		<td><input type="TEXT" name="mem_pwd" size="45" 
			 value="<%= (memVO==null)? "qaz12345" : memVO.getMem_pwd()%>" /></td>
	</tr>
	<tr>
		<td>�ʧO:</td>
		<td>�k<input type="radio" value="M" name="mem_gender"/> &nbsp; �k<input type="radio" value="F" name="mem_gender"/>
		</td>
	</tr>
	<tr>
		<td>�H�c:</td>
		<td><input type="TEXT" name="mem_mail" size="45" 
			 value="<%= (memVO==null)? "qaz12345@gmail.com" : memVO.getMem_mail()%>" /></td>
	</tr>
	<tr>
		<td>������:</td>
		<td><input type="TEXT" name="mem_id" size="45" 
			 value="<%= (memVO==null)? "A222222222" : memVO.getMem_id()%>" /></td>
	</tr>
	<tr>
		<td>�q��:</td>
		<td><input type="TEXT" name="mem_tel" size="45" 
			 value="<%= (memVO==null)? "0912345678" : memVO.getMem_tel()%>" /></td>
	</tr>
	<tr>
		<td>���A:</td>
		<td><input type="TEXT" name="mem_status" size="45" 
			 value="<%= (memVO==null)? "1" : memVO.getMem_status()%>" readonly="readonly"/></td>
	</tr>


<!-- getMem_pic() -->
	<tr>
		<td>���]�l�B:</td>
		<td><input type="TEXT" name="mem_balance" size="45" 
			 value="<%= (memVO==null)? "0" : memVO.getMem_balance()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<td>�︹:</td>
		<td><input type="TEXT" name="mem_nickname" size="45" 
			 value="<%= (memVO==null)? "���p��" : memVO.getMem_nickname()%>" /></td>
	</tr>
	<tr>
		<td>�j�Y�K:</td>
		<td><input type="file" name = "mem_pic"></td>
	</tr>
	

</table>
<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="�e�X�s�W">
</FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<%-- <%  --%>
<!-- //   java.sql.Date hiredate = null; -->
<!-- //   try { -->
<!-- // 	    hiredate = empVO.getHiredate(); -->
<!-- //    } catch (Exception e) { -->
<!-- // 	    hiredate = new java.sql.Date(System.currentTimeMillis()); -->
<!-- //    } -->
<%-- %> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
//         $.datetimepicker.setLocale('zh');
//         $('#f_date1').datetimepicker({
// 	       theme: '',              //theme: 'dark',
// 	       timepicker:false,       //timepicker:true,
// 	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
// 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
<%-- 		   value: '<%=hiredate%>', // value:   new Date(), --%>
//            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
//            //startDate:	            '2017/07/10',  // �_�l��
//            //minDate:               '-1970-01-01', // �h������(���t)���e
//            //maxDate:               '+1970-01-01'  // �h������(���t)����
//         });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>