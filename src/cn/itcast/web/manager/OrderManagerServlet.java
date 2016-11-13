package cn.itcast.web.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.Order;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
public class OrderManagerServlet extends HttpServlet {
	BusinessService service = new BusinessServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String method= request.getParameter("method");
		if("getAll".equals(method)){
			getAll(request,response);
		}
		if("find".equals(method)){
			find(request,response);
		}
		if("update".equals(method)){
			update(request,response);
		}
		if("delete".equals(method)){
			delete(request,response);
		}
	}

	

	private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			boolean state = Boolean.parseBoolean(request.getParameter("state"));
			
			List list = service.getOrderByState(state);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/manager/listorder.jsp").forward(request, response);
			
	}
	private void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Order order = service.findOrder(id);
		request.setAttribute("order", order);
		request.getRequestDispatcher("/manager/orderdetail.jsp").forward(request, response);
	}
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String id = request.getParameter("id");
			service.updateOrder(id, true);

			request.getRequestDispatcher("/manager.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "³ö´í£¡£¡");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		
	}
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			service.deleteOrder(id);
			response.sendRedirect(request.getContextPath() + "/manager.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "É¾³ýÊ§°Ü£¡£¡");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
