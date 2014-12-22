<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>사업비 정산 조회 beans</TITLE>
</HEAD>
<script language=JavaScript src="js/caculation.js"></script>

<BODY>
	<form name=searchCaculate method=post action="caculate.js">
		<h3>사업비 증거자료 입력 beans</h3>
		과제번호 : <input type=text name="select_project_number" value="" size=20>
		<input type=button value="정산 조회" onClick="searchCaculation()"><br>
	</form>
</BODY>
</HTML>