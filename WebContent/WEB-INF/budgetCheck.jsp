<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>����񿹻� beans</TITLE>
</HEAD>

<BODY>
<%
	BudgetList bb = BudgetList.getInstance();
	bb.add(new Budget(10,1000));
	
%>
	<h3>����񿹻� beans</h3>
	������ȣ :
	<%= bb.getI(0).getProjectNumber() %><p>
		����񿹻� :
		<%=  bb.getI(0).getAmount() %>
	<p>�� ��ȯ�Ǿ����ϴ�.
</BODY>
</HTML>