package posts;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
				String image_path = rs.getString("image_path");
				String country = rs.getString("country");
				
				PostsDTO dto = new PostsDTO(postnum, title, content, created_at, views,like_count, author_id, image_path, country);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dtos;
	}
	public void write_post(PostsDTO dto) throws Exception {
		Connection con;
		try {
			con = getConnection();
	        String sql = "INSERT INTO Comments(title,content,author_id,country) VALUES(?, ?, ?, ?)" ;
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, dto.getTitle());
	        pstmt.setString(2, dto.getContent());
	        pstmt.setString(3, dto.getAuthor_id());
	        pstmt.setString(4, dto.getCountry());
	        int updated_query = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

        
        
    }
}
