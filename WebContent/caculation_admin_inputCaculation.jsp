<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>����������Է� beans</TITLE>
</HEAD>
<script language=JavaScript src="js/caculation.js"></script>

<BODY>
	<%
		request.setCharacterEncoding("UTF-8");
		String strProjectNumber = request
				.getParameter("select_project_number");
		int selectProjectNumber = Integer.parseInt(strProjectNumber);
		
		BusinessCaculationControl bc = new BusinessCaculationControl();

		Budget bbbb = new Budget(selectProjectNumber, 100000);
		bc.addBudget(bbbb);

		Budget bg = bc.selectBudget(selectProjectNumber);
		Evidence ee = new Evidence(selectProjectNumber, 10000,"��������.zip");
		bc.addEvidence(ee);
		Evidence ev = bc.selectEvidence(selectProjectNumber);
	%>
	<form name=caculationInput method=post action="caculation.js">
		<h3>����� ���� ��� beans</h3>
		���õ� ������ȣ :
		<%=selectProjectNumber%>
		<br> ����񿹻� ��û�� :
		<%=bg.getAmount()%>
		<br> ����� �� ����ݾ� :
		<%=ev.getAmount()%>
		<br> ������ ���� <input type=checkbox name="verification" value=������>
		<br> ������ ���� : <%=ev.getFile() %>
		
		<input type=button value="����" onClick="caculationInputCheck()"><br>
		<input type=hidden name="select_project_number"
			value=<%=selectProjectNumber%>>
	</form>
</BODY>
</HTML>