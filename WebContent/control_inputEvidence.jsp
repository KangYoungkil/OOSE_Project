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
<BODY onload="evidenceControlCheck()">
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<%
		String strProjectNumber = request
				.getParameter("select_project_number");
		String strEvidenceAmount = request.getParameter("evidence_amount");
		String strEvidenceFile = "";
		strEvidenceFile = request.getParameter("upfile");
		int selectProjectNumber = Integer.parseInt(strProjectNumber);
		int evidenceAmount = Integer.parseInt(strEvidenceAmount);
		BusinessCaculationControl bc = new BusinessCaculationControl();
		Budget bg = bc.selectBudget(selectProjectNumber);
		Evidence ev = new Evidence(selectProjectNumber, evidenceAmount,strEvidenceFile);
		bc.addEvidence(ev);
		
		// ���������Ʈ�� -> ���� ���� �����ڷ�������·� ���� 
	%>
	<form name=evidenceControl method=post action="evidence.js">
		<input type=hidden name="select_project_number"
			value=<%=selectProjectNumber%>>
	</form>
</BODY>
</HTML>