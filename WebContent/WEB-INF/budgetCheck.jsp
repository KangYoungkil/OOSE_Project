<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>사업비예산 beans</TITLE>
</HEAD>

<BODY>
<%
	BudgetList bb = BudgetList.getInstance();
	bb.add(new Budget(10,1000));
	
%>
	<h3>사업비예산 beans</h3>
	과제번호 :
	<%= bb.getI(0).getProjectNumber() %><p>
		사업비예산 :
		<%=  bb.getI(0).getAmount() %>
	<p>가 반환되었습니다.
</BODY>
</HTML>