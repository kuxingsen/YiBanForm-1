<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>下载填写文档</title>
<style>
a {
	text-decoration: none;
	color: #222222;
}

button {
	font-size: 20px;
	border-radius: 8px;
	height: 100px;
	width: 250px;
}

button:hover {
	color: #ffffff;
	background-color: #333333;
}

.di {
	margin: 0 auto;
	width: 400px;
	height: 400px;
}

p {
	font-size: 15px;
	text-align: center;
}
</style>
</head>
<body>
	<%
		//out.println("1.文件名：" + session.getAttribute("fileName") + "<br>2.文件路径：" + session.getAttribute("filePath"));
	%>
	<div class="di">
		<a
			href="./DownloadServlet?filename=<%=session.getAttribute("fileName")%>">
			<button>
				点击下载
				<p><%=session.getAttribute("fileName")%></p>
			</button>
		</a> <br> <br> <a href="index.html">
			<button>返回首页</button>
		</a>
	</div>

</body>
</html>