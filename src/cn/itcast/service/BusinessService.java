package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.Cart;
import cn.itcast.domain.Category;
import cn.itcast.domain.Order;
import cn.itcast.domain.PageBean;
import cn.itcast.domain.Product;
import cn.itcast.domain.QueryInfo;
import cn.itcast.domain.User;
import cn.itcast.exception.UserExistException;

public interface BusinessService {

	/**************************************
	 * 
	 * 分类相关的服务
	 * 
	 **************************************/
	void addCategory(Category c);

	Category findCategory(String id);

	List getAllCategory();

	void deleteCategory(String id);
	/**************************************
	 * 
	 * 订单相关的服务
	 * 
	 **************************************/
	void addProduct(Product product);

	Product findProduct(String id);

	PageBean productPageQuery(QueryInfo info);

	List getAllProduct();

	void deleteProduct(String id);
	/**************************************
	 * 
	 * 用户相关的服务
	 * 
	 **************************************/
	void addUser(User user);

	User findUser(String username, String password);

	User findUser(String id);
	void registerUser(User user) throws UserExistException;
	User loginUser(String username, String password);
	void updateUser(User user);
	/**************************************
	 * 
	 * 订单相关的服务
	 * 
	 **************************************/
	//订单是根据用户的购物车来生成的，所以这里接受的是购物车对象和用户对象
	void saveOrder(Cart cart, User user);

	//查询订单
	Order findOrder(String id);

	//得到所有订单
	List getOrderByState(boolean state);
	//得到用户自己的所有订单
	List getOrderByUser(String id);
	//更新订单装填
	void updateOrder(String id, boolean state);
	//删除订单
	void deleteOrder(String id);
}