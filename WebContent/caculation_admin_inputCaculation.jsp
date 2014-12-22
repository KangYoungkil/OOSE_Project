<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>사업비정산입력 beans</TITLE>
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
		Evidence ee = new Evidence(selectProjectNumber, 10000,"증거파일.zip");
		bc.addEvidence(ee);
		Evidence ev = bc.selectEvidence(selectProjectNumber);
	%>
	<form name=caculationInput method=post action="caculation.js">
		<h3>사업비 정산 결과 beans</h3>
		선택된 과제번호 :
		<%=selectProjectNumber%>
		<br> 사업비예산 신청액 :
		<%=bg.getAmount()%>
		<br> 사업비 총 집행금액 :
		<%=ev.getAmount()%>
		<br> 실인정 여부 <input type=checkbox name="verification" value=실인정>
		<br> 영수증 파일 : <%=ev.getFile() %>
		
		<input type=button value="정산" onClick="caculationInputCheck()"><br>
		<input type=hidden name="select_project_number"
			value=<%=selectProjectNumber%>>
	</form>
</BODY>
</HTML>