package cn.itcast.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.dao.ProductDao;
import cn.itcast.domain.Product;
import cn.itcast.domain.QueryResult;
import cn.itcast.utils.JdbcUtils;

public class ProductDaoImpl implements ProductDao {

	public void add(Product p){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "insert into product(id,name,price,image,description,category_id) values(?,?,?,?,?,?)";
			Object params[] = {p.getId(),p.getName(),p.getPrice(),p.getImage(),p.getDescription(),p.getCategory().getId()};
			runner.update(conn, sql, params);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public Product find(String id){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from product where id=?";
			return (Product) runner.query(conn,sql, id, new  BeanHandler(Product.class));
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public void delete(String id){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "delete from product where id=?";
			runner.update(conn, sql, id);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	//String where =  "where category_id=?"
	/*
	 * 用户带where条件过来，则该方法返回分类下面的分页数
	 * 如果没带where条件，则返回所有书的分页数据
	 * 
	 * where条件的格式：String where =  "where category_id=?"
	 * 
	 */
	
	//与 QueryResult临时类关联，私有，没必要对外暴露
	private List<Product> getPageDate(int startindex,int pagesize,String where,Object param){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			if(where==null || where.trim().equals("")){
				//则返回所有书的分页数据
				String sql = "select * from product limit ?,?";
				Object params[] = {startindex,pagesize};
				return (List<Product>) runner.query(conn, sql, params, new BeanListHandler(Product.class));
			}else{
				String sql = "select * from product "+ where + " limit ?,?";
				Object params[] = {param,startindex,pagesize};
				return (List<Product>) runner.query(conn, sql, params, new BeanListHandler(Product.class));
			}
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	//私有，没必要对外暴露
	private int getPageTotalRecord(String where,Object param){
		
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			if(where==null || where.trim().equals("")){
				String sql = "select count(*) from product";
				return ((Long)runner.query(conn, sql, new ScalarHandler())).intValue();
			}else{
				String sql = "select count(*) from product " + where;
				return ((Long)runner.query(conn, sql, param,new ScalarHandler())).intValue();
			}
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	//内部调用，封装分页数据
	public QueryResult pageQuery(int startindex,int pagesize,String where,Object param){
		List list = getPageDate(startindex, pagesize, where, param);
		int totalrecord = getPageTotalRecord(where, param);
		QueryResult result = new QueryResult();
		result.setList(list);
		result.setTotalrecord(totalrecord);
		return result;
	}
	
	public List getAll(){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from product";
			return (List) runner.query(conn,sql,new  BeanListHandler(Product.class));
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
}
