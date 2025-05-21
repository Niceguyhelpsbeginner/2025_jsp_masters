package users;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UsersDAO {
	public Connection getConnection() throws Exception {
		//connection pool을 활용한 DB연동
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/guo7404");
		Connection con = ds.getConnection();
		return con;
	}
	
	// 사용자 목록 조회
	public ArrayList<UsersDTO> list() {
		String sql = "SELECT usernum, username, address, pwd, nickname FROM Users";
		ArrayList<UsersDTO> dtos = new ArrayList<UsersDTO>();
		try(Connection con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);			
			) {
			while (rs.next()) {
				String usernum = rs.getString("usernum");
				String username = rs.getString("username");
				String address = rs.getString("address");
				String pwd = rs.getString("pwd");
				String nickname = rs.getString("nickname");
				
				UsersDTO dto = new UsersDTO(usernum, username, address, pwd, nickname);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	// 사용자 정보 조회
	public UsersDTO getUser(String usernum) {
		String sql = "SELECT usernum, username, address, pwd, nickname FROM Users WHERE usernum = '" + usernum + "'";
		UsersDTO dto = null;
		try(Connection con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);			
			) {
			if (rs.next()) {
				String username = rs.getString("username");
				String address = rs.getString("address");
				String pwd = rs.getString("pwd");
				String nickname = rs.getString("nickname");
				
				dto = new UsersDTO(usernum, username, address, pwd, nickname);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	// 사용자 로그인 확인
	public boolean checkLogin(String username, String pwd) {
		String sql = "SELECT * FROM Users WHERE username = '" + username + "' AND pwd = '" + pwd + "'";
		try(Connection con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);			
			) {
			return rs.next(); // 결과가 있으면 true, 없으면 false 반환
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
