package com.ch7.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ch7.common.Conn;
import com.ch7.model.ClassInfo;


public class ClassF {
	Conn conn=new Conn();
	/**
	 * 获取博文分类列表
	 * @return
	 * @throws SQLException
	 */
	public List<ClassInfo> getList()throws SQLException{
		List<ClassInfo> list=new ArrayList<ClassInfo>();
		String sql="select * from Classf order by Sort asc";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			ClassInfo info=new ClassInfo();
			info.setId(rs.getInt("Id"));
			info.setName(rs.getString("Name"));
			info.setSort(rs.getInt("Sort"));
			list.add(info);
	}
		conn.close();
		return list;
	}
	/**
	 * 获取单条分类系你想
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public ClassInfo getClassInfo(int id)throws SQLException{
		ClassInfo info=new ClassInfo();
		String sql="select * from Classf c where id="+id+"";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			info.setId(rs.getInt("Id"));
			info.setName(rs.getString("Name"));
			info.setSort(rs.getInt("Sort"));
	}
		conn.close();
		return info;
	}
	/**
	 * 博文分类插入
	 * @param info
	 * @return
	 */
	public int insert(ClassInfo info){
		String sql="insert into Classf(Name,Sort) values";
		sql=sql+"('"+info.getName()+"','"+info.getSort()+"')";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 博文分类更新
	 * @param info
	 * @return
	 */
	public int update(ClassInfo info){
		String sql="update Classf set "+" Name='"+info.getName()+"',Sort= '"+info.getSort()+"' where id="+info.getId()+"";
		int result=0;
		result=conn.executeUpdate(sql);
		return result;
		
	}
	public int delete(int id){
		String sql="delete from Classf where id="+id+"";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	
}
