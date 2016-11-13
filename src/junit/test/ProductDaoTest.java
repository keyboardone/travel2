package junit.test;

import org.junit.Test;

import cn.itcast.dao.ProductDao;
import cn.itcast.dao.impl.ProductDaoImpl;
import cn.itcast.domain.Category;
import cn.itcast.domain.Product;
import cn.itcast.utils.JdbcUtils;

public class ProductDaoTest {

	@Test
	public void testQuery(){
		ProductDao dao = new ProductDaoImpl();
		dao.pageQuery(0, 2, "where category_id=?",1 );
		
	}
	
	@Test
	public void addProduct(){
		Product product = new Product();
		product.setDescription("fff");
		product.setId("4");
		product.setImage("4");
		product.setName("4444");
		product.setPrice(90);
		product.setCategory(new Category());
		ProductDao dao = new ProductDaoImpl();
		dao.add(product);
		
		JdbcUtils.commitTransaction();
	}

}
