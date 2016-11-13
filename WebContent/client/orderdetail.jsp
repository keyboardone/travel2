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
		<div class="top_lt"><img src="${pageContext.request.contextPath }/img/xinxin.PNG"/>收藏游啊游 </div>
		<div class="top_rt">
			您好，欢迎来到游啊游&nbsp;&nbsp;|&nbsp;&nbsp;
			
			<c:if test="${user!=null}">
				<span> 
					<a href="${pageContext.request.contextPath }/client/account.jsp">当前用户：${user.username }</a> 
				</span>
				&nbsp;
				<span> 
					<a href="${pageContext.request.contextPath }/client/LogoutServlet">退出</a>
				</span>
			</c:if>
			
			<c:if test="${user==null}">
				<a href="${pageContext.request.contextPath }/client/login.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath }/client/register.jsp">免费注册</a>
			</c:if>
			
			&nbsp;&nbsp;
			<span class="top_rt_tel" id="tel">客服电话 400-888-0166</span>
			<div class="top_rt_hide " id="tel_content">
				<div class="top_rt_hide_t">
					服务时间 ：9:00 - 20:00
				</div>
				<div class="top_rt_hide_f">
					国内：400-888-0166<br>泰国：+66-76-684-996<br>越南：0084-963-694-428<br>柬埔寨：097-6023-868
				</div>
			</div>
		</div>
	</div><!--top结束-->
	<div class="logo">
		<div class="logo_pic"><a href="${pageContext.request.contextPath }/index.jsp"><img src="${pageContext.request.contextPath }/img/yay_logo.png"/></a></div>
	</div><!--logo结束-->
	<div class="content">
		<div class="order">
			<div class="order_left">
				<div class="order_left_t"><span>${user.nickname }</span></div>
				<div class="order_left_f">
					<div class="order_f_tit">订单管理</div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/client/OrderUserServlet?id=${user.id}" style="background: #A0E1D9;color:white ;border-radius: 3px;">我的订单</a></li>
						<li><a href="${pageContext.request.contextPath }/client/listcart.jsp">我的购物车</a></li>
					</ul>
					<div class="order_f_tit">账户设置</div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/client/account.jsp">账户信息</a></li>
						
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
				    <td>应付货款</td>
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
				    <td colspan="2">总计应付货款</td>
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
				
			</div>
		</div>
		
	</div><!--content结束-->
	<div class="foot">
		<img src="${pageContext.request.contextPath }/img/bg02.PNG" width="100%" height="168px"/>
		
	</div><!--foot结束-->
</body>
</html>