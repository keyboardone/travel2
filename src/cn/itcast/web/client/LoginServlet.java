package cn.itcast.web.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.User;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;

public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		BusinessService service = new BusinessServiceImpl();
		User user = service.loginUser(username, password);
		if(user!=null){
			//此处非常重要，一旦登录，则将用户信息加载到session中，之后可以直接用EL表达式取值
			request.getSession().setAttribute("user", user);
			//让用户登陆成功后，跳转首页 
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}
		
		request.setAttribute("error_login", "用户名或密码错误!!!");   
		request.getRequestDispatcher("/client/login.jsp").forward(request, response);
		return;
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
