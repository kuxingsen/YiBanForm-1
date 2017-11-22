<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>陕西省在校大学生生源地信用助学贷款申请审批表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .row {
            margin-bottom: 20px;
        }

        .row .row {
            margin-bottom: 0px;
            margin-top: 20px;
        }

        [class*="col-"] {
            padding-top: 15px;
            padding-bottom: 15px;
            background-color: rgba(255, 255, 255, 0.81);
            border: 1px solid rgba(198, 198, 198, 0.81);
        }

        [class*="col-xm-12"] {
            font-size: 40px;
        }

        .input_out {
            width: 200px;
            height: auto;
            background-color: black;
            color: white;
            border-radius: 5px;
        }

        .input_move {
            width: 200px;
            height: 85%;
            background-color: white;
            color: black;
            border-radius: 5px;
        }

        label h3 {
            color: black;
        }

        @media (min-width: 600px) {
            .header img {
                width: 610px;
                margin: 0px auto 0px;
            }

            .bottom img {
                width: 610px;
                margin: 0px auto;
            }
        }

        @media (min-width: 800px) {
            .header img {
                width: 810px;
                margin: 0px auto 0px;
            }

            .bottom img {
                width: 810px;
                margin: 0px auto;
            }
        }

        @media (min-width: 1000px) {
            .header img {
                width: 1110px;
                margin: 0px auto 0px;
            }

            .bottom img {
                width: 1110px;
                margin: 0px auto;
            }
        }

        @media (min-width: 1200px) {
            .header img {
                width: 1210px;
                height: auto;
                padding: 0px;
            }

            .bottom img {
                width: 1210px;
                height: auto;
                padding: 0px;
            }
        }

        @media (min-width: 1400px) {
            .header img {
                width: 1410px;
                margin: 0px auto 0px;
            }

            .bottom img {
                width: 1410px;
                margin: 0px auto;
            }
        }

        #transform {
            width: 40px;
            height: 100px;
            position: absolute;
            top: 500px;
            right: 10px;
            background-color: grey;
            font-size: 30px;
        }

        #transform a {
            text-decoration: none;
            color: #222222;
        }
    </style>
    <script>
        //校验
        function checkSubmit(){
            if ( confirm("确认提交表单吗？")){
                var your_name = form.name.value;
                var your_postf = form.postf.value.length;
                var your_postm = form.postm.value.length;
                var your_posto = form.posto.value.length;
                var your_ID = form.idcard.value.length;
                var your_IDF = form.idcardf.value.length;
                var your_IDM = form.idcardm.value.length;
                var your_IDO = form.idcardo.value.length;
                var your_phonef = form.phonef.value.length;
                var your_phonem = form.phonem.value.length;
                var your_phoneo = form.phoneo.value.length;
                if( your_name == "" ){
                    alert("请填写您的名字！");
                    form.name.focus();
                    return false;
                }
                if( your_ID !== 18){
                    alert("ID不规范请重新输入！");
                    form.idcard.focus();
                    return false;
                }
                if( your_IDF !== 18 && your_IDF > 0){
                    alert("ID不规范请重新输入！");
                    form.idcardf.focus();
                    return false;
                }
                if( your_IDM !== 18 && your_IDF > 0){
                    alert("ID不规范请重新输入！");
                    form.idcardm.focus();
                    return false;
                }
                if( your_IDO !== 18 && your_IDF > 0){
                    alert("ID不规范请重新输入！");
                    form.idcardo.focus();
                    return false;
                }
                if( your_postf !== 6 && your_postf > 0){
                    alert("邮编不规范请重新输入！");
                    form.postf.focus();
                    return false;
                }
                if( your_postm !== 6 && your_postm > 0){
                    alert("邮编不规范请重新输入！");
                    form.postm.focus();
                    return false;
                }
                if( your_posto !== 6 && your_posto > 0){
                    alert("邮编不规范请重新输入！");
                    form.posto.focus();
                    return false;
                }

                if( your_phonef  !== 11 && your_phonef  > 0&&your_phonef !== 8){
                    alert("电话号码不规范请重新输入！");
                    form.phonef.focus();
                    return false;
                }
                if( your_phonem !== 11 && your_phonem > 0&&your_phonem !== 8){
                    alert("电话号码不规范请重新输入！");
                    form.phonem.focus();
                    return false;
                }
                if( your_phoneo !== 11 && your_phoneo > 0&&your_phoneo !== 8){
                    alert("电话号码不规范请重新输入！");
                    form.phoneo.focus();
                    return false;
                }
            } else {
                return true;
            }
        }

        //获取外部CSS样式操作
        function getStyle(obj, attr) {
            if (obj.currentStyle) {
                return obj.currentStyle[attr];
            }
            else {
                return getComputedStyle(obj, false)[attr];
            }
        }
        //侧边栏浮动
        var timer = null;
        function move(end) {
            clearInterval(timer);       //首先，先关闭之前如果有开启的setInterval;
            timer = setInterval(function () {
                var oDiv = document.getElementById("transform");
                var speed = (end - oDiv.offsetTop) / 5;     //计算DIV要走的速度，DIV要走的速度就等于（终点-offsetTop高度）/缩放系数
                speed = speed > 0 ? Math.ceil(speed) : Math.floor(speed);       //为了避免小数，将其取整
                if (oDiv.offsetTop == end) {        //当DIV到达终点，则关闭setInterval;
                    clearInterval(timer);
                }
                else {
                    oDiv.style.top = oDiv.offsetTop + speed + 'px';     //移动div
                }
            }, 30);
        }
        window.onscroll = function () {
            var oDiv = document.getElementById("transform");
            //获取移动高度
            var DivScroll = document.documentElement.scrollTop || document.body.scrollTop;
            //调用传参，其中里面的参数是DIV要走的终点。也就是（可视高度-DIV高度）/2+移动高度
            move(parseInt((document.documentElement.clientHeight - oDiv.offsetHeight) / 2 + DivScroll));
        };

    </script>
</head>
<body>
<div id="transform">
    <button><a href="${pageContext.request.contextPath}/index.jsp">返回首页</a></button>
</div>
<div class="header" id="header">
    <img src="${pageContext.request.contextPath}/images/header.png">
</div>
<div class="container" id="container">
    <form method="POST" name="form" action="HandServlet?method=model2" onsubmit="return checkSubmit();">
        <div class="form-inline">
            <div class="row" style="background-color: black; color: white">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <h3 class="text-center">陕西省在校大学生生源地信用助学贷款申请审批表</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>姓名：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="name">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <label>性别：</label>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="radio">
                        <label>
                            <input type="radio" name="sex" value="男" checked>
                            男
                        </label>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="radio">
                        <label>
                            <input type="radio" name="sex" value="女">
                            女
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <label>民族：</label>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <select class="form-control" name="nation">
                        <option value="汉族">汉族</option>
                        <option value="回族">回族</option>
                        <option value="苗族">苗族</option>
                        <option value="壮族">壮族</option>
                        <option value="羌族">羌族</option>
                        <option value="内蒙古族">内蒙古族</option>
                        <option value="维吾尔族">维吾尔族</option>
                    </select>
                </div>

                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>身份证号：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" id="idcard" name="idcard" placeholder="请输入18位身份证号">
                    </div>
                </div>

                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>录取学校：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="school" value="陕西科技大学">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>院系：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="academy" value="电气与信息工程学院">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>专业：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="major" value="计算机科学与技术">
                    </div>
                </div>

                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>报到时间：</label>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <select class="form-control" name="year">
                            <option value="2016">2016年</option>
                            <option value="2015">2015年</option>
                            <option value="2014">2014年</option>
                            <option value="2013">2013年</option>
                            <option value="2012">2012年</option>
                            <option value="2011">2011年</option>
                            <option value="2010">2010年</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <select class="form-control" name="month">
                            <option value="01月">1月</option>
                            <option value="02月">2月</option>
                            <option value="03月">3月</option>
                            <option value="04月">4月</option>
                            <option value="05月">5月</option>
                            <option value="06月">6月</option>
                            <option value="07月">7月</option>
                            <option value="08月">8月</option>
                            <option value="09月">9月</option>
                            <option value="10月">10月</option>
                            <option value="11月">11月</option>
                            <option value="12月">12月</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>学历：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <select class="form-control" name="educat">
                            <option value="大专">大专</option>
                            <option value="本科">本科</option>
                            <option value="硕士研究生">硕士研究生</option>
                            <option value="博士研究生">博士研究生</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>学制：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <select class="form-control" name="lfs">
                            <option value="3年">3年</option>
                            <option value="4年">4年</option>
                            <option value="5年">5年</option>
                            <option value="6年">6年</option>
                            <option value="7年">7年</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>政治面貌：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <select class="form-control" name="polit">
                            <option value="团员">团员</option>
                            <option value="党员">党员</option>
                            <option value="群众">群众</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row" style="background-color: black; color: white">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <label>家庭主要成员情况(选填)</label>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>称谓：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <label>父亲</label>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>姓名:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="namef" placeholder="输入家庭成员姓名">
                    </div>
                </div>

                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>邮政编码：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="postf" placeholder="请输入6位邮政编码">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>身份证号：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="idcardf" placeholder="请输入18位身份证号">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>联系电话：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="phonef" placeholder="请输入手机号（不少于11位）"
                               style="width: 99%">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>月均收入:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="incomef" placeholder="输入家庭成员月均收入（如：1000元）">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-4">
                    <div class="form-group">
                        <label>家庭或工作单位地址：</label>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="address" placeholder="精确到门牌号">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>称谓：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <label>母亲</label>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>姓名:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="namem" placeholder="输入家庭成员姓名">
                    </div>
                </div>

                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>邮政编码：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="postm" placeholder="请输入6位邮政编码">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>身份证号：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="idcardm" placeholder="请输入18位身份证号">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>联系电话：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="phonem" placeholder="请输入手机号（不少于11位）"
                               style="width: 99%">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>月均收入:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="incomem" placeholder="输入家庭成员月均收入（如：1000元）">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-4">
                    <div class="form-group">
                        <label>家庭或工作单位地址：</label>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="addressm" placeholder="精确到门牌号">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>称谓：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <label>其他监护人（选填）</label>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>姓名:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="nameo" placeholder="输入家庭成员姓名">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>邮政编码：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="posto" placeholder="请输入6位邮政编码">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>身份证号：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="idcardo" placeholder="请输入18位身份证号">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>联系电话：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="phoneo" placeholder="请输入手机号（不少于11位）"
                               style="width: 99%">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>月均收入:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="incomeo" placeholder="输入家庭成员月均收入（如：1000元）">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-4">
                    <div class="form-group">
                        <label>家庭或工作单位地址：</label>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="addresso" placeholder="精确到门牌号">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <label>困难程度：</label>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="radio">
                        <label>
                            <input type="radio" name="diff" value="●特困 ◎一般困难" checked>
                            特困
                        </label>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="radio">
                        <label>
                            <input type="radio" name="diff" value="◎特困 ●一般困难">
                            一般困难
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <label>思想品德：</label>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2">
                    <div class="radio">
                        <label>
                            <input type="radio" name="think" value="●优秀  ◎良好  ◎一般  ◎差" checked>
                            优秀
                        </label>
                    </div>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2">
                    <div class="radio">
                        <label>
                            <input type="radio" name="think" value="◎优秀  ●良好  ◎一般  ◎差">
                            良好
                        </label>
                    </div>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2">
                    <div class="radio">
                        <label>
                            <input type="radio" name="think" value="◎优秀  ◎良好  ●一般  ◎差">
                            一般
                        </label>
                    </div>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2">
                    <div class="radio">
                        <label>
                            <input type="radio" name="think" value="◎优秀  ◎良好  ◎一般  ●差">
                            差
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>年学费</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="sfee" placeholder="年学费（如：4500元）">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>年住宿费</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="dfee" placeholder="住宿费（如：1000元）">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>年最低生活费</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="lfee" placeholder="年最低生活费（如：1000元）">
                    </div>
                </div>
            </div>
            <div id="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group">
                        <textarea class="form-control" name="reason" rows="5" cols="48" placeholder="家庭经济困难情况简要说明..."></textarea>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <input class="input_out" type="submit" value="提&nbsp;&nbsp;交"
                       onmousemove="this.className='input_move'" onmouseout="this.className='input_out'">
            </div>
        </div>
        </div>
        <input type="hidden" name="filename" value="SOSAF"> 
        
    </form>
</div>
<div class="bottom" id="bottom">
    <img src="${pageContext.request.contextPath}/images/bottom.png">
</div>

<script src="${pageContext.request.contextPath}/js/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>
