package posts;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class PostsDAO {
	public Connection getConnection() throws Exception{
		//connection pool을 활용한 DB연동
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/guo7404");
		Connection con = ds.getConnection();
		return con;
	}
	public ArrayList<PostsDTO> list(){
		String sql = "SELECT postnum, title, content, created_at, views,like_count, author_id, country FROM Posts";
		ArrayList<PostsDTO> dtos = new ArrayList<PostsDTO>();
		try(Connection con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);			
			) { //ResultSet에 들어있는 레코드를 추출하여 ArrayList에 추가
			while (rs.next()){
				String postnum = rs.getString("postnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String created_at = rs.getString("created_at");
				String views = rs.getString("views");
				String like_count = rs.getString("like_count");
				String author_id = rs.getString("author_id");
				String country = rs.getString("country");
				
				PostsDTO dto = new PostsDTO(postnum, title, content, created_at, views,like_count, author_id, country);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dtos;
	}

}
