package task_registration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;


public class DAOproject {
	private Connection connection;
	private static int projectTotalCnt; // 프로젝트 총 갯수(과제번호 함수짜기 위해서 필요)
	
	//DBconnection에서 DB 주소 가져옴
	public DAOproject()
	{
		DBconnection dbcon = new DBconnection();
		connection = dbcon.getConnection();
	}
	
	/**
	 * 시스템이 시작될 때 DB에 있는 모든 과제 목록을
	 * 싱글턴클래스 ProjectListBean에 모두 적재할것이다.
	 * 그 때 호출되는 메소드.
	 * @return project테이블에 있는 모든 사용자 목록
	 * 과제1개당 여러명의 연구원이 있음 User 디비 들어가야함
	 */
	
	public ArrayList<Project> loadList()
	{
		ArrayList<Project> retProjectList = new ArrayList<Project>();
		try
		{
			String sqlQuery = "SELECT * FROM project;";
			PreparedStatement pstmt = connection.prepareStatement(sqlQuery);
			ResultSet result = pstmt.executeQuery();
			while(result.next())
			{
				String status = result.getString("status");
				String type = result.getString("type");
				String area = result.getString("area");
				int projectNumber = result.getInt("projectNumber");
				String leaderId = result.getString("leaderId");
				String leaderName = result.getString("leaderName");
				String organId = result.getString("organId");
				String organName = result.getString("organName");
				Date registerDate = new Date(result.getDate("registerDate").getTime());
				int agreeYear = result.getInt("agreeYear");
				String fileName = result.getString("fileName");
				
				//User 정보에서 해당 과제에 대한 참여연구원 아이디 가져오기
				ArrayList<String> userIdList = new ArrayList<String>();
				//프로젝트 번호로 ID 가져오기
				String sqlQuery2 = "SELECT id FROM project_user where projectNumber ='"+projectNumber+"';";
				PreparedStatement pstmt2 = connection.prepareStatement(sqlQuery2);
				ResultSet result2 = pstmt2.executeQuery();
				while(result2.next())
				{
					String id = result2.getString("id");
					userIdList.add(id);
				}
				result2.close();
				pstmt2.close();
				
				retProjectList.add(new Project(status, type, area, projectNumber, leaderId, leaderName, organId, organName, registerDate, agreeYear, fileName, userIdList ));
			}
			result.close();
			pstmt.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return retProjectList;
	}
	
	/**
	 * -수정필요-
	 * DB에 통으로 다 save한다 사실 이렇게 되면
	 * mysql이 중복잡아내서 오류를 엄청 뱉어낼것이다.
	 * saveList가 아니라 updateList로 수정해야할 필요가 있다.
	 * @param saveList -> DB에 저장할 사용자 목록전체이다.
	 * @return 저장성공여부
	 */
	public boolean saveList(ArrayList<Project> saveList)
	{
		StringBuilder queryBuilder = new StringBuilder();
		StringBuilder queryProjectUser = new StringBuilder();
		try
		{
			for(Project x : saveList)
			{
				queryBuilder.delete(0, queryBuilder.length());
				queryBuilder.append("INSERT INTO project (status, type, area, projectNumber, leaderId, leaderName, organId, organName, registerDate, agreeYear, fileName) ");
				queryBuilder.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");
				queryBuilder.append("ON DUPLICATE KEY UPDATE " );
				queryBuilder.append("status = ?, type = ?, area = ?, projectNumber = ?, leaderId = ?, leaderName = ?, ");
				queryBuilder.append("organId = ?, organName = ?, registerDate = ?, agreeYear = ?, fileName = ?;");
				
				String query = queryBuilder.toString();
				
				PreparedStatement pstmt = connection.prepareStatement(query);
				
				pstmt.setString(1, x.getStatus());
				pstmt.setString(2, x.getType());
				pstmt.setString(3, x.getArea());
				pstmt.setInt(4, x.getProjectNumber());
				pstmt.setString(5, x.getLeaderId());
				pstmt.setString(6, x.getLeaderName());
				pstmt.setString(7, x.getOrganId());
				pstmt.setString(8, x.getOrganName());
				pstmt.setDate(9, new java.sql.Date(x.getRegisterDate().getTime()));
				pstmt.setInt(10, x.getAgreeYear());
				pstmt.setString(11, x.getFileName());
			
				/* 수정 */
				pstmt.setString(12, x.getStatus());
				pstmt.setString(13, x.getType());
				pstmt.setString(14, x.getArea());
				pstmt.setInt(15, x.getProjectNumber());
				pstmt.setString(16, x.getLeaderId());
				pstmt.setString(17, x.getLeaderName());
				pstmt.setString(18, x.getOrganId());
				pstmt.setString(19, x.getOrganName());
				pstmt.setDate(20, new java.sql.Date(x.getRegisterDate().getTime()));
				pstmt.setInt(21, x.getAgreeYear());
				pstmt.setString(22, x.getFileName());
				
				//사용자와 과제 묶기
				for(String t : x.getUserIdList())
				{
					queryProjectUser.delete(0, queryProjectUser.length());
					queryBuilder.append("INSERT INTO project_user (projectNumber, id) ");
					queryBuilder.append("VALUES (?, ?) ");
					queryBuilder.append("ON DUPLICATE KEY UPDATE " );
					queryBuilder.append("projectNumber = ?, id = ?;");
					
					String queryP_U = queryProjectUser.toString();
					
					PreparedStatement pstmtP_U = connection.prepareStatement(queryP_U);
					
					pstmtP_U.setInt(1, x.getProjectNumber());
					pstmtP_U.setString(2, t);
					
					/* 수정 */
					pstmtP_U.setInt(3, x.getProjectNumber());
					pstmtP_U.setString(4, t);
					
					pstmtP_U.executeUpdate();
					pstmtP_U.close();
				}
				
				pstmt.executeUpdate();
				pstmt.close();	
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return true;
	}
	
	//전체 과제 갯수 파악 // 과제 번호 등록시 이건 조금 있다가 함

	
}
