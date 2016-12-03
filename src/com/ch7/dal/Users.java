package com.ch7.dal;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ch7.common.Conn;
import com.ch7.model.UsersInfo;

public class Users {
	Conn conn=new Conn();
	public List<UsersInfo>getList() throws SQLException{
		List<UsersInfo> list=new ArrayList<UsersInfo>();
		String sql="select * from Users order by username asc";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			UsersInfo info=new UsersInfo();
			info.setUsername(rs.getString("UserName"));
			info.setPassword(rs.getString("Password"));
			info.setEmail(rs.getString("Email"));
			info.setPower(rs.getString("Power"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	public boolean isExist(String username,String password)throws SQLException{
		boolean result=false;
		UsersInfo info=new UsersInfo();
		String sql="select * from Users u where UserName='"+username+"'and Password='"+password+"'";
		System.out.println(sql);
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()){
			info.setUsername(rs.getString("UserName"));
			info.setPassword(rs.getString("Password"));
			info.setEmail(rs.getString("Email"));
			info.setPower(rs.getString("Power"));
			result=true;
		}
		conn.close();
		return result;
	}
}
