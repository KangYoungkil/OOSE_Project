<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_notice.*"
	import="task_registration.*" import ="java.util.Date"%>
<%@ page import="java.util.Enumeration"%>

<HTML>
<HEAD>
<TITLE>���� control</TITLE>
</HEAD>
<script language=JavaScript src="js/caculation.js"></script>
<BODY onload="caculationControlCheck()">
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<%
		String strProjectNumber = request
				.getParameter("select_project_number");
		String strVerification = request.getParameter("verification");

		boolean verification = false;
		if (strVerification == null)
			verification = false;
		else
			verification = true;
		int selectProjectNumber = Integer.parseInt(strProjectNumber);
		BusinessCaculationControl bc = new BusinessCaculationControl();
		Evidence e = bc.selectEvidence(selectProjectNumber);
		Caculate c = new Caculate(e.getProjectNumber() , e.getAmount(), verification);
		if(verification==false)
			c.setAmount(0);
		bc.addCaculate(c);
		int amount = bc.selectProjectVerificationAmount(selectProjectNumber);
		Clawback cb = new Clawback(c.getProjectNumber(),amount);
		bc.addClawbakc(cb);
		bc.addNotice(new Notice(new Date(),"���������",strProjectNumber+"��ȣ ��������� �Ϸ�", 
				"aa@a.com","����� ���� �Ϸ�File"));
		
		// ���������Ʈ�� -> �����������·� ����
	%>
	<form name=caculationControl method=post action="evidence.js">
		<input type=hidden name="select_project_number"
			value=<%=selectProjectNumber%>>
	</form>
</BODY>
</HTML>