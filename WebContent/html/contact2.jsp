<%@ page language="java" import="java.util.*,bean.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>国家助学金申请</title> <meta http-equiv="pragma" content="no-cache">
	<meta name="author" content="HeLang">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zerogrid.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/component.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    <link href="${pageContext.request.contextPath}/css/jquery-ui.min.css" rel="stylesheet" type="text/css">

    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"
                 height="42" width="820"
                 alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <![endif]-->


</head>
<body>
 <% 
        StuInf stf = (StuInf)session.getAttribute("userInf");
    %>
	<div class="wrap-body">
		<a name="head"></a>
		<!--------------Header--------------->
		<header>
		<div class="wrap-header zerogrid">
			<div class="row">
				<div class="col-1-3">
					<div id="logo">
						<a href="#"><img src="${pageContext.request.contextPath}/images/logo.png" /></a>
					</div>
				</div>
				<div class="col-2-3">
					<nav> <a class="toggleMenu" href="#">Menu</a>
					<ul class="menu">
						<li><a href="${pageContext.request.contextPath}/index.jsp">主页</a></li>
						<li><a href="${pageContext.request.contextPath}/html/single.html">关于我们</a></li>
						<li><a href="${pageContext.request.contextPath}/html/ZXJ_collect.html">返回上一级</a></li>
					</ul>
					</nav>
				</div>

			</div>
		</div>
		</header>


		<!--------------Content--------------->
		<section class="container page-single">
		<div class="wrap-container zerogrid">
			<div class="col-2-3">
				<div id="main-content" class="wrap-col">
					<article>
					<div class="art-header">
						<h2>国家助学金申请</h2>
						<div class="line"></div>
					</div>
					<div class="art-content" id="art-content">
						<div id="contact_form">
							<form name="form1" id="ff" method="POST"
								onsubmit="return isIdCardNo()"
								action="HandServlet?method=contact2">

								<h3>第一部分：</h3>
								<p>陕西省高等学校国家助学金申请之学生本人基本情况：</p>

								<label> <span>姓名:</span> <input type="text"
									placeholder="请输入您的姓名" name="name" value="" required>
								</label> <label> <span>性别：</span> <input type="radio" name="sex"
									value="男" checked>男 <input type="radio" name="sex"
									value="女">女
								</label> <label> <span>出生日期</span> <input type="text"
									name="date" readonly="readonly" class="text" id="date" />
								</label> <label> <span>民族:</span> <select name="Snation">
										<option value="汉族">汉族</option>
										<option value="藏族">藏族</option>
										<option value="维吾尔族">维吾尔族</option>
										<option value="苗族">苗族</option>
										<option value="彝族">彝族</option>
										<option value="壮族">壮族</option>
										<option value="裕固族">裕固族</option>
										<option value="瑶族">瑶族</option>
										<option value="锡伯族">锡伯族</option>
										<option value="乌孜别克族">乌孜别克族</option>
										<option value="佤族">佤族</option>
										<option value="土家族">土家族</option>
										<option value="土族">土族</option>
										<option value="塔塔尔族">塔塔尔族</option>
										<option value="塔吉克族">塔吉克族</option>
										<option value="水族">水族</option>
										<option value="畲族">畲族</option>
										<option value="撒拉族">撒拉族</option>
										<option value="羌族">羌族</option>
										<option value="普米族">普米族</option>
										<option value="怒族">怒族</option>
										<option value="纳西族">纳西族</option>
										<option value="仫佬族">仫佬族</option>
										<option value="蒙古族">蒙古族</option>
										<option value="门巴族">门巴族</option>
										<option value="毛南族">毛南族</option>
										<option value="满族">满族</option>
										<option value="珞巴族">珞巴族</option>
										<option value="傈傈族">傈傈族</option>
										<option value="黎族">黎族</option>
										<option value="拉祜族">拉祜族</option>
										<option value="柯尔克孜族">柯尔克孜族</option>
										<option value="柯尔克孜族">景颇族</option>
										<option value="京族">京族</option>
										<option value="基诺族">基诺族</option>
										<option value="回族">回族</option>
										<option value="赫哲族">赫哲族</option>
										<option value="哈萨克族">哈萨克族</option>
										<option value="哈尼族">哈尼族</option>
										<option value="仡佬族">仡佬族</option>
										<option value="高山族">高山族</option>
										<option value="鄂温克族">鄂温克族</option>
										<option value="俄罗斯族">俄罗斯族</option>
										<option value="鄂伦春族">鄂伦春族</option>
										<option value="独龙族">独龙族</option>
										<option value="东乡族">东乡族</option>
										<option value="侗族">侗族</option>
										<option value="德昂族">德昂族</option>
										<option value="傣族">傣族</option>
										<option value="达翰尔族">达翰尔族</option>
										<option value="布依族">布依族</option>
										<option value="布朗族">布朗族</option>
										<option value="保安族">保安族</option>
										<option value="白族">白族</option>
										<option value="阿昌族">阿昌族</option>
								</select> <span>政治面貌:</span> <select name="identity">
								        <option value="共青团员">共青团员</option>
										<option value="党员">党员</option>
										<option value="群众">群众</option>
								</select>
								</label> <label> <span>入学时间</span> <input type="text"
									name="Cdate" readonly="readonly" class="text" id="Cdate" />
								</label> <label> <span>身份证号:</span> <input type="text"
									id="FIdNumber" placeholder="请输入18位身份证号码" name="FIdNumber"
									value="" required />
								</label> <label> <span>联系电话：</span> <input type="number"
									placeholder="家庭联系电话（座机请加区号）" id="PhoneNum" name="Fpho"
									value="" required>
								</label> <label> <span>学校:</span> <input type="text"
									placeholder="请选择所在学校" name="school" id="school" value="陕西科技大学"
									required>
								</label> <label> <span> 学院:</span> <select name="Sacademy">
										<option value="化工科学与工程学院">化工科学与工程学院</option>
										<option value="材料科学与工程学院">材料科学与工程学院</option>
										<option value="环境科学与工程学院">环境科学与工程学院</option>
										<option value="食品与生物工程学院">食品与生物工程学院</option>
										<option value="机电工程学院">机电工程学院</option>
										<option value="电气与信息工程学院">电气与信息工程学院</option>
										<option value="经济与管理学院">经济与管理学院</option>
										<option value="化学与化工学院">化学与化工学院</option>
										<option value="设计与艺术学院">设计与艺术学院</option>
										<option value="文理学院">文理学院</option>
										<option value="职业技术学院">职业技术学院</option>
								</select>
								</label> <label> <span>系:</span> <input type="text"
									placeholder="请输入所在系 如：计算机系" name="Sdptmt" id="Sdptmt"
									value="" required>
								</label> <label> <span>班级:</span> <input type="text"
									placeholder="请输入所在班级" name="SCless" id="SCless" value=""
									required>
								</label>

								<h3>第二部分：</h3>
								<p>陕西省高等学校国家助学金申请之家庭经济情况：</p>
								<label> <span>家庭户口：</span> <input type="radio"
									name="RPR" value="A.城镇√  B.农村">城镇 <input type="radio"
									name="RPR" value="A.城镇    B.农村√ " checked>农村
								</label> <label> <span>家庭总人数：</span> <input type="number"
									placeholder="请输入家庭总人数" name="Fullnum" value="">
								</label> <label> <span>家庭月总收入：</span> <input type="number"
									placeholder="请输入家庭总收入" name="Fullincome" value="">
								</label> <label> <span>人均月收入：</span> <input type="number"
									placeholder="请输入人均月收入" name="Sincome" value="">
								</label> <label> <span>收入来源：</span> <input type="text"
									placeholder="请输入收入来源" name="Socinc" value="">
								</label> <label> <span>家庭住址：</span> <input type="text"
									placeholder="请输入家庭住址" name="address" value="">
								</label> <label> <span>邮政编码：</span> <input type="number"
									placeholder="请输入邮政编码" name="PostCode" value="">
								</label>


								<h3>第三部分：</h3>
								<p>陕西省高等学校国家助学金申请之家庭成员情况：</p>
								<div id="part3">
									<label> <span>姓名：</span> <input type="text"
										placeholder="请输入该家庭成员姓名" name="FMName1" value="" required>
									</label> <label> <span>年龄：</span> <input type="number"
										placeholder="请输入该家庭成员年龄" maxlength="3" minlength="1"
										value="" name="FMAge1" required>
									</label> <label> <span>与本人关系:</span> <select name="relative1">
											<option value="父">父</option>
											<option value="母">母</option>
											<option value="亲属">亲属</option>
											<option value="其他">其他</option>
									</select>
									</label> <label> <span>工作或学习单位：</span> <input type="text"
										placeholder="请如实填写，务农和无业请填写本人家庭地址" name="FMWork1" value=""
										required>
									</label>

								</div>

								<input type="button" onclick="CreateMumber2()"
									value="+ 添加一个家庭成员">

								<h3>第四部分：</h3>
								<p>陕西省高等学校国家助学金申请之申请理由：</p>
								<label> <textarea name="reason"
										placeholder="请认真填写生情理由，内容不超过200字。"></textarea>
								</label> <input class="sendButton" type="submit" name="submit"
									value="提&nbsp;&nbsp;交"> <input type="hidden"
									name="filename" value="AFSG">
							</form>
						</div>
					</div>
					</article>
				</div>
			</div>
			<div class="col-1-3">
				<div id="sidebar" class="wrap-col">
					<div class="widget">
						<div class="wid-header">
							<h1>使用指南</h1>
						</div>
						<div class="wid-content">
							<p>&nbsp;&nbsp;&nbsp;&nbsp;用户通过填写表单，然后将表单内容写入到Word中并自动生成一个word文档，
								解决的主要问题是在传统填写表格中有很多的格式问题是很难控制好的，所以通过表单的形式，引入下拉
								菜单以及JavaScript校验机制，通过正则表达式进行判定匹配，简化填写内容，比如对身份证的校验，可
								以减少对性别、年龄、出生年月日、以及籍贯的填写。</p>
						</div>
					</div>

					<div class="widget wid-posts">
						<div class="wid-header">
							<h4>相关申请</h4>
						</div>
						<div class="wid-content">
							<div class="post">
								<a href="#"><img src="${pageContext.request.contextPath}/images/img02.jpg" /></a>
								<h6>
									<a href="#">国家奖学金申请</a>
								</h6>
								<p>2016年09月21日</p>
							</div>
							<div class="post">
								<a href="#"><img src="${pageContext.request.contextPath}/images/img03.jpg" /></a>
								<h6>
									<a href="#">励志奖学金申请</a>
								</h6>
								<p>2016年09月21日</p>
							</div>
							<div class="post">
								<a href="#"><img src="${pageContext.request.contextPath}/images/img04.jpg" /></a>
								<h6>
									<a href="#">校园奖学金申请</a>
								</h6>
								<p>2016年09月21日</p>
							</div>
						</div>
					</div>
					<div class="widget wid-label">
						<div class="wid-header">
							<h4>联系我们</h4>
						</div>
						<div class="wid-content">
							<span>联系邮箱：sust_helang@126.com</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a href="#head"><button id="backTop">返回顶端</button></a> </section>
		<!--------------Footer--------------->
		<footer>
		<div class="wrap-footer zerogrid">
			<div class="row">
				<div class="col-full">
					<div class="wrap-col">
						<h1>zSarah</h1>
						<p>Free Html5 Templates - Zerotheme.com</p>
						<div class="menu-bottom">
							<ul>
								<li><a href="#">主页</a></li>
								<li><a href="${pageContext.request.contextPath}/html/single.html">关于我们</a></li>
							</ul>
							<div class="clear"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<p>Copyright © 2016 - 电信网络文化工作室</p>
		</div>
		</footer>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/navigation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/art-content.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script>
</body>
</html>
