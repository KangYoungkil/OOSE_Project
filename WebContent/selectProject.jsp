
<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="java.util.ArrayList" import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>사업비 정산 조회 beans</TITLE>
</HEAD>
<script language=JavaScript src="js/caculation.js"></script>
s
<BODY>

	<%
		ProjectList pl = ProjectList.getInstance();

		pl.registerProject(new Project("중간평가완료", 1));
		pl.registerProject(new Project("중간평가완료", 2));
		pl.registerProject(new Project("중간평가완료", 3));
		pl.registerProject(new Project("중간평가완료", 4));
		pl.registerProject(new Project("중간평가완료", 5));
		pl.registerProject(new Project("중간평가완료", 6));
		ArrayList<Project> prList = pl.getStatusProjectList("중간평가완료");
	%>

	<form name=selectProject method=post action="caculation.js">
		<table>
			<tr>
				<td>번호</td>
				<td>기관명</td>
				<td>상태</td>
				<td>종류</td>
				<td>분야</td>
				<td>과제책임자</td>
				<td>과제선택</td>
			</tr>
			<%
				for (int i = 0; i < prList.size(); i++) {
			%>
			<tr>
				<td><%=prList.get(i).getProjectNumber()%></td>
				<td><%=prList.get(i).getOrganName()%></td>
				<td><%=prList.get(i).getStatus()%></td>
				<td><%=prList.get(i).getArea()%></td>
				<td><%=prList.get(i).getLeaderId()%></td>
				<td><a
					href="caculation_admin_inputCaculation.jsp?select_project_number=<%=prList.get(i).getProjectNumber()%>">
						선택</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
</BODY>
</HTML>
