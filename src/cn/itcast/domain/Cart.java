package cn.itcast.domain;

import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

	private Map<String, CartItem> map = new LinkedHashMap<String, CartItem>();
	private double price;
	public void add(Product product){
		CartItem item = map.get(product.getId());
		if(item==null){
			item = new CartItem();
			item.setProduct(product);
			item.setQuantity(1);
			map.put(product.getId(), item);
		}else{
			item.setQuantity(item.getQuantity()+1);
		}
	}
	public Map<String, CartItem> getMap() {
		return map;
	}
	public void setMap(Map<String, CartItem> map) {
		this.map = map;
	}
	public double getPrice() {
		double totalprice = 0;
		for(Map.Entry<String, CartItem> entry : map.entrySet()){
			totalprice += entry.getValue().getPrice();
		}
		this.price = totalprice;
		return price;
	}
	
}
