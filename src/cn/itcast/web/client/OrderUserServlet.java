package cn.itcast.web.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
public class OrderUserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BusinessService service = new BusinessServiceImpl();
		//id «ø’÷µ
		String id = request.getParameter("id");
		List list = service.getOrderByUser(id);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/client/listorder.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
