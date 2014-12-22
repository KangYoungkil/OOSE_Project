<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>
<%@ page import="java.util.Enumeration"%>

<HTML>
<HEAD>
<TITLE>사업비증거입력 완료 beans</TITLE>
</HEAD>
<script language=JavaScript src="js/evidence.js"></script>

<BODY>
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<%
		String strProjectNumber = request
				.getParameter("select_project_number");
		int selectProjectNumber = Integer.parseInt(strProjectNumber);
		BusinessCaculationControl bc = new BusinessCaculationControl();
		Budget bg = bc.selectBudget(selectProjectNumber);
		Evidence ev = bc.selectEvidence(selectProjectNumber);
	%>
	<form name=evidenceInput method=post action="evidence.js">
		<h3>사업비 증거입력 완료 beans</h3>
		선택된 과제번호 :
		<%=selectProjectNumber%>
		<br> 사업비예산 신청액 :
		<%=bg.getAmount()%>
		<br> 증거파일 :
		<%=ev.getFile()%>
		<br> 사업비 총 집행금액 :
		<%=ev.getAmount()%>

	</form>
</BODY>
</HTML>