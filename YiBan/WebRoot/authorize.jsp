<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.util.*,sust.util.*"
	pageEncoding="UTF-8"%>
<%@ page import="cn.yiban.open.*,net.sf.json.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>authorize</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
-->
</head>

<body>
	<%
		//定义应用信息
		String appKey = "95ff6c7b09a18cc2";
		String appSecret = "304b843970610ef37d78e1a4b22b72e8";
		String callbackurl = "http://127.0.0.1:8080/YiBan/index.jsp";

		Authorize au = new Authorize(appKey, appSecret);
		String code = request.getParameter("code");
		if (code == null || code.isEmpty()) {
			String url = au.forwardurl(callbackurl, "test", Authorize.DISPLAY_TAG_T.WEB);
			response.sendRedirect(url);
		} else {
			session.setAttribute("text", au.querytoken(code, callbackurl));	
		}
	%>

</body>
</html>
