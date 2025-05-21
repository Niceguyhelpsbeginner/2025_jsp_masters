package comments;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentsDAO {
    public Connection getConnection() throws Exception {
        //connection pool을 활용한 DB연동
        Context initCtx = new InitialContext();
        Context envCtx = (Context)initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/guo7404");
        Connection con = ds.getConnection();
        return con;
    }
    
    // 특정 게시글의 댓글 목록 조회
    public ArrayList<CommentsDTO> getCommentsByPost(String postnum) {
        String sql = "SELECT commentnum, commented_post, commenter, content, created_at FROM Comments WHERE commented_post = '" + postnum + "' ORDER BY created_at DESC";
        ArrayList<CommentsDTO> dtos = new ArrayList<CommentsDTO>();
        try(Connection con = getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);            
            ) {
            while (rs.next()) {
                String commentnum = rs.getString("commentnum");
                String commented_post = rs.getString("commented_post");
                String commenter = rs.getString("commenter");
                String content = rs.getString("content");
                String created_at = rs.getString("created_at");
                
                CommentsDTO dto = new CommentsDTO(commentnum, commented_post, commenter, content, created_at);
                dtos.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dtos;
    }
    
    // 댓글 작성
    public boolean insertComment(CommentsDTO dto) {
        String sql = "INSERT INTO Comments (commented_post, commenter, content, created_at) VALUES ('" 
            + dto.getCommented_post() + "', '" 
            + dto.getCommenter() + "', '" 
            + dto.getContent() + "', NOW())";
        try(Connection con = getConnection();
            Statement st = con.createStatement();            
            ) {
            return st.executeUpdate(sql) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // 댓글 삭제
    public boolean deleteComment(String commentnum) {
        String sql = "DELETE FROM Comments WHERE commentnum = '" + commentnum + "'";
        try(Connection con = getConnection();
            Statement st = con.createStatement();            
            ) {
            return st.executeUpdate(sql) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // 댓글 수정
    public boolean updateComment(CommentsDTO dto) {
        String sql = "UPDATE Comments SET content = '" + dto.getContent() 
            + "' WHERE commentnum = '" + dto.getCommentnum() + "'";
        try(Connection con = getConnection();
            Statement st = con.createStatement();            
            ) {
            return st.executeUpdate(sql) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
