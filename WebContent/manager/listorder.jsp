<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看待处理订单页面</title>
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
				<div class="headline"><h1>所有订单</h1></div>
				<table frame="border" cellpadding="0" cellspacing="0" width="90%">
				  <caption><h2>订单信息</h2></caption>
				  <tr>
				    <td>订单人</td>
				    <td>下单时间</td>
				    <td>订单状态</td>
				  <td>订单总价</td>
				  <td>操作</td>
				  </tr>
				
				  <c:forEach var="order" items="${list}">
				    <tr>
				      <td>
				        ${order.user.nickname }
				      </td>
				      <td>
				        ${order.ordertime }
				      </td>
				      <td>
				        ${order.state==false?'未发货':'已发货' }
				      </td>
				      <td>
				        ${order.price }
				      </td>
				      <td>
				        <a href="${pageContext.request.contextPath }/manager/OrderManagerServlet?method=find&id=${order.id }">查看明细</a>
				        <a href="${pageContext.request.contextPath }/manager/OrderManagerServlet?method=delete&id=${order.id}">删除订单</a>
				      </td>
				    </tr>
				  </c:forEach>
				</table>
				
			</div>
		</div>
		
	</div><!--content结束-->
	<div class="foot">
		<img src="${pageContext.request.contextPath }/img/bg02.PNG" width="100%" height="168px"/>
		
	</div><!--foot结束-->
</body>
</html>