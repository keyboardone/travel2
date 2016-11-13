package cn.itcast.domain;

public class OrderItem {

	private String id;
	private Product product;	//记住订单项代表的是哪本书
	private int quantity;	//记住订单项中的书出现了几本
	private double price;	//记录书的总价
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
}
