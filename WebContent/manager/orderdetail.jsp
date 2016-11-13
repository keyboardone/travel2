<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情页面</title>
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
				<div class="headline"><h1>订单详情</h1></div>
				<table frame="border" cellpadding="0" cellspacing="0" width="90%">
				  <h3>订单明细</h3>
				  <tr>
				    <td>产品名</td>
				    <td>售价</td>
				    <td>数量</td>
				    <td>应收货款</td>
				  </tr>
				  
				  <c:forEach var="orderitem" items="${order.orderitems}">
				    <tr>
				      <td>${orderitem.product.name }</td>
				      <td>${orderitem.product.price }</td>
				      <td>${orderitem.quantity }</td>
				      <td>${orderitem.price }元</td>
				    </tr>
				  </c:forEach>
				  <tr>
				    <td colspan="2">总计应收货款</td>
				    <td colspan="2">${order.price }元</td>
				  </tr>
				</table>
				<br/><br/>
				<table frame="border" cellpadding="0" cellspacing="0" width="90%">
				  <h3>收货人详细地址</h3>
				  <tr>
				    <td>用户</td>
				    <td>手机</td>
				    <td>地址</td>
				    <td>邮箱</td>
				  </tr>
				  
				  <tr>
				    <td>${order.user.nickname }</td>
				    <td>${order.user.cellphone }</td>
				    <td>${order.user.address }</td>
				    <td>${order.user.username }</td>
				  </tr>
				</table>
				<a href="${pageContext.request.contextPath }/manager/OrderManagerServlet?method=update&id=${order.id }">确认发货</a>
			</div>
		</div>
		
	</div><!--content结束-->
	<div class="foot">
		<img src="${pageContext.request.contextPath }/img/bg02.PNG" width="100%" height="168px"/>
		
	</div><!--foot结束-->
</body>
</html>