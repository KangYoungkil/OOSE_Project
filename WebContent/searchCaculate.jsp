<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>����� ���� ��ȸ beans</TITLE>
</HEAD>
<script language=JavaScript src="js/caculation.js"></script>

<BODY>
	<form name=searchCaculate method=post action="caculate.js">
		<h3>����� �����ڷ� �Է� beans</h3>
		������ȣ : <input type=text name="select_project_number" value="" size=20>
		<input type=button value="���� ��ȸ" onClick="searchCaculation()"><br>
	</form>
</BODY>
</HTML>