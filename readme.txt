1.搭建环境
	1.1导开发包
		mysql驱动
		dbutils框架（简化jdbc编码）
		c3p0连接池（提高数据库的访问性能）
		beanutils（方便把数据封装到javabean中）
		log4j（与beanutils配合使用）
		commons fileupload（方便图片上传）
		commons io（方便图片上传）
		jstl开发包（el表达式）
		
	1.2创建组织程序的包
		cn.itcast.domain
		cn.itcast.dao
		cn.itcast.dao.impl
		cn.itcast.service
		cn.itcast.service.impl
		cn.itcast.web.client
		cn.itcast.web.manager
		cn.itcast.utils
		cn.itcast.filter
		cn.itcast.factory
		junit.test
		
		创建组织jsp的目录(分为前台和后台，不保护jsp):
		在WebContent下新建manager目录，保存后台相关的jsp
		1.在WebContent下新建manager.jsp页面，这个页面代表后台首页，这个页面是个分真页面，代码如下：
		<frameset rows="18%,*">
		 	<frame src="${pageContext.request.contextPath }/manager/head.jsp">
		 	<frameset  cols="15%,*">
		  		<frame src="${pageContext.request.contextPath }/manager/left.jsp" name="left">
		 		<frame src="#" name="right">
			</frameset>
		 </frameset>
		
		2.在WebContent下新建client目录，保存前台相关的jsp
		
		3.创建工程所需的库
		create database travelstore;
		use travelstore;
		
		4.创建一些全局的工具类和过滤器
		JdbcUtils（操作数据库）
		WebUtils（将前台获取到的数据封装到bean里面去）
		CharacterEncodingFilter（解决中文乱码问题）
		HtmlFilter（html代码转义）
		TransActionFilter（编写事物过滤器，统一管理事务）
		DaoFactory（产生dao，用于dao接口实现时）
		
		在过滤器类中创建JdbcUtils类,负责将数据库的连接绑定到当前线程,提交事务，与关闭连接
		在过滤器类中创建WebUtils，并在其中创建request2Bean(HttpServletRequest request,Class<T> beanClass){}方法，负责将前台获取到的数据封装到bean中
		public static <T> T request2Bean(HttpServletRequest request,Class<T> beanClass){
			try{
				
				T bean = beanClass.newInstance();
				Map map = request.getParameterMap();
				BeanUtils.populate(bean, map);
				return bean;
			}catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		
		在过滤器类中创建CharacterEncodingFilter中文乱码过滤器，负责解决中文乱码问题
		public class CharacterEncodingFilter implements Filter {
			public void doFilter(ServletRequest req, ServletResponse resp,FilterChain chain) throws IOException, ServletException {
				//认定客户端请求都是post带来的
				HttpServletRequest request = (HttpServletRequest) req;
				HttpServletResponse response = (HttpServletResponse) resp;
				request.setCharacterEncoding("UTF-8");
				chain.doFilter(request, response);
				//至此，解决了全站乱码问题
			}
			public void destroy() {
				// TODO Auto-generated method stub
			}
			public void init(FilterConfig filterConfig) throws ServletException {
				// TODO Auto-generated method stub
			}
		}
		在web.xml文件中配置过滤器
		<filter>
	    	<filter-name>CharacterEncodingFilter</filter-name>
	    	<filter-class>cn.itcast.filter.CharacterEncodingFilter</filter-class>
	  	</filter>
		<filter-mapping>
			<filter-name>CharacterEncodingFilter</filter-name>
		   	<url-pattern>/*</url-pattern>
		</filter-mapping>
		
		在过滤器类中创建HtmlFilter过滤器，负责进行html代码转义
		代码略。。。
		在web.xml文件中配置过滤器
		<filter>
		    <filter-name>HtmlFilter</filter-name>
		    <filter-class>cn.itcast.filter.HtmlFilter</filter-class>
		</filter>
		<filter-mapping>
		    <filter-name>HtmlFilter</filter-name>
		    <url-pattern>/*</url-pattern>
		</filter-mapping>
		
		在过滤器类中创建TransActionFilter过滤器，负责事务过滤，统一管理事务
		在web.xml文件中配置过滤器
		<filter>
		    <filter-name>TransActionFilter</filter-name>
		    <filter-class>cn.itcast.filter.TransActionFilter</filter-class>
		</filter>
		<filter-mapping>
		    <filter-name>TransActionFilter</filter-name>
		    <url-pattern>/*</url-pattern>
		</filter-mapping>
		
		去JdbcUtils中写相应的方法，调用线程
		
		最后在工厂包中新建工厂类，产生dao，用于dao接口实现时调用
		在工厂包中新建dao.properties配置文件,里面写接口包名，负责被接口调用
		
		到这里，都是地基性工作，与实体和表无关，接下来的就是设计实体，设计dao，设计service，设计web
2.设计实体
	Category	（分类，景点，酒店，美食等）
		private String id;
		private String name;
		private String description;
		
	Product	（景点，酒店，美食）可删
		private String id;
		private String name;
		private double price;
		private String image;	//记住产品的图片的位置
		private String description;
		private Category category;	//外键关联
		
	Order	（订单）
		private String id;
		private Date ordertime;	//下单时间
		private boolean state;	//订单状态
		private double price;	//订单总价
		private User user;		//记住下单人	外键关联
		private Set orderitems;	//记住订单所有订单项		外键关联
	
	OrderItem	（订单项）
		private String id;
		private Product product;	//记住订单项代表的是哪件物品
		private int quantity;	//记住订单项中的产品出现了几次
		private double price;	//记录产品的总价
		
	User	（订单属于的用户）
		private String id;
		private String username;
		private String password;
		private String cellphone;
		private String email;
		private String address;
		
3.设计表
	create table category
	(
		id varchar(40) primary key,
		name varchar(40) not null unique,
		description varchar(255)
	);
	
	create table product
	(
		id varchar(40) primary key,
		name varchar(40) not null unique,
		price decimal(8,2) not null,
		image varchar(255) not null,
		description varchar(255),
		category_id varchar(40),
		constraint category_id_FK foreign key(category_id) references category(id)
	);	
	
	create table user
	(
		id varchar(40) primary key,
		username varchar(40) not null unique,
		password varchar(20) not null,
		cellphone varchar(20) not null,
		email varchar(40) not null,
		address varchar(255) not null
	);	
	
	create table orders
	(
		id varchar(40) primary key,
		ordertime datetime not null,
		state boolean not null,
		price decimal(8,2) not null,
		user_id varchar(40),
		constraint user_id_FK foreign key(user_id) references user(id)
	);
		
	create table orderitem
	(
		id varchar(40) primary key,
		quantity int not null,
		price decimal(8,2) not null,
		product_id varchar(40),
		constraint product_id_FK foreign key(product_id) references product(id),
		order_id varchar(40),
		constraint order_id_FK foreign key(order_id) references orders(id)
	);	
			

4.写dao
	对应的在domain包中新建Category实体类，Product实体类，Order实体类，User实体类
	新建CategoryDaoImpl实现类，定义add,find,getAll方法，并抽取接口
	新建ProductDaoImpl实现类，定义add,find,getAll方法，定义分页相关方法
	在domain包中新建QueryResult临时类，保存分页相关数据到这个对象中
	新建UserDaoImpl实现类，定义add,find方法，并抽取接口
	新建OrderDaoImpl实现类，此类最复杂，添加订单还要考虑订单项，
	先新建OrderItem临时类
	
	测试：
	新建ProductDaoTest，测试分页，数据库中手动添加product,category，测试出现了问题，c3p0没有配置，
	新建OrderDaoTest，测试订单，数据库中手动添加orders,user,orderitem
	dao层测试完毕
5.写service
	在service层做权限拦截方案
	在工厂包dao.properties中加入接口信息
	完成分类相关服务，增加，查询，查询所有
	完成产品相关服务，增加，查询
	设计两个对象，返回分页数据到pagebean中
	在domain包中设计一个PageBean临时类
	在domain包中设计一个QueryInfo临时类
	完成用户相关服务，增加，查询	
	完成订单相关服务,最麻烦
	添加订单，订单对象根据购物车来生成，对外提供保存订单方法，接受购物车对象和用户对象
	新建Cart临时类，代表购物车
	新建CartItem对象
	订单数据是从购物车中取得的
	
	做总结测试
	测试前要删除记录，
	先删除订单项
	再删除产品
	再删除分类
	再删除订单
	再删除用户
	测试CategoryDao时出现错误，原因：dao.properties中book没有改，继续测试find，getAll方法
	测试Product,add,find方法
	测试PageQuery()方法
	测试AddUser()方法
	测试SaveOrder()方法
	测试FindOrder方法
	
	service层测试完毕
6.做web层		
	在manager文件夹中新建left.jsp后台左侧导航,改book
	新建addcategory.jsp
	在manager包中新建CategoryServlet
	根目录下新建全局消息显示页面message.jsp
	在manager文件夹中新建listcategroy.jsp
	在manager文件夹中新建head.jsp
	
	在manager包中新建ProductServlet
	在WebUtils中创建upload方法，处理文件上传,至此，WebUtils完全开发完毕
	在manager文件夹中新建listproduct.jsp
	在manager文件夹中新建addproduct.jsp
	完善ProductServlet

	分类和产品模块开发完成，开始做前台展示
	
	拿来前端页面，修改参数
	在跟目录下拿来前台的一套页面，index.jsp,login.jsp,register.jsp,xiangqin.jsp
	
	预备，获取首页的servlet：indexServlet，放与client包下，封装了categories和pagebean对象
	
	改前台，频繁出错

	
	引入用户模块（必须在order之前做出）
	合并并升级之前的用户模块
	
	引入异常包,处理用户异常和dao异常
	用户模块需要重写find2(String username,String password)方法，于formbean中判断boolean，面向接口编程，然后在service层和dao层中写方法(注：不要改写，应该新增，面向接口编程)
	完成注册功能，formbean验证
	完成登录功能，formbean验证
	完成注销功能，只作用于session域中
	修改功能还没有做，在填写用户手机、地址信息时再写
	现在开发生成订单模块
	
	在client包中新建OrderServlet，进行用户拦截，判断用户是否登录，此处应该弹窗
	然后从session域中取出cart属性，生成订单就绪
	新建用户信息页面，当前用户就是入口，这里能查看购物车和订单
	
	在manager包中新建OrderManagerServlet，作为管理员模块的订单控制器
	在Manager文件夹下新建listorder.jsp用于显示所有用户订单
	在Manager文件夹下新建orderdetail.jsp用于显示订单详情
	
	至此，全站基本功能开发完毕，进一步的完善目标很多
	
7.完善
	1.详情页改字段,改价格
	2.立即抢购拦截，进行登录验证
	3.账户信息页面添加用户名的EL表达式
	4.将购物车与用户信息关联，即一个用户对应一个自己的购物车，不能共享购物车，这个感觉有点难，似乎应该把购物车单独设计成表，稍后再说
	5.由于前期username乱用（不应该是邮箱名）导致现在需要新增字段 nickname,暂时不做验证,实现昵称，手机号，地址，邮箱修改功能
	6.实现删除订单功能,功能实现暂时不完美，由于使用了分真，删除完成后无法跳转到预定样式
	7.实现用户查询自己的订单的功能模块
	8.遇到了一个问题，用户订单页面，如果是未发货，则刷新后会重复购买，暂时无法解决
	9.重新设计后台页面的外观，完善文档
	10.完善用户自己的订单详情页
	11.用户一点提交订单，则清空购物车
	12.增加删除产品功能
	13.增加分类删除功能
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	