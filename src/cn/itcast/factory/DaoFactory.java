package cn.itcast.factory;

import java.io.InputStream;
import java.util.Properties;

public class DaoFactory {

	private static Properties prop = new Properties();
	private DaoFactory(){
		//从资源文件中检索
		try {
			InputStream in = DaoFactory.class.getClassLoader().getResourceAsStream("cn/itcast/factory/dao.properties");
			prop.load(in);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	};//工厂函数私有，单例模式，不能new了
	private static final DaoFactory instance = new DaoFactory();
	public static DaoFactory getInstance(){
		return instance;
	}
	
	//bookDao.class
	public <T> T createDao(Class<T> interfaceClass){
		//从资源文件中获取到关键字
		try {
			String key = interfaceClass.getSimpleName();
			String className = prop.getProperty(key);
			return (T) Class.forName(className).newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
