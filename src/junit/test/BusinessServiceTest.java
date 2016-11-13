package junit.test;

import org.junit.Test;

import cn.itcast.domain.Cart;
import cn.itcast.domain.Category;
import cn.itcast.domain.PageBean;
import cn.itcast.domain.Product;
import cn.itcast.domain.QueryInfo;
import cn.itcast.domain.User;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
import cn.itcast.utils.JdbcUtils;

public class BusinessServiceTest {
	private BusinessService service = new BusinessServiceImpl();
	@Test
	public void testAddCategory(){
		Category c = new Category();
		c.setId("1");
		c.setName("java开发");
		c.setDescription("java");
		
		service.addCategory(c);
		
		JdbcUtils.commitTransaction();
	}
	@Test
	public void testFindCategory(){
		service.findCategory("1");
	}
	
	@Test
	public void testGetAllCategory(){
		service.getAllCategory();
	}
	
	@Test
	public void testAddProduct(){
		Category c = new Category();
		c.setId("1");
		c.setName("java开发");
		c.setDescription("java");
		
		Product product = new Product();
		product.setCategory(c);
		product.setDescription("hhaha");
		product.setId("2341341");
		product.setImage("223");
		product.setName("javaweb开发");
		product.setPrice(89);
		
		service.addProduct(product);
		JdbcUtils.commitTransaction();
	}
	@Test
	public void testFindProduct(){
		//没必要找category，显示书的时候没有必要显示分类
		service.findProduct("2341341");
	}
	
	@Test
	public void testPageQuery(){
		QueryInfo  info = new QueryInfo();
		info.setCurrentpage(1);
		info.setPagesize(3);
//		info.setQueryname("category_id");
//		info.setQueryvalue("1");
		
		PageBean bean = service.productPageQuery(info);
		System.out.println(bean);
	}
	
	@Test
	public void testAddUser(){
		User user = new User();
		user.setAddress("神殿");
		user.setCellphone("1803517");
		user.setEmail("2892075608@qq.com");
		user.setId("1");
		user.setPassword("123");
		user.setUsername("任冰");
		
		service.addUser(user);
		JdbcUtils.commitTransaction();
	}
	
	@Test
	public void testSaveOrder(){
		User user = new User();
		user.setAddress("神殿");
		user.setCellphone("1803517");
		user.setEmail("2892075608@qq.com");
		user.setId("1");
		user.setPassword("123");
		user.setUsername("任冰");
		
		Cart cart = new Cart();
		
		Product product = new Product();
		product.setCategory(null);
		product.setDescription("hhaha");
		product.setId("2341341");
		product.setImage("223");
		product.setName("javaweb开发");
		product.setPrice(89);
		
		cart.add(product);
		
		service.saveOrder(cart, user);
		JdbcUtils.commitTransaction();
	}
	
	@Test
	public void testFindOrder(){
		service.findOrder("9452156d-2f64-45d0-9cc3-e04e72495155");
	}
}
