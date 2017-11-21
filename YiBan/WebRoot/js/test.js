/**
 * Created by asus on 2016/9/24.
 */
var i = 2;
function Check() {
    // isIdCardNo();
    var PhoneNumID=document.getElementById("PhoneNum");
    var PhoneNum=PhoneNumID.value;
    if(PhoneNum.length!=11){
        alert("电话号码填写有误！座机请加区号");
        PhoneNumID.focus();
    }
    var PostNumID=document.getElementById("PhoneNum");
    var PostNum=PostNumID.value;
    if(PostNum.length!=11){
        alert("邮政编码填写有误！请重新填写！");
        PostNumID.focus();
    }
}

function CreateMumber() {
    if (i < 6) {
        //添加家庭成员需要的label节点标签
        var Nlabel = document.createElement("label");
        var Alabel = document.createElement("label");
        var Rlabel = document.createElement("label");
        var Wlabel = document.createElement("label");
        var Jlabel = document.createElement("label");
        var Ilabel = document.createElement("label");
        var Hlabel = document.createElement("label");
        //添加家庭成员需要的form节点标签
        var Ninput = document.createElement("input");
        var Ainput = document.createElement("input");
        var Rselect = document.createElement("select");
        var Winput = document.createElement("input");
        var Jinput = document.createElement("input");
        var Iinput = document.createElement("input");
        var Hinput = document.createElement("input");
        //添加家庭成员需要的文本节点标签
        var Nspan = document.createElement("span");
        var Aspan = document.createElement("span");
        var Rspan = document.createElement("span");
        var Wspan = document.createElement("span");
        var Jspan = document.createElement("span");
        var Ispan = document.createElement("span");
        var Hspan = document.createElement("span");
        //创建家庭成员的选择节点
        var option1 = document.createElement("option");
        var option2 = document.createElement("option");
        var option3 = document.createElement("option");
        var option4 = document.createElement("option");
        //需要添加的文本节点内容
        var name = document.createTextNode("姓名：");
        var Age = document.createTextNode("年龄：");
        var Relative = document.createTextNode("与学生关系：");
        var Office = document.createTextNode("工作（学习）单位：");
        var Job = document.createTextNode("职业：");
        var Income = document.createTextNode("年收入（元）：");
        var BodyHealth = document.createTextNode("健康状况：");
        var Rel1 = document.createTextNode("父");
        var Rel2 = document.createTextNode("母");
        var Rel3 = document.createTextNode("亲属");
        var Rel4 = document.createTextNode("其他");
        //将要插入的父级块找到
        var Part3 = document.getElementById("part3");

        //给姓名节点添加文本
        Nspan.appendChild(name);
        //给input节点添加属性
        Ninput.setAttribute("type", "text");
        Ninput.setAttribute("placeholder", "请输入该家庭成员姓名");
        Ninput.setAttribute("name", "FMName" + i);
        Ninput.setAttribute("required", true);
        Nlabel.appendChild(Nspan);
        Nlabel.appendChild(Ninput);
        Part3.appendChild(Nlabel);

        //给年龄节点添加文本
        Aspan.appendChild(Age);
        //给input节点添加属性
        Ainput.setAttribute("type", "number");
        Ainput.setAttribute("maxlength", "3");
        Ainput.setAttribute("minlength", "1");
        Ainput.setAttribute("placeholder", "请输入该家庭成员年龄");
        Ainput.setAttribute("name", "FMAge" + i);
        Ainput.setAttribute("required", true);
        Alabel.appendChild(Aspan);
        Alabel.appendChild(Ainput);
        Part3.appendChild(Alabel);

        //给学生关系节点添加文本
        Rspan.appendChild(Relative);
        //给input节点添加属性
        Rselect.setAttribute("name", "relative" + i);
        option1.appendChild(Rel1);
        option1.setAttribute("value", "父");
        option2.appendChild(Rel2);
        option2.setAttribute("value", "母");
        option3.appendChild(Rel3);
        option3.setAttribute("value", "亲属");
        option4.appendChild(Rel4);
        option4.setAttribute("value", "其他");
        Rselect.appendChild(option1);
        Rselect.appendChild(option2);
        Rselect.appendChild(option3);
        Rselect.appendChild(option4);
        Rlabel.appendChild(Rspan);
        Rlabel.appendChild(Rselect);
        Part3.appendChild(Rlabel);

        //给工作节点添加文本
        Wspan.appendChild(Office);
        //给input节点添加属性
        Winput.setAttribute("type", "text");
        Winput.setAttribute("placeholder", "请如实填写，务农和无业请填写本人家庭地址");
        Winput.setAttribute("name", "FMWork" + i);
        Winput.setAttribute("required", true);
        Wlabel.appendChild(Wspan);
        Wlabel.appendChild(Winput);
        Part3.appendChild(Wlabel);

        //给职业节点添加文本
        Jspan.appendChild(Job);
        //给input节点添加属性
        Jinput.setAttribute("type", "text");
        Jinput.setAttribute("placeholder", "请如实填写，务农和无业请填写本人家庭地址");
        Jinput.setAttribute("name", "FMJob" + i);
        Jinput.setAttribute("required", true);
        Jlabel.appendChild(Jspan);
        Jlabel.appendChild(Jinput);
        Part3.appendChild(Jlabel);

        //给年龄节点添加文本
        Ispan.appendChild(Income);
        //给input节点添加属性
        Iinput.setAttribute("type", "number");
        Iinput.setAttribute("maxlength", "4");
        Iinput.setAttribute("placeholder", "请输入年收入(5000以下)");
        Iinput.setAttribute("name", "FIncome" + i);
        Iinput.setAttribute("required", true);
        Ilabel.appendChild(Ispan);
        Ilabel.appendChild(Iinput);
        Part3.appendChild(Ilabel);

        //给健康状况节点添加文本
        Hspan.appendChild(BodyHealth);
        //给input节点添加属性
        Hinput.setAttribute("type", "text");
        Hinput.setAttribute("placeholder", "请输入该家庭成员健康状况");
        Hinput.setAttribute("name", "FMH" + i);
        Hinput.setAttribute("required", true);
        Hlabel.appendChild(Hspan);
        Hlabel.appendChild(Hinput);
        Part3.appendChild(Hlabel);
        i++;
    }
    else {
        alert("已达人数上限，不可新添家庭成员！")
    }
}

function CreateMumber2() {
    if (i < 6) {
        //添加家庭成员需要的label节点标签
        var Nlabel = document.createElement("label");
        var Alabel = document.createElement("label");
        var Rlabel = document.createElement("label");
        var Wlabel = document.createElement("label");
        //添加家庭成员需要的form节点标签
        var Ninput = document.createElement("input");
        var Ainput = document.createElement("input");
        var Rselect = document.createElement("select");
        var Winput = document.createElement("input");
        //添加家庭成员需要的文本节点标签
        var Nspan = document.createElement("span");
        var Aspan = document.createElement("span");
        var Rspan = document.createElement("span");
        var Wspan = document.createElement("span");
        //创建家庭成员的选择节点
        var option1 = document.createElement("option");
        var option2 = document.createElement("option");
        var option3 = document.createElement("option");
        var option4 = document.createElement("option");
        //需要添加的文本节点内容
        var name = document.createTextNode("姓名：");
        var Age = document.createTextNode("年龄：");
        var Relative = document.createTextNode("与学生关系：");
        var Office = document.createTextNode("工作或学习单位：");
        var Rel1 = document.createTextNode("父");
        var Rel2 = document.createTextNode("母");
        var Rel3 = document.createTextNode("亲属");
        var Rel4 = document.createTextNode("其他");
        //将要插入的父级块找到
        var Part3 = document.getElementById("part3");

        //给姓名节点添加文本
        Nspan.appendChild(name);
        //给input节点添加属性
        Ninput.setAttribute("type", "text");
        Ninput.setAttribute("placeholder", "请输入该家庭成员姓名");
        Ninput.setAttribute("name", "FMName" + i);
        Ninput.setAttribute("required", true);
        Nlabel.appendChild(Nspan);
        Nlabel.appendChild(Ninput);
        Part3.appendChild(Nlabel);

        //给年龄节点添加文本
        Aspan.appendChild(Age);
        //给input节点添加属性
        Ainput.setAttribute("type", "number");
        Ainput.setAttribute("maxlength", "3");
        Ainput.setAttribute("minlength", "1");
        Ainput.setAttribute("placeholder", "请输入该家庭成员年龄");
        Ainput.setAttribute("name", "FMAge" + i);
        Ainput.setAttribute("required", true);
        Alabel.appendChild(Aspan);
        Alabel.appendChild(Ainput);
        Part3.appendChild(Alabel);

        //给学生关系节点添加文本
        Rspan.appendChild(Relative);
        //给input节点添加属性
        Rselect.setAttribute("name", "relative" + i);
        option1.appendChild(Rel1);
        option1.setAttribute("value", "父");
        option2.appendChild(Rel2);
        option2.setAttribute("value", "母");
        option3.appendChild(Rel3);
        option3.setAttribute("value", "亲属");
        option4.appendChild(Rel4);
        option4.setAttribute("value", "其他");
        Rselect.appendChild(option1);
        Rselect.appendChild(option2);
        Rselect.appendChild(option3);
        Rselect.appendChild(option4);
        Rlabel.appendChild(Rspan);
        Rlabel.appendChild(Rselect);
        Part3.appendChild(Rlabel);

        //给工作节点添加文本
        Wspan.appendChild(Office);
        //给input节点添加属性
        Winput.setAttribute("type", "text");
        Winput.setAttribute("placeholder", "请如实填写，务农和无业请填写本人家庭地址");
        Winput.setAttribute("name", "FMWork" + i);
        Winput.setAttribute("required", true);
        Wlabel.appendChild(Wspan);
        Wlabel.appendChild(Winput);
        Part3.appendChild(Wlabel);
        i++;
    }
    else {
        alert("已达人数上限，不可新添家庭成员！")
    }
}

function isIdCardNo() {
    var IDCard = document.getElementById("FIdNumber");
    var num = IDCard.value;
    //身份证号码为18位，18位前17位为数字，最后一位是校验位，可能为数字或字符X。  
    if (!(/(^\d{17}([0-9]|X)$)/.test(num))) {
        alert('输入的身份证号长度不对，或者号码不符合规定！18位号码末位可以为数字或X。');
        IDCard.focus();
        return false;
    }

    //下面分别分析出生日期和校验位
    var len, re;
    len = num.length;

    re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
    var arrSplit = num.match(re);
    //检查生日日期是否正确
    var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);
    var bGoodDay;
    bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
    if (!bGoodDay) {
        alert('输入的身份证号里出生日期不对！');
        return false;
    }

}