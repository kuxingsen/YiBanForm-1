<%@ page language="java"
	import="java.util.*,cn.yiban.open.*,cn.yiban.open.common.User,sust.util.*,net.sf.json.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>易表格</title>

<meta name="author" content="HeLang">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zerogrid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/component.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/responsive.css">
<link href='${pageContext.request.contextPath}/images/favicon.ico'
	rel='icon' type='image/x-icon' />

</head>
<body>
	<%
		try {
			String text = (String) session.getAttribute("text");
			System.out.println(text);
			JsonUtil ju = new JsonUtil();
			JSONObject json = JSONObject.fromObject(text);
			if (json.has("access_token") && json != null) {
				if (json.has("userid")) {
					session.setAttribute("userid", json.getString("userid"));
				}
				if (json.has("expires")) {
					session.setAttribute("expires", json.getString("expires"));
				}
				session.setAttribute("token", json.getString("access_token"));
			}

			User user = new User(json.getString("access_token"));
			//获取当前用户信息
			String me = ju.decodeUnicode(user.me());
			String real_me = ju.decodeUnicode(user.realme());
			String verify_me = "";
			session.setAttribute("userInf", ju.toStuInf(me, real_me, verify_me));
			System.out.println("***1.text:" + text + "\n" + "***2.me：" + me + "\n" + "***3.real_me：" + real_me + "\n"
				+ "***4.verify_me：" + verify_me);
		} catch (Exception e) {
			System.out.println("text分解错误");
		}
		
	%>
	<div class="wrap-body">
		<!--------------Header--------------->
		<header>
		<div class="wrap-header zerogrid">
			<div class="row">
				<div class="col-1-3">
					<div id="logo">
						<a href="#"><img
							src="${pageContext.request.contextPath}/images/logo.png" /></a>
					</div>
				</div>
				<div class="col-2-3">
					<nav> <a class="toggleMenu" href="#">Menu</a>
					<ul class="menu">
						<li><a href="${pageContext.request.contextPath}/index.jsp">主页</a></li>
						<li><a
							href="${pageContext.request.contextPath}/html/single.html">关于我们</a></li>
					</ul>
					</nav>
				</div>

			</div>
		</div>
		</header>

		<!--------------Content--------------->
		<section class="container page-home">
		<div id="main-content" class="wrap-container zerogrid">
			<article>
			<div class="col-1-2 right">
				<img src="${pageContext.request.contextPath}/images/img01.jpg" />
			</div>
			<div class="col-1-2 left">
				<a class="art-category left" href="#">申请表</a>
				<div class="clear"></div>
				<div class="art-content">
					<h2>国家助学金申请</h2>
					<div class="info">2016年9月20日</div>
					<div class="line"></div>
					<p>为体现党和政府对普通本科高校、高等职业学校家庭经济困难学生的关怀，帮助他们顺利完成学业，根据
						《国务院关于建立健全普通本科高校、高等职业学校和中等职业学校家庭经济困难学生资助政策体系的意
						见》有关精神，财政部、教育部制定了...。</p>
					<a href="${pageContext.request.contextPath}/html/ZXJ_collect.html"
						class="more">我要申请</a>
				</div>
			</div>
			</article>
			<article>
			<div class="col-1-2">
				<img src="${pageContext.request.contextPath}/images/img02.jpg" />
			</div>
			<div class="col-1-2">
				<a class="art-category right" href="#">申请表</a>
				<div class="clear"></div>
				<div class="art-content">
					<h2>国家奖学金申请</h2>
					<div class="info">2016年9月20日</div>
					<div class="line"></div>
					<p>国家奖学金（National Scholarship）是指为了激励普通本科高校、高等职业学校和高等专科学校学生勤奋
						学习、努力进取，在德、智、体、美等方面全面发展，由中央政府出资设立的奖励特别优秀学生的奖学金。获奖
						比例约占0.2%，获奖学生每人奖励8000元。作为大学生获得国家奖学金是一项莫大的荣誉</p>
					<%--<a href="${pageContext.request.contextPath}/html/contact.jsp"--%><a href="${pageContext.request.contextPath}/html/ZXJ_collect1.html"
						class="more">我要申请</a>
				</div>
			</div>
			</article>
			<article>
			<div class="col-1-2 right">
				<img src="${pageContext.request.contextPath}/images/img03.jpg" />
			</div>
			<div class="col-1-2 left">
				<a class="art-category left" href="#">申请表</a>
				<div class="clear"></div>
				<div class="art-content">
					<h2>励志奖学金申请</h2>
					<div class="info">2016年9月20日</div>
					<div class="line"></div>
					<p>国家励志奖学金的基本申请条件：1.热爱社会主义祖国，拥护中国共产党的领导；2.遵守宪法和法律，遵守
						学校规章制度；3.诚实守信，道德品质优良；4.在校期间学习成绩优秀；5.家庭经济困难；6.社会能力，工作
						能力较强，有一定的群众基础；7.无其他不良嗜好和不适合该荣誉称号的表现。</p>
					<%--<a href="${pageContext.request.contextPath}/html/contact.jsp"--%><a href="${pageContext.request.contextPath}/html/ZXJ_collect2.html"
						class="more">我要申请</a>
				</div>
			</div>
			</article>
			<article>
			<div class="col-1-2">
				<img src="${pageContext.request.contextPath}/images/img04.jpg" />
			</div>
			<div class="col-1-2">
				<a class="art-category right" href="#">申请表</a>
				<div class="clear"></div>
				<div class="art-content">
					<h2>校奖学金申请</h2>
					<div class="info">2016年9月20日</div>
					<div class="line"></div>
					<p>申请基本条件： 1．热爱社会主义祖国，拥护中国共产党的领导和改革开放政策；2．遵守宪法、法律法规，遵守校纪校规，积极上进； 3．学习勤奋，态度端正； 
						4．尊敬师长，团结同学，关心集体，诚实守信；5．积极参加体育锻炼，达到《大学生体质健康标准》；  6．按期缴清学杂费并注册的在册学生</p>
					<%--<a href="${pageContext.request.contextPath}/html/contact.jsp"--%><a href="${pageContext.request.contextPath}/html/ZXJ_collect4.html"
						class="more">我要申请</a>
				</div>
			</div>
			</article>
		</div>

		<div id="pagination" class="clearfix">
			<ul>
				<li><a class="current" href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">next</a></li>
			</ul>
		</div>

		</section>
		<!--------------Footer--------------->
		<footer>
		<div class="wrap-footer zerogrid">
			<div class="row">
				<div class="col-full">
					<div class="wrap-col">
						<h1>易表格</h1>
						<br />
						<div class="menu-bottom">
							<ul>
								<li><a href="#">主页</a></li>
								<li><a
									href="${pageContext.request.contextPath}/html/single.html">关于我们</a></li>
							</ul>
							<div class="clear"></div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<p>
				Copyright © 2016 - <a
					href="${pageContext.request.contextPath}/html/single.html">电信网络文化工作室</a>
			</p>
		</div>
		</footer>

	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/navigation.js"></script>

</body>
</html>
