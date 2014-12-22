package task_registration;

import java.util.ArrayList;
/**
 * 우리가 그린 Class 다이어그램에서 목록 Entity에 해당하는 클래스 UML에서 나타낸 함수들을 여기서 만들면된다.
 * 
 * @author JM
 * 
 */
public class ProjectList {
	private ArrayList<Project> projectList;

	private static class ProjectListHolder {
		static final ProjectList uniqueInstance = new ProjectList();
	}

	private ProjectList() {
		projectList = new ArrayList<Project>();
		//DAOproject dao = new DAOproject();
		//projectList = dao.loadList();
	}

	public static ProjectList getInstance() {
		return ProjectListHolder.uniqueInstance;
	}
	////////////////////////////////
	public boolean registerProject(Project project)
	{
		projectList.add(project);
		return true;
	}
	public ArrayList<Project> getAllProjectList()
	{
		return projectList;
	}
	
	//상태별 과제
	public ArrayList<Project> getStatusProjectList(String state)
	{
		ArrayList<Project> statusProjectList = new ArrayList<Project>();
		
		for(Project p : projectList)
		{
			//입력한 상태와 같은 리스트
			if(p.getStatus().equals(state))
			{
				statusProjectList.add(p);
			}
		}
		return statusProjectList;
	}
	
	//기간별 과제
	public ArrayList<Project> getTypeProjectList(String type)
	{
		ArrayList<Project> typeProjectList = new ArrayList<Project>();
		
		for(Project p : projectList)
		{
			//입력한 기간(단기/중장기)와 같은 리스트
			if(p.getType().equals(type))
			{
				typeProjectList.add(p);
			}
		}
		return typeProjectList;
	}
	
	//과제종류별 과제
	public ArrayList<Project> getAreaProjectList(String area)
	{
		ArrayList<Project> areaProjectList = new ArrayList<Project>();
		
		for(Project p : projectList)
		{
			//입력한 기간(단기/중장기)와 같은 리스트
			if(p.getArea().equals(area))
			{
				areaProjectList.add(p);
			}
		}
		return areaProjectList;
	}
	
	//과제담당자 아이디로 과제 찾기
	public Project getProjectSearchID(String id)
	{
		for(Project p : projectList)
		{
			if(p.getLeaderId().equals(id))
				return p;
		}
		return null;
	}
	
	//해당 과제 번호의 과제정보
	public Project getProjectSearchNumber(int num)
	{
		for(Project p : projectList)
		{
			if(p.getProjectNumber() == num)
				return p;
		}
		return null;
	}
	
	public boolean setChangeProjectStatus(int num, String state)
	{
		for(Project p : projectList)
		{
			if(p.getProjectNumber() == num)
			{
				p.setStatus(state);
				return true;
			}
		}
		return false;
	}
}