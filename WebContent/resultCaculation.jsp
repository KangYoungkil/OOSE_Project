<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>
<%@ page import="java.util.Enumeration"%>

<HTML>
<HEAD>
<TITLE>��������� �Ϸ� beans</TITLE>
</HEAD>
<script language=JavaScript src="js/evidence.js"></script>

<BODY>
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<h3>����� ����Ϸ�</h3>
	<%
		String strProjectNumber;
		int selectProjectNumber = 0;
		BusinessCaculationControl bc = new BusinessCaculationControl();
		Budget bg = new Budget(0,0);
		Evidence ev = new Evidence(0,0);
		Clawback ca = new Clawback(0,0);
		Caculate cu = new Caculate(0,0,false);
		try {
			strProjectNumber = request
					.getParameter("select_project_number");
			selectProjectNumber = Integer.parseInt(strProjectNumber);
			bg = bc.selectBudget(selectProjectNumber);
			ev = bc.selectEvidence(selectProjectNumber);
			ca = bc.selectClawback(selectProjectNumber);
			cu = bc.selectCaculate(selectProjectNumber);

		} catch (Exception e) {
			response.sendRedirect("error_caculation_searcg.jsp");
		}
	%>


	<form name=caculateResult method=post action="caculation.js">
		<h3>����� �����ڷ� �Է� beans</h3>
		���õ� ������ȣ :
		<%=selectProjectNumber%>
		<br> ����񿹻� ��û�� :
		<%=bg.getAmount()%>
		<br> ����� �� ����ݾ� :
		<%=ev.getAmount()%>
		<%
			if (cu.isVerification() == true) {
		%>
		����
		<%
			} else {
		%>
		������
		<%
			}
		%><br> ȯ���ݾ� :
		<%=ca.getAmount()%>
		<br> ������ :
		<%=ca.getRate()%>
		% <br>
	</form>
</BODY>
</HTML>