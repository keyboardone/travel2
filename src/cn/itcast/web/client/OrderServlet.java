package cn.itcast.web.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.Cart;
import cn.itcast.domain.User;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
public class OrderServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			//此处应该弹窗，提示登录
			request.getRequestDispatcher("/client/login.jsp").forward(request, response);
			return;
		}
		
		try {
			Cart cart = (Cart) request.getSession().getAttribute("cart");
			BusinessService service = new BusinessServiceImpl();
			service.saveOrder(cart, user);
			String id = request.getParameter("id");
			List list = service.getOrderByUser(id);
			request.setAttribute("list", list);
			//清除购物车
			request.getSession().removeAttribute("cart");
			request.getRequestDispatcher("/client/listorder.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "下单失败！！");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
