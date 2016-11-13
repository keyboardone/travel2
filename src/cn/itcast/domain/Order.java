package cn.itcast.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Order {

	private String id;
	private Date ordertime;	//下单时间
	private boolean state;	//订单状态
	private double price;	//订单总价
	private User user;		//记住下单人
	private Set orderitems = new HashSet();	//记住订单所有订单项,此处需要将set集合初始化，否则获取时为空，报空指针异常
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(Set orderitems) {
		this.orderitems = orderitems;
	}
	
}
