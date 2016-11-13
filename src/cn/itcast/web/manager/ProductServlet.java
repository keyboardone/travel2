package cn.itcast.web.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.Product;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
import cn.itcast.utils.WebUtils;
public class ProductServlet extends HttpServlet {
	private BusinessService service = new BusinessServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if("forAddUI".equals(method)){
			forAddUI(request,response);
		}
		if("add".equals(method)){
			add(request,response);
		}
		if("list".equals(method)){
			list(request,response);
		}
		if("delete".equals(method)){
			delete(request,response);
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		try {
			String id = request.getParameter("id");
			service.deleteProduct(id);
			response.sendRedirect(request.getContextPath() + "/manager.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "É¾³ýÊ§°Ü£¡£¡");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List list = service.getAllProduct();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/manager/listproduct.jsp").forward(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Book  book = WebUtils.request2Bean(request, Book.class);
		try {
			
			Product product = WebUtils.upload(request, this.getServletContext().getRealPath("/images"));
			service.addProduct(product);
			response.sendRedirect(request.getContextPath() + "/manager.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Ìí¼ÓÊ§°Ü£¡£¡");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
	}

	private void forAddUI(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		List categories = service.getAllCategory();
		request.setAttribute("categories", categories);
		request.getRequestDispatcher("/manager/addproduct.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
