package cn.itcast.dao;

import java.util.List;

import cn.itcast.domain.Category;

public interface CategoryDao {

	void add(Category c);

	Category find(String id);

	List getAll();

	void delete(String id);
}