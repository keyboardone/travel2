<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加产品页面</title>
<link href="${pageContext.request.contextPath }/css/common.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/order.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/js/hide.js"></script>
</head>
<body class="order_website">
	<div class="transport" id="transport"></div>
	<div class="top clearfix">
		<div class="top_lt"><img src="${pageContext.request.contextPath }/img/xinxin.PNG"/>游啊游旅游网站后台管理系统 </div>
		
	</div><!--top结束-->
	<div class="logo">
		<div class="logo_pic"><a href="${pageContext.request.contextPath }/index.jsp"><img src="${pageContext.request.contextPath }/img/yay_logo.png"/></a></div>
	</div><!--logo结束-->
	<div class="content">
		<div class="order">
			<div class="order_left">
				<div class="order_left_t"></div>
				<div class="order_left_f">
					<div class="order_f_tit">分类管理</div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/manager/addcategory.jsp">添加分类</a></li>
						<li><a href="${pageContext.request.contextPath }/manager/CategoryServlet?method=getAll">查看分类</a></li>
					</ul>
					<div class="order_f_tit">产品管理</div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/manager/ProductServlet?method=forAddUI">添加产品</a></li>
						<li><a href="${pageContext.request.contextPath }/manager/ProductServlet?method=list">查看产品</a></li>
					</ul>
					<div class="order_f_tit">订单管理</div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/manager/OrderManagerServlet?method=getAll&state=false">待处理订单</a></li>
						<li><a href="${pageContext.request.contextPath }/manager/OrderManagerServlet?method=getAll&state=true">已发货订单</a></li>
					</ul>
					
				</div>
			</div>
			
			<div class="order_right">
			<div class="order_right_content">
				<div class="headline"><h1>添加产品信息</h1></div>
				<form action="${pageContext.request.contextPath }/manager/ProductServlet?method=add" method="post" enctype="multipart/form-data">
				  <table width="500px">
				  <tr>
				    <td>产品名</td>
				    <td><input type="text" name="name" style="width: 200px"></td>
				  <tr>
				  <tr>
				    <td>售价</td>
				    <td><input type="text" name="price" style="width: 200px"></td>
				  </tr>
				  <tr>
				    <td>图片</td>
				    <td><input type="file" name="image" style="width: 200px"></td>
				  </tr>
				  <tr>
				    <td>描述</td>
				    <td><textarea rows="4" cols="40" name="description"></textarea></td>
				  </tr>
				  <tr>
				    <td>所属分类</td>
				    <td>
				      <select name="category_id">
				        <c:forEach var="category"  items="${categories}">
				          <option value="${category.id }">${category.name }</option>
				        </c:forEach>
				      </select>
				    </td>
				  </tr>
				  <tr>
				    <td></td><td><input type="submit" value="添加产品"></td>
				  </tr>
				  </table>
				</form>
				
			</div>
		</div>
		
	</div><!--content结束-->
	<div class="foot">
		<img src="${pageContext.request.contextPath }/img/bg02.PNG" width="100%" height="168px"/>
		
	</div><!--foot结束-->
</body>
</html>