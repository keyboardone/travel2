<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情页面</title>
<link href="${pageContext.request.contextPath }/css/common.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/xiangqin.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/js/hide.js"></script>
<script src="${pageContext.request.contextPath }/js/xiangqing_choice.js"></script>
<script src="${pageContext.request.contextPath }/js/plus.js"></script>
</head>
<body class="login_website">
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
	<div class="content clearfix">
		<div class="primaryInfo">
			<h1>${product.name }</h1>
			<h2>-将降降降急急急急急急</h2>
			<div class="primaryInfo_panel clearfix">
				<div class="FB_imgs L">
					<div class="slider_box" id="slider_box">
						<ul class="slider_con">
							<li style="display: block;" ><img src="${pageContext.request.contextPath }/img/20141101012609.jpg" width="552px" height="291px"/></li>
							<li ><img src="${pageContext.request.contextPath }/img/20141104194710.jpg" width="552px" height="291px"/></li>
							<li ><img src="${pageContext.request.contextPath }/img/20141104192814.jpg" width="552px" height="291px"/></li>
							<li><img src="${pageContext.request.contextPath }/img/20151228143701.jpg" width="552px" height="291px"/></li>
							<li><img src="${pageContext.request.contextPath }/img/20151228143058.jpg" width="552px" height="291px"/></li>
						</ul>
					</div><!--轮播-->
					<div class="slider_nav" id="slider_nav">
						<ul>
							<li><img src="${pageContext.request.contextPath }/img/20141101012609.jpg" width="100" height="60"/></li>
							<li><img src="${pageContext.request.contextPath }/img/20141104194710.jpg" width="100" height="60"/></li>
							<li><img src="${pageContext.request.contextPath }/img/20141104192814.jpg" width="100" height="60"/></li>
							<li><img src="${pageContext.request.contextPath }/img/20151228143701.jpg" width="100" height="60"/></li>
							<li><img src="${pageContext.request.contextPath }/img/20151228143058.jpg" width="100" height="60"/></li>
						</ul>
					</div>
				</div>
				<div class="info_panel L">
					<div class="info_part1">
						价格<span>${product.price }</span><i>7.5折</i>
					</div>
					<div class="info_part2">
						<dl>
							<dt>目的地</dt>
							<dd>泰国 - 普吉</dd>
						</dl>
						<dl>
							<dt>有效期</dt>
							<dd>下单后15天</dd>
						</dl>
						<dl class="dl">
							<dt>套餐类型</dt>
							<dd class="bor">Mini Go...</dd>
						</dl>
						<dl class="dl">
							<dt>数量</dt>
							<dd>
								<ul>
									<li class="jian L" onclick="jian()">-</li>
									<li class="input_box L"><input type="text" value="0" border="0" id="count"/></li>
									<li class="plus L" onclick="jia()">+</li>
								</ul>
							</dd>
						</dl>
					</div>
					<div class="info_part3"><a href="${pageContext.request.contextPath }/client/BuyServlet?id=${product.id }"><input type="button" value="立即抢购"/></a></div>
				</div>
			</div><!--商品购买结束-->
		</div>
		<div class="product">
			<div class="product_describe">
				<div class="product_title">
					<h1>产品介绍</h1>
					<h2>INTRODUCE</h2>
				</div>
				<div class="product_cont">
					<strong>※商家地址：Banana Walk Patong Phuket<br>
					※营业时间：09.00-24.00<br>
					※ 重要提示：<br></strong>
					  1. 请根据您的需要，拍下对应的代金券张数；<br>
					  2. 请于消费前出示购买的代金券；如果您购买的是全天无限次玩耍门票，请消费前出示2张代金券方可当天无限次使用；<br>
					  3. 所有门票代金券仅限消费当天有效，无法二次使用；<br>
					  4.请按照国际礼仪，当服务结束后，请给服务人员小费以示尊重。<br>
					<div class="product_cont_tit">费用说明</div>
						<p>Mini Golf 1人次门票：游啊游价格：75元</p>
						<p>Mini Golf 全天无限次玩耍门票:游啊游价：150元</p><br>
						<b>【价格包含】：</b>
						<p>1. Mini Golf 1人次门票套餐：需要拍下1张代金券，仅限1人玩1轮18洞Mini Golf ；</p>
						<p>2. Mini Golf 全天无限次玩耍：需要拍下2张代金券/人，1人当天无限次玩耍；</p>	
						<p>3. 税费和服务费。</p><br>
						<b>【价格不含】：</b>
						<p>1. 个人其他消费；</p>
						<p>2. 给服务人员的小费。</p>	
					<div class="product_cont_tit">产品详情</div>
						<div class="xiangqin_con">
							<p>${product.description }</p>
							
						</div>
						<p><img src="${pageContext.request.contextPath }/img/qiuhui020160121183447798624.jpg"/></p>
						<p><img src="${pageContext.request.contextPath }/img/qiuhui120160121183448158368.jpg"/></p>
						<p><img src="${pageContext.request.contextPath }/img/qiuhui220160121183448289349.jpg"/></p>
				</div>
			</div><!--产品简介结束-->
			<div class="product_describe">
				<div class="product_title">
					<h1>预订须知</h1>
					<h2>BOOKING INFO</h2>
				</div>
				<div class="product_cont xuzhi">
					<p>※ 规则提醒：不兑现，不找零</p>
					<p>※ 代金券有效期：自购买日起15天内有效（一经使用即无法进行二次使用）</p>
					<p>※ 不适用范围：不与店内其他优惠共享</p>
					<p>※ 超出代金券金额的请额外在店内支付</p>
					<div class="product_cont_tit">退改规定</div>
					<p>一经购买，不改不退。</p>
				</div>
			</div><!--预订须知结束-->
			<div class="product_describe">
				<div class="product_title">
					<h1>游啊游承诺</h1>
					<h2>YOUAYOU PROMISE</h2>
				</div>
				<div class="product_cont xuzhi">
					<img src="${pageContext.request.contextPath }/img/youayouchengnuo.PNG" />
				</div>
			</div><!--游啊游承诺结束-->
			<div class="product_describe">
				<div class="product_title">
					<h1>预订流程</h1>
					<h2>YBOOKING PROCESS</h2>
				</div>
				<div class="product_cont xuzhi">
					<img src="${pageContext.request.contextPath }/img/liucheng.PNG" />
				</div>
			</div><!--预订流程结束-->
			<div class="product_describe">
				<div class="product_title">
					<h1>用户点评</h1>
					<h2>USER REVIEWS</h2>
				</div>
				<div class="product_cont xuzhi">
					<img src="${pageContext.request.contextPath }/img/pingjia.PNG" />
				</div>
			</div><!--用户点评结束-->
		</div><!--产品内容结束-->
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