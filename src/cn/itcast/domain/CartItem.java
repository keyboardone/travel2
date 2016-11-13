package cn.itcast.domain;

public class CartItem {

	private Product product;
	private int quantity;
	private double price;
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
		//根据产品和数量算出价格
		this.price = this.product.getPrice()*quantity;
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
}
