package junit.test;

import org.junit.Test;

import cn.itcast.dao.OrderDao;
import cn.itcast.dao.impl.OrderDaoImpl;
import cn.itcast.domain.Order;

public class OrderDaoTest {

	@Test
	public void findTest(){
		OrderDao dao = new OrderDaoImpl();
		Order o = dao.find("1");
		System.out.println(o);
	}
}
