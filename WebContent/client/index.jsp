<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页,版本测试</title>
<link href="${pageContext.request.contextPath }/css/index.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/common.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/js/hide.js"></script>
<script src="${pageContext.request.contextPath }/js/myfocus-2.0.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/choice.js"></script>
<script>
			myFocus.set({
			    id:'picBox'  /*焦点图初始化的ID，与图片列表最外层的ID一致*/
			})
</script>
</head>
<body>
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
		<div class="logo_pic"><a href="${pageContext.request.contextPath }/client/index.jsp"><img src="${pageContext.request.contextPath }/img/yay_logo.png"/></a></div>
		<div class="search">
			<input type="text"/><span>搜索</span>
		</div>
	</div><!--logo结束-->
	<div class="nav">
		<ul>
			<li><a href="${pageContext.request.contextPath }/client/index.jsp">首页</a></li>
			<li><a href="#">特色餐厅</a></li>
			<li><a href="#">当地交通</a></li>
			<li><a href="#">景区门票</a></li>
			<li><a href="#">娱乐体验</a></li>
			<li><a href="#">当地玩乐</a></li>
			<li><a href="#">游啊游无线</a></li>
		</ul>
	</div><!--nav结束-->
	<div class="ad" id="picBox" >
        <div class="loading"><img src="${pageContext.request.contextPath }/img/loading.gif" alt="图片加载中"></div>
        <div class="pic"><!--图片列表的外面必须包裹一个class为pic的div-->
            <ul>
            	<li><img src="${pageContext.request.contextPath }/img/20160222102931.jpg"width="1350px" height="450px"/></li>
            	<li><img src="${pageContext.request.contextPath }/img/20160229144358.jpg"width="1350px" height="450px"/></li>
            	<li><img src="${pageContext.request.contextPath }/img/20160314160909.jpg"width="1350px" height="450px"/></li>
            	<li><img src="${pageContext.request.contextPath }/img/20160325144856.jpg"width="1350px" height="450px"/></li>
            	<li><img src="${pageContext.request.contextPath }/img/20160428200255.jpg"width="1350px" height="450px"/></li>
            </ul>
        </div>
    </div><!--焦点图结束-->
		<div class="content clearfix">
			<div class="heatsale">
				<div class="commom_tit">
					<h1>本周热销榜 TOP6</h1>
					<h2>HOT TOP6</h2>
					<a href="" class="commom_more">MORE</a>
				</div>
				<div class="commom_cont">
					<div class="commom_panel clearfix">
						<ul class="con_box">
							<li>
								<a class="con_box_img" href="${pageContext.request.contextPath}/client/xiangqin.jsp"><img src="${pageContext.request.contextPath }/img/subaijia020150611183054042414.png"/></a>
								<div class="con_info">
									<h1><a href="${pageContext.request.contextPath}/client/xiangqin.jsp">【甲米特色】甲米塔兰红树林+划皮划艇+洪岛一</a></h1>
									<div class="con_price">
										￥<span>328</span>起/人
									</div>
								</div>
							</li>
						</ul>
						<ul class="con_box">
							<li>
								<a class="con_box_img" href="${pageContext.request.contextPath}/client/xiangqin.jsp"><img src="${pageContext.request.contextPath }/img/jingjinting020160314124826255950.jpg"/></a>
								<div class="con_info">
									<h1><a href="${pageContext.request.contextPath }/client/xiangqin.jsp">【地道法餐】吴哥L'Anaexe French 餐厅</a></h1>
									<div class="con_price">
										￥<span>328</span>起/人
									</div>
								</div>
							</li>
						</ul>
						
					</div>
				</div>
			</div><!--本周热销结束-->
			
			<div class="heatsale">
			<!-- 分类 -->
				<div class="commom_tit">
					<h1>当地旅游</h1>
					<h2>DESTINATION TOURISM</h2>
					<a href="" class="commom_more">MORE</a>
					<div class="title_nav" >
						<ul id="nav">
						<!-- 分类开始 -->
							<c:forEach var="c" items="${categories}">
			  					<li><a href='${pageContext.request.contextPath }/client/IndexServlet?category_id=${c.id }'>${c.name }</a></li>
			  				</c:forEach>
							<li class="active">一日游</li>
							
							
						</ul>
					</div>
				</div>
				
			<!-- 产品 -->	
				<div class="commom_cont" id="content">
					<!--1-->
					<div class="commom_panel clearfix" style="display: block;">
						<c:forEach var="product" items="${pagebean.list}" varStatus="status">
						<ul class="con_box">
							<li>
				  				<div id="product">
				  					<div id="image">
				  						<a class="con_box_img" href="${pageContext.request.contextPath}/client/XiangqinServlet?id=${product.id}"><img src="${pageContext.request.contextPath }/images/${product.image }"/></a>
				  					</div>
				  					
				  					<div class="con_info">
										<h1><a href="${pageContext.request.contextPath }/client/XiangqinServlet?id=${product.id}">${product.name }</a></h1>
										<div class="con_price">
											￥<span>${product.price }</span>起/人
										</div>
									</div>
				  				</div>
							</li>
						</ul>
						</c:forEach>
						<div style="clear: both"></div>
		  				<br/>
		  				<div id="pagebar">
		  					总共${pagebean.totalpage }页
		  					当前${pagebean.currentpage }页
		  					<c:forEach var="pagenum" items="${pagebean.pagebar}">
		  						<a href="${pageContext.request.contextPath }/client/IndexServlet?currentpage=${pagenum }&category_id=${param.category_id }">${pagenum }</a>
		  					</c:forEach>
		  					
		  				</div>
					</div>
			
			</div><!--当地旅游结束-->
			
			
			<div class="heatsale">
				<div class="commom_tit">
					<h1>热门目的地</h1>
					<h2>HOT TOURIST DESTINATION</h2>
					<a href="" class="commom_more">MORE</a>
				</div>
				<div class="commom_cont">
					<ul class="clearfix">
						<li><a href="#"><img src="${pageContext.request.contextPath }/img/20151204091240.jpg"/></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/img/20151204091530.jpg"/></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/img/20151204091903.jpg"/></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/img/20151204092141.jpg"/></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/img/20151204092250.jpg"/></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/img/20151204102452.jpg"/></a></li>
					</ul>
				</div>
			</div><!--热门目的地结束-->		
			
			<div class="news clearfix">
				<div class="heatsale L">
					<div class="commom_tit">
						<h1>网站新闻</h1>
						<h2>WEB NEWS</h2>
					</div>
					<div class="news_cont">
						<ul>
							<li><a href="#">游啊游旅行网: 将场景旅游发挥极致 目的地在线旅游</a></li>
							<li><a href="#">游啊游旅行网积极参与“一张纸献爱心行动”</a></li>
							<li><a href="#">游啊游旅游网周旭东：旅游O2O，一键式服务畅游全世界</a></li>
							<li><a href="#">漫步吴哥——“游啊游”的自由行为何与众不同？</a></li>
							<li><a href="#">互联网+的热潮已经蔓延至出境游海外市场</a></li>
							<li><a href="#">游啊游旅行网携手中免集团 会员将享柬埔寨免税店折扣</a></li>
						</ul>
					</div>
				</div><!--网站新闻结束-->
				<div class="heatsale R">
					<div class="commom_tit">
						<h1>常见问题</h1>
						<h2>FAQ</h2>
					</div>
					<div class="news_cont">
						<ul>
							<li><a href="#">出国旅游需要什么手续</a></li>
							<li><a href="#">自由行是什么意思？</a></li>
							<li><a href="#">半自由行是什么意思？</a></li>
							<li><a href="#">自助游和跟团游有什么区别？</a></li>
							<li><a href="#">出境游去哪？</a></li>
							<li><a href="#">出境游特价产品的购买？</a></li>
						</ul>
					</div>
				</div><!--常见问题结束-->
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