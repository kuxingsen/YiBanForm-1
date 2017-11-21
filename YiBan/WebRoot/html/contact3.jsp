<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高等学校建档立卡贫困户子女情况证明表</title>
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
        #transform{
            width: 40px;
            height: 100px;
            position: absolute;
            top: 500px;
            right: 10px;
            background-color: grey;
            font-size: 30px;
        }
        #transform a{
            text-decoration: none;
            color: #222222;
        }
    </style>
    <script>
        //校验
        function checkSubmit(){
            if ( confirm("确认提交表单吗？")){
                var your_name = form.name.value;
                var your_ID = form.idcard.value.length;
                var your_post = form.postcode.value.length;
                var your_tel = form.tel.value.length;
                var your_sphone = form.sphone.value.length;
                var your_phonenum = form.phonenum.value.length;
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
                if( your_post !== 6){
                    alert("邮编不规范请重新输入！");
                    form.postcode.focus();
                    return false;
                }
                if( your_sphone !== 11&&your_sphone  !== 11 && your_sphone  > 0){
                    alert("家庭通讯电话号码不规范请重新输入！");
                    form.sphone.focus();
                    return false;
                }
                if( your_tel !== 8 && your_tel !== 11 && your_tel  > 0){
                    alert("家庭通讯电话号码不规范请重新输入！");
                    form.tel.focus();
                    return false;
                }
                if( your_phonenum !== 11 && your_phonenum !== 8 && your_phonenum > 0){
                    alert("家庭成员电话号码不规范请重新输入！");
                    form.phonenum.focus();
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
    <form method="POST" name="form" action="HandServlet?method=model1" onsubmit="return checkSubmit();">
        <div class="form-inline">
            <div class="row" style="background-color: black; color: white">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <h3 class="text-center">高等学校建档立卡贫困户子女情况证明表</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>学校：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="school" value="陕西科技大学">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>院（系）：</label>
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
            </div>
            <div class="row" style="background-color: black; color: white">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <label>学生本人基本情况</label>
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
                    <label>出生年月：</label>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <select class="form-control" name="biry">
                        <option value="1990">1990年</option>
                        <option value="1991">1991年</option>
                        <option value="1992">1992年</option>
                        <option value="1993">1993年</option>
                        <option value="1994">1994年</option>
                        <option value="1995">1995年</option>
                        <option value="1996">1996年</option>
                        <option value="1997">1996年</option>
                        <option value="1998">1996年</option>
                        <option value="1999">1996年</option>
                        <option value="2000">1996年</option>
                    </select>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2">
                    <select class="form-control" name="birm">
                        <option value="01">1月</option>
                        <option value="02">2月</option>
                        <option value="03">3月</option>
                        <option value="04">4月</option>
                        <option value="05">5月</option>
                        <option value="06">6月</option>
                        <option value="07">7月</option>
                        <option value="08">8月</option>
                        <option value="09">9月</option>
                        <option value="10">10月</option>
                        <option value="11">11月</option>
                        <option value="12">12月</option>
                    </select>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <select class="form-control" name="bird" style="margin-left: 20px">
                        <option value="01">1号</option>
                        <option value="02">2号</option>
                        <option value="03">3号</option>
                        <option value="04">5号</option>
                        <option value="06">7号</option>
                        <option value="08">9号</option>
                        <option value="10">10号</option>
                        <option value="11">11号</option>
                        <option value="12">12号</option>
                        <option value="13">13号</option>
                        <option value="14">14号</option>
                        <option value="15">15号</option>
                        <option value="16">16号</option>
                        <option value="17">17号</option>
                        <option value="18">18号</option>
                        <option value="19">19号</option>
                        <option value="20">20号</option>
                        <option value="21">21号</option>
                        <option value="22">22号</option>
                        <option value="23">23号</option>
                        <option value="24">24号</option>
                        <option value="25">25号</option>
                        <option value="26">26号</option>
                        <option value="27">27号</option>
                        <option value="28">28号</option>
                        <option value="29">29号</option>
                        <option value="30">30号</option>
                        <option value="31">31号</option>
                    </select>
                </div>
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
                        <input type="text" class="form-control" name="idcard" placeholder="请输入18位身份证号">
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
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>入学前户口：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="rpr" placeholder="入学前户口所在地">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>家庭人口数：</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="fnum" placeholder="家庭人口数">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-5 col-sm-5 col-md-4">
                    <div class="form-group">
                        <label>家庭人均收入：</label>
                    </div>
                </div>
                <div class="col-xs-7 col-sm-7 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="facome" placeholder="家庭人均收入">
                    </div>
                </div>
                <div class="col-xs-5 col-sm-5 col-md-4">
                    <div class="form-group">
                        <label>高中毕业学校：</label>
                    </div>
                </div>
                <div class="col-xs-7 col-sm-7 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="gftss" placeholder="高中毕业学校">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <label>孤残：</label>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="radio">
                        <label>
                            <input type="radio" name="oad" value="是" checked>
                            是
                        </label>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="radio">
                        <label>
                            <input type="radio" name="oad" value="否">
                            否
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <label>单亲：</label>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="radio">
                        <label>
                            <input type="radio" name="sinp" value="是" checked>
                            是
                        </label>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="radio">
                        <label>
                            <input type="radio" name="sinp" value="否">
                            否
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <label>烈士或优抚对象子女：</label>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <div class="radio">
                        <label>
                            <input type="radio" name="martyr" value="是" checked>
                            是
                        </label>
                    </div>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <div class="radio">
                        <label>
                            <input type="radio" name="martyr" value="否">
                            否
                        </label>
                    </div>
                </div>
            </div>
            <div class="row" style="background-color: black; color: white">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <label>家庭通讯信息</label>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-5 col-sm-5 col-md-5">
                    <div class="form-group">
                        <label>详细通讯地址：</label>
                    </div>
                </div>
                <div class="col-xs-7 col-sm-7 col-md-7">
                    <div class="form-group">
                        <input type="text" class="form-control" name="address" placeholder="精确到门牌号">
                    </div>
                </div>
                <div class="col-xs-5 col-sm-5 col-md-5">
                    <div class="form-group">
                        <label>邮政编码：</label>
                    </div>
                </div>
                <div class="col-xs-7 col-sm-7 col-md-7">
                    <div class="form-group">
                        <input type="text" class="form-control" name="postcode" placeholder="请输入六位邮编">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="form-group">
                        <label>联系电话：</label>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-4">
                    <div class="form-group">
                        <input type="text" class="form-control" name="tel" placeholder="座机号（含区号"
                               style="width: 99%">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-4">
                    <div class="form-group">
                        <input type="text" class="form-control" name="sphone" placeholder="手机号"
                               style="width: 99%">
                    </div>
                </div>
            </div>
            <div class="row" style="background-color: black; color: white">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <label>家庭成员情况</label>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>姓名:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="fname" placeholder="输入家庭成员姓名">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>年龄:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="old" placeholder="输入家庭成员年龄">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>职业:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="job" placeholder="输入家庭成员职业">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>年收入（元）:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="income" placeholder="输入家庭成员年收入（元）">
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <div class="form-group">
                        <label>联系电话:</label>
                    </div>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <div class="form-group">
                        <input type="text" class="form-control" name="phonenum" placeholder="输入家庭成员联系电话">
                    </div>
                </div>
                <div class="col-xs-5 col-sm-5 col-md-5">
                    <div class="form-group">
                        <label>与学生关系:</label>
                    </div>
                </div>
                <div class="col-xs-7 col-sm-7 col-md-7">
                    <div class="form-group">
                        <input type="text" class="form-control" name="relation" placeholder="输入家庭成员与学生关系">
                    </div>
                </div>
                <div class="col-xs-5 col-sm-5 col-md-5">
                    <div class="form-group">
                        <label>工作（学习）单位:</label>
                    </div>
                </div>
                <div class="col-xs-7 col-sm-7 col-md-7">
                    <div class="form-group">
                        <input type="text" class="form-control" name="office" placeholder="输入家庭成员工作（学习）单位">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group">
                        <input class="input_out" type="submit" value="提&nbsp;&nbsp;交"
                               onmousemove="this.className='input_move'" onmouseout="this.className='input_out'">
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="filename" value="POPF"> 
    </form>
</div>
<div class="bottom" id="bottom">
    <img src="${pageContext.request.contextPath}/images/bottom.png">
</div>

<script src="${pageContext.request.contextPath}/js/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>