package cn.itcast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itcast.dao.UserDao;
import cn.itcast.domain.Category;
import cn.itcast.domain.User;
import cn.itcast.exception.DaoException;
import cn.itcast.utils.JdbcUtils;

public class UserDaoImpl implements UserDao{

	public void add(User user){
		try {
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "insert into user(id,username,password,cellphone,email,address) values(?,?,?,?,?,?)";
			Object params[] = {user.getId(),user.getUsername(),user.getPassword(),user.getCellphone(),user.getEmail(),user.getAddress()};
			runner.update(conn, sql, params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	
	public void update(User user){
		try {
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "update user set nickname=?,cellphone=?,address=?,username=?,password=? where id=?";
			Object params[] = {user.getNickname(),user.getCellphone(),user.getAddress(),user.getUsername(),user.getPassword(),user.getId()};
			runner.update(conn, sql, params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	
	public User find(String id){
		try {
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from user where id=?";
			return (User) runner.query(conn, sql, id, new BeanHandler(User.class));
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	
	public User find(String username,String password){
		try {
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from user where username=? and password=?";
			return (User) runner.query(conn, sql, new Object[]{username,password}, new BeanHandler(User.class));
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	
	//新增判断用户是否已存在方法，可能出错
	public boolean find2(String username){
		try {
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from user where username=?";
			List islist = (List) runner.query(conn, sql,username, new BeanListHandler(User.class));
			
			if(islist.size() != 0){
				return true;
			}
			
			return false;
			
		} catch (Exception e) {
			//运行时异常
			throw new DaoException(e);
		}
	}
}
