package cn.itcast.web.manager;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.Category;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
import cn.itcast.utils.WebUtils;
public class CategoryServlet extends HttpServlet {
	private BusinessService service = new BusinessServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if("add".equals(method)){
			add(request,response);
		}
		if("getAll".equals(method)){
			getAll(request,response);
		}
		if("delete".equals(method)){
			delete(request,response);
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		try {
			String id = request.getParameter("id");
			service.deleteCategory(id);
			response.sendRedirect(request.getContextPath() + "/manager.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "删除失败！！");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		
	}

	private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List list = service.getAllCategory();
		request.setAttribute("categories", list);
		
		request.getRequestDispatcher("/manager/listcategroy.jsp").forward(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//把请求数据封装到category中去
			Category c = WebUtils.request2Bean(request, Category.class);
			c.setId(UUID.randomUUID().toString());
			service.addCategory(c);
			response.sendRedirect(request.getContextPath() + "/manager.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "添加失败");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
