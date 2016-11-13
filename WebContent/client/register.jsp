<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link href="${pageContext.request.contextPath }/css/common.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/register.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/js/hide.js"></script>
</head>
<body class="login_website">
	<div class="top clearfix">
		<div class="top_lt"><img src="${pageContext.request.contextPath }/img/xinxin.PNG"/>收藏游啊游 </div>
		<div class="top_rt">
			您好，欢迎来到游啊游&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/client/login.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/client/register.jsp">免费注册</a>&nbsp;&nbsp;
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
		<div class="search">
			<input type="text"/><span>搜索</span>
		</div>
	</div><!--logo结束-->
	<div class="nav">
		<ul>
			<li><a href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
			<li><a href="#">特色餐厅</a></li>
			<li><a href="#">当地交通</a></li>
			<li><a href="#">景区门票</a></li>
			<li><a href="#">娱乐体验</a></li>
			<li><a href="#">当地玩乐</a></li>
			<li><a href="#">游啊游无线</a></li>
		</ul>
	</div><!--nav结束-->
	<div class="content">
		<div class="register_panel">
			<div class="register_panel_title">
				邮箱注册
			<span>已有游啊游的会员？<a href="${pageContext.request.contextPath }/client/login.jsp">立即登录</a></span>
			</div>
			<div class="register_panel_conl">
			
			<form action="${pageContext.request.contextPath }/client/RegisterServlet" method="post">
			
			<table cellspacing="10">
				<tr>
					<td>邮箱</td>
					<td><input type="text" name="username" value="${form.username }" placeholder="用作登录和找回密码，不会公开"/></td>
				</tr>
				<tr>
					<td></td>
					<td class="center"><c:if test="${form.errors.username!=null }">
						<span class="error_message">${form.errors.username }</span>
					</c:if>
					</td>	
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="password" placeholder="请输入密码(3~8位数字)" name="password" value="${form.password }" /></td>
				</tr>
				<tr>
					<td></td>
					<td class="center"><c:if test="${form.errors.password!=null }">
						<span class="error_message">${form.errors.password }</span>
					</c:if></td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td><input type="password" placeholder="请输入确认密码(3~8位数字)" name="password2" value="${form.password2 }"  /></td>
				</tr>
				<tr>
					<td></td>
					<td class="center"><c:if test="${form.errors.password2!=null }">
						<span class="error_message">${form.errors.password2 }</span>
					</c:if></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" class="submitBTN" value="注&nbsp;册"/><br></td>
				</tr>
			</table>
			</form>
			</div>
			<div class="register_panel_conr">
				<h2>手机扫描二维码直接下载</h2>
				<img src="${pageContext.request.contextPath }/img/register_03.png" width="167px" height="167px"/>
				<div class="img">
					<img src="${pageContext.request.contextPath }/img/register_04.png" /><br>
					<img src="${pageContext.request.contextPath }/img/register_05.png" />
				</div>	
			</div>
		</div>
	</div><!--content结束-->
	<div class="foot">
		<img src="${pageContext.request.contextPath }/img/bg02.PNG" width="100%" height="168px"/>
		<div class="foot_content">
			<ul>
				<li><a href="#">关于我们</a>
					<ul>
						<li><a href="#">公司简介</a></li>
						<li><a href="#">加入我们</a></li>
						<li><a href="#">商务合作</a></li>
						<li><a href="#">商户后台</a></li>
						<li><a href="#">商户APP</a></li>
					</ul>
				</li>
				<li><a href="#">联系我们</a>
					<ul>
						<li><a href="#">电话客服</a></li>
						<li><a href="#">微信客服</a></li>
					</ul>
				</li>
				<li><a href="#">订购指南</a>
					<ul>
						<li><a href="#">消费券使用指南</a></li>
						<li><a href="#">在线订购保障</a></li>
						<li><a href="#">邮件订阅</a></li>
						<li><a href="#">积分说明</a></li>	
					</ul>
				</li>
				<li><a href="#">用户帮助中心</a>
					<ul>
						<li><a href="#">产品说明</a></li>
						<li><a href="#">订单取消和变更</a></li>
						<li><a href="#">退货说明</a></li>
						<li><a href="#">发票开具说明</a></li>	
					</ul>
				</li>
				<li><a href="#">服务条款</a>
					<ul>
						<li><a href="#">隐私条款</a></li>
						<li><a href="#">法律声明</a></li>
						<li><a href="#">用户协议</a></li>
						<li><a href="#">免责声明</a></li>
						<li><a href="#">产品购买协议</a></li>
					</ul>
				</li>
				<li><a href="#">常见问题</a>
					<ul>
						<li><a href="#">签证、护照常见问题</a></li>
						<li><a href="#">在线订购常见问题</a></li>
						<li><a href="#">网站使用常见问题</a></li>
						<li><a href="#">旅行途中常见问题</a></li>	
					</ul>
				</li>
			</ul>
			<div class="foot_content_pic"><img src="${pageContext.request.contextPath }/img/yay_position_29.jpg" width="86px" height="86px"><br><span>微信服务号</span></div>
		</div><!--foot_content-->
	</div><!--foot结束-->
</body>
</html>