<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>사업비증거자료 beans</TITLE>
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

		<h3>사업비 증거자료 입력 beans</h3>
		선택된 과제번호 :
		<%=selectProjectNumber%>
		<br> 사업비예산 신청액 :
		<%=bg.getAmount()%>
		<br>
		<input type="file" name="upfile" size="20">(파일의 용량 제한 : 20M) <br>
		사업비 총 집행금액 : <input type=text name="evidence_amount" value="" size=20>
		<input type=button value="사업비 집행금액 입력" onClick="evidenceInputCheck()"><br>

	</form>
</BODY>
</HTML>