
<%@page import="task_registration.BudgetList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="task_caculate.*"
	import="java.util.ArrayList" import="task_registration.*"%>

<HTML>
<HEAD>
<TITLE>����� ���� ��ȸ beans</TITLE>
</HEAD>
<script language=JavaScript src="js/caculation.js"></script>
s
<BODY>

	<%
		ProjectList pl = ProjectList.getInstance();

		pl.registerProject(new Project("�߰��򰡿Ϸ�", 1));
		pl.registerProject(new Project("�߰��򰡿Ϸ�", 2));
		pl.registerProject(new Project("�߰��򰡿Ϸ�", 3));
		pl.registerProject(new Project("�߰��򰡿Ϸ�", 4));
		pl.registerProject(new Project("�߰��򰡿Ϸ�", 5));
		pl.registerProject(new Project("�߰��򰡿Ϸ�", 6));
		ArrayList<Project> prList = pl.getStatusProjectList("�߰��򰡿Ϸ�");
	%>

	<form name=selectProject method=post action="caculation.js">
		<table>
			<tr>
				<td>��ȣ</td>
				<td>�����</td>
				<td>����</td>
				<td>����</td>
				<td>�о�</td>
				<td>����å����</td>
				<td>��������</td>
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
						����</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
</BODY>
</HTML>
