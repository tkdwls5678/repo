package ch10;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GuestbookDAO {
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"jwbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<Guestbook> getAll() throws Exception {
		Connection conn = open();
		List<Guestbook> guestbookList = new ArrayList<>();
		
		String sql = "select aid, title, PARSEDATETIME(date,'yyyy-MM-dd hh:mm:ss'), content as date from guestbook";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try(conn; pstmt; rs) {
			while(rs.next()) {
				Guestbook n = new Guestbook();
				n.setAid(rs.getInt("aid"));
				n.setTitle(rs.getString("title"));
				n.setDate(rs.getString("date"));
				n.setContent(rs.getString("content"));
				guestbookList.add(n);
			}
			return guestbookList;
		}
	}
	public Guestbook getGuestbook(int aid) throws SQLException {
		Connection conn = open();
		Guestbook n = new Guestbook();
		String sql = "select aid, title, pers, PARSEDATETIME(date,'yyyy-MM-dd hh:mm:ss') as date, email, content from news where aid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, aid);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		try(conn; pstmt; rs) {
			n.setAid(rs.getInt("aid"));
			n.setTitle(rs.getString("title"));
			n.setPers(rs.getString("pers"));
			n.setDate(rs.getString("date"));
			n.setEmail(rs.getString("email"));
			pstmt.executeQuery();
			return n;
		}
	}
	
	public void addGuestbook(Guestbook n) throws Exception {
		Connection conn = open();
		String sql = "insert into guestbook(title,pers,date,content) values(?,?,CURRENT_TIMESTAMP(),?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setString(1, n.getTitle());
			pstmt.setString(2, n.getPers());
			pstmt.setString(3, n.getEmail());
			pstmt.setString(4, n.getContent());
			pstmt.executeUpdate();
		}
	}
	
	public void delGuestbook(int aid) throws SQLException {
		Connection conn = open();
		String sql = "delete from news where aid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setInt(1, aid);
			if(pstmt.executeUpdate() == 0) {
				throw new SQLException("DB에러");
			}
		}
	}
	}
