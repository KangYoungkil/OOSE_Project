<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>����������ڷ� beans</TITLE>
</HEAD>
<script language=JavaScript src="js/evidence.js" charset="euc-kr"></script>

<BODY>
	<%
	/*
		request.setCharacterEncoding("UTF-8");
		String strProjectNumber = request
				.getParameter("select_project_number");
		int selectProjectNumber = Integer.parseInt(strProjectNumber);
		*/
		int selectProjectNumber = 1;
		Budget bbbb = new Budget(selectProjectNumber, 100000);
		BusinessCaculationControl bc = new BusinessCaculationControl();
		bc.addBudget(bbbb);
		Budget bg = bc.selectBudget(selectProjectNumber);
	%>
	<form name=evidenceInput method=post action="evidence.js">
		<input type=hidden name="select_project_number"
			value=<%=selectProjectNumber%>>

		<h3>����� �����ڷ� �Է� beans</h3>
		���õ� ������ȣ :
		<%=selectProjectNumber%>
		<br> ����񿹻� ��û�� :
		<%=bg.getAmount()%>
		<br>
		<input type="file" name="upfile" size="20">(������ �뷮 ���� : 20M) <br>
		����� �� ����ݾ� : <input type=text name="evidence_amount" value="" size=20>
		<input type=button value="����� ����ݾ� �Է�" onClick="evidenceInputCheck()"><br>

	</form>
</BODY>
</HTML>