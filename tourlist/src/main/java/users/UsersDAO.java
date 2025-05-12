package users;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import posts.PostsDTO;


public class UsersDAO {
	public Connection getConnection() throws Exception{
		//connection pool을 활용한 DB연동
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/guo7404");
		Connection con = ds.getConnection();
		return con;
	}
	public ArrayList<PostsDTO> list(){
		String sql = "SELECT * FROM MEMBER";
		ArrayList<PostsDTO> dtos = new ArrayList<PostsDTO>();
		try(Connection con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);			
			) { //ResultSet에 들어있는 레코드를 추출하여 ArrayList에 추가
			while (rs.next()){
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				PostsDTO dto = new PostsDTO(id,name,pwd);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dtos;
	}

}
