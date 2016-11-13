package cn.itcast.dao;

import cn.itcast.domain.User;

public interface UserDao {

	void add(User user);

	User find(String id);

	User find(String username, String password);

	//新增判断用户是否已存在方法，可能出错
	boolean find2(String username);
	void update(User user);
}