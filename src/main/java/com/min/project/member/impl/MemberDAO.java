package com.min.project.member.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.min.project.common.JDBCUtil;
import com.min.project.member.MemberVO;

@Repository
public class MemberDAO  {

	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String MEMBER_GET = "select * from member where id =? and password=?";
	
	public MemberVO getMember(MemberVO vo) {
		MemberVO member = null;
		try {
			System.out.println("==> JDBC로 getUser() 기능처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("ID"));
				member.setPassword(rs.getString("PASSWORD"));
				member.setName(rs.getString("NAME"));
				member.setRole(rs.getString("ROLE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs,stmt, conn);
		}
		return member;
	}
}
