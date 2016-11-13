package cn.itcast.web.client;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.User;
import cn.itcast.exception.UserExistException;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
import cn.itcast.utils.WebUtils;
import cn.itcast.web.formbean.RegisterForm;

public class RegisterServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1.对提交表单的字段进行合法性校验（把表单数据封装到formbean）
		RegisterForm form =  WebUtils.request2Bean(request, RegisterForm.class);
		boolean b = form.validate();
		
		//2.如果校验失败，跳回到表单页面，回显校验失败信息
		if(!b){
			request.setAttribute("form", form);   
			request.getRequestDispatcher("/client/register.jsp").forward(request, response);
			return;
		}
		
		//3.如果校验成功，则调用service处理注册请求
		User user = new User();
		WebUtils.copyBean(form, user);
		user.setId(UUID.randomUUID().toString());
		
		BusinessService service = new BusinessServiceImpl();
		try {
			service.registerUser(user);
			//6.如果serivce处理成功，跳转到网站的全局消息显示页面，为用户注册成功的消息
			//此处后期美化
			request.setAttribute("message", "注册成功,浏览器将在3秒后跳转到登陆页面，请您重新登录<meta http-equiv='refresh' content='3;url="+request.getContextPath()+"/client/login.jsp'>");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		} catch (UserExistException e) {
			//关键！！！！同理可得邮箱验证唯一性
			
			//4.如果serivce处理不成功,并且不成功的原因，是因为注册用户已存在的话，则跳回到注册页面，显示注册用户已存在的消息
			form.getErrors().put("username", "注册的用户名已存在！！");
			request.setAttribute("form", form);
			request.getRequestDispatcher("/client/register.jsp").forward(request, response);
			return;
		}catch (Exception e) {
			//5.如果serivce处理不成功,并且不成功的原因是其它问题的话，跳转到网站的全局消息显示页面，为用户显示友好错误消息
			e.printStackTrace();
			request.setAttribute("message", "服务器出现未知错误！！！");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
