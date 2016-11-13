package cn.itcast.dao;

import java.util.List;

import cn.itcast.domain.Product;
import cn.itcast.domain.QueryResult;

public interface ProductDao {

	void add(Product p);

	Product find(String id);

	//内部调用，封装分页数据
	QueryResult pageQuery(int startindex, int pagesize, String where,
			Object param);

	List getAll();
	
	void delete(String id);

}