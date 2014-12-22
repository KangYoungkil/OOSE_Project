<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>
<%@ page import="java.util.Enumeration"%>

<HTML>
<HEAD>
<TITLE>사업비정산 완료 beans</TITLE>
</HEAD>
<script language=JavaScript src="js/evidence.js"></script>

<BODY>
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<h3>사업비 정산완료</h3>
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
		<h3>사업비 증거자료 입력 beans</h3>
		선택된 과제번호 :
		<%=selectProjectNumber%>
		<br> 사업비예산 신청액 :
		<%=bg.getAmount()%>
		<br> 사업비 총 집행금액 :
		<%=ev.getAmount()%>
		<%
			if (cu.isVerification() == true) {
		%>
		인정
		<%
			} else {
		%>
		불인정
		<%
			}
		%><br> 환수금액 :
		<%=ca.getAmount()%>
		<br> 이자율 :
		<%=ca.getRate()%>
		% <br>
	</form>
</BODY>
</HTML>