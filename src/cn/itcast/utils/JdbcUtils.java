package cn.itcast.utils;

import java.sql.Connection;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
//操作数据库连接池
	
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
	private static DataSource ds;
	static{
		ds = new ComboPooledDataSource();
	}
	public static DataSource getDataSource(){
		return ds;
	}
	//一个获取连接的方法
	public static Connection getConnection(){
		try {
			//首先查看当前线程上有无绑定
			Connection conn = tl.get();
			if(conn == null){
				//如果没有绑定，则找数据库连接池要一个连接
				conn = ds.getConnection();
				conn.setAutoCommit(false);
			}
			//返回之前，把当前连接绑定到当前线程上去
			tl.set(conn);
			return conn;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	//开启事务
	public static void StartTransaction(){
		try {
			//获取连接
			Connection conn = getConnection();
			//把事务的自动提交行为false掉
			conn.setAutoCommit(false);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public static void commitTransaction(){
		try {
			//获取连接
			Connection conn = getConnection();
			if(conn != null){
				conn.commit();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public static void closeConn(){
		Connection conn = null;
		try {
			//获取连接
			conn = getConnection();
			if(conn != null){
				conn.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
				tl.remove();
		}
	}
}









