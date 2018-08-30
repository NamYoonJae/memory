package hos.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TabDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs =null;
	
	public TabDAO() {
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	//회원가입시 탭생성
		public int tabCreate(String id) {
			System.out.println("탭 생성 시작");
			int tabSuccess=0;
			String sql="INSERT INTO tab_tb VALUES('1','기본탭',?)";
			//이거하기전에 tab_tb 삭제하고 기본키 안주고 다시만들어서 해야함
			try {
				ps =conn.prepareStatement(sql);
				ps.setString(1, id);
				tabSuccess = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return 0;
			}finally {
				try {
					ps.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			System.out.println("탭 생성시에 반환할 success값 : "+tabSuccess);
		return tabSuccess;
			
		}
	
}
