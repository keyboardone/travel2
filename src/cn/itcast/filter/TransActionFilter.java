package cn.itcast.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import cn.itcast.utils.JdbcUtils;

import com.sun.net.httpserver.Filter.Chain;

public class TransActionFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//考虑只浏览index的情况，不应该总是拦截并操作数据库
		try {
			//只要有请求过来，就拦下来，获取链接，然后开启事务，并把当前链接绑定到当前线程上面去，以后dao要操作数据库的话，都是找当前线程拿到链接，
			//这样就可以保证在一个请求范围内所有的操作都在一个开启了事务的链接上做的了
			//应该在调用dao之后开启事务
			//JdbcUtils.StartTransaction();
			
			
			//放行
			chain.doFilter(request, response);	//目标资源执行
			
			//获取当前线程上绑定的连接，提交事务，并关闭连接，释放连接与当前线程的绑定
			//将此操作交给JdbcUtils去做
			//代码改进之后相当于做了一个延迟，保证只有在第一次访问数据库的时候才开启连接
			JdbcUtils.commitTransaction();
		} finally{
			JdbcUtils.closeConn();
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
