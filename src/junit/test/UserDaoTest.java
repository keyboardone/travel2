package junit.test;

import org.junit.Test;

import cn.itcast.dao.UserDao;
import cn.itcast.dao.impl.UserDaoImpl;
import cn.itcast.domain.User;
import cn.itcast.utils.JdbcUtils;

public class UserDaoTest {

	@Test
	public void testAdd(){
		User user = new User();
		user.setId("2013005512");
		user.setUsername("aaa");
		user.setPassword("123");
		
		UserDao dao = new UserDaoImpl();
		dao.add(user);
		JdbcUtils.commitTransaction();
	}
	
	@Test
	public void testFind(){
		UserDao dao = new UserDaoImpl();
		Boolean flag = dao.find2("aaa");
		System.out.println(flag);
	}
	
	@Test
	public void testFindByUsername(){
		UserDao dao = new UserDaoImpl();
		System.out.println(dao.find("aaa"));
	}
}
