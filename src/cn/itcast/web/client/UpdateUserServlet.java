package cn.itcast.web.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.User;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
import cn.itcast.utils.ServiceUtils;
public class UpdateUserServlet extends HttpServlet {
	BusinessService service = new BusinessServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String cellphone = request.getParameter("cellphone");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String address = request.getParameter("address");
		User user = service.findUser(id);
		if(nickname != null){
			user.setNickname(nickname);
		}
		if(cellphone != null){
			user.setCellphone(cellphone);
		}
		if(address != null){
			user.setAddress(address);
		}
		if(username != null){
			user.setUsername(username);
		}
		if(password != null){
			password = ServiceUtils.md5(password);
			user.setPassword(password);
		}
		service.updateUser(user);
		//加载更新后的用户信息到session中
		request.getSession().setAttribute("user", user);	//不能省略这一句，session的特殊性在于，如果session中有user，则不会重新从数据库中取值
		response.sendRedirect(request.getContextPath() + "/client/account.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
