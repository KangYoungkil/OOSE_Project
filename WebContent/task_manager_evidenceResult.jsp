<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>
<%@ page import="java.util.Enumeration"%>

<HTML>
<HEAD>
<TITLE>����������Է� �Ϸ� beans</TITLE>
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
		<h3>����� �����Է� �Ϸ� beans</h3>
		���õ� ������ȣ :
		<%=selectProjectNumber%>
		<br> ����񿹻� ��û�� :
		<%=bg.getAmount()%>
		<br> �������� :
		<%=ev.getFile()%>
		<br> ����� �� ����ݾ� :
		<%=ev.getAmount()%>

	</form>
</BODY>
</HTML>