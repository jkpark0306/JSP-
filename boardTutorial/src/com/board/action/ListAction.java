package com.board.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.board.beans.Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.controller.CommandAction;

public class ListAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		try {
			Connection conn = null;

			ResultSet rs = null;

			String driverName = "com.mysql.cj.jdbc.Driver"; //데이터베이스에 접속하기위한 드라이버를 로드합니다.

			String url = "jdbc:mysql://125.141.59.79:3306/ASM_DB?autoReconnect=true&useSSL=false"; //접속 URL정보와 포트번호(oracle포트), sid(oracle버전)

			String id = "jkpark";

			String pw = "wlrb1234@";

			Class.forName(driverName);

			conn = DriverManager.getConnection(url, id, pw);

			Statement stmt = conn.createStatement();

			String sql = "select * from BOARD order by IDX desc";

			rs = stmt.executeQuery(sql);

			ArrayList<Board> articleList = new ArrayList<Board>();

			while (rs.next()) {

				Board article = new Board();

				article.setIdx(rs.getInt("IDX"));

				article.setTitle(rs.getString("title"));

				article.setWriter(rs.getString("writer"));

				article.setCount(rs.getInt("count"));

				articleList.add(article);
			}
			
			request.setAttribute("articleList",articleList);

			conn.close();

		} catch (Exception e) {

			System.err.println("Mysql Database connection Something Problem. <hr>");

			System.err.println(e.getMessage());

			e.printStackTrace();
		}
	
		return "list.jsp";
	}
	
}