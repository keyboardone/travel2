package cn.itcast.web.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.Cart;
import cn.itcast.domain.Product;
import cn.itcast.domain.User;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
public class BuyServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			//此处应该弹窗，提示登录
			request.getRequestDispatcher("/client/login.jsp").forward(request, response);
			return;
		}
		
		String id = request.getParameter("id");
		BusinessService service = new BusinessServiceImpl();
		Product product = service.findProduct(id);
		
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		cart.add(product);
		//先存到session，然后才能重定向
		//如果要将购物车关联用户的话，就不能直接跳转到购物车页面
		response.sendRedirect(request.getContextPath() + "/client/listcart.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
