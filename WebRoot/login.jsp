<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #main {
            width: 1000px;
            margin: 0px auto;
        }
        .content{
            width:526px;
            height: 297px;
            margin: 0px auto;
            margin-top: 50px;
            padding: 10px;
            border: 1px solid #E0E0E0;
            background-color: #F0F5F8;
        }
        .yhdl{
            font: bold 16px 宋体;
            color:#5C5D5D;
            padding: 5px;
        }
        .form1{
            margin-top: 60px;
            margin-left: 60px;

        }
        .tdhui{
            font:normal 14px 宋体;
            color: #5C5D5D;
        }
        tr{
            line-height: 45px;
        }
        .input1{
            height: 22px;
            width: 260px;
            border: 1px solid #C2CFDE;
        }
        .position1{
            position: relative;
        }
        .position2{
            position: relative;
        }
        .bais1,.bais2{
            position: absolute;
            top:15%;
            left: 35%;
            font: bold 16px/20px 宋体;
            color: white;
            text-decoration: none;
        }
        .left,.right{
            color: #AEAEAE;
            margin-top: 60px;
            font: normal 12px 宋体;
        }
        .left{
            float: left;
        }
        .right{
            float: right;
        }
        #register{
        	cursor:pointer;
        }
    </style>
</head>
<body>
<div id="main">
    <div class="header"><img src="images/logo.gif" height="74" width="193"/></div>
    <div class="content">
        <div class="yhdl">用户登陆</div>
        <hr color="#D4D5D5">
        <form class="form1" name="form1" action="LoginAction" method="post">
            <table>
                <tr class="tr">
                    <td class="tdhui">用&nbsp;户&nbsp;名:</td>
                    <td colspan="2">&nbsp;<input class="input1" type="text" name="name" value="${username}" required="required"></td>
                </tr>
                <tr class="tr">
                    <td class="tdhui">密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
                    <td colspan="2">&nbsp;<input class="input1" type="password" name="password" value="${password}" required=required></td>
                </tr>
                <tr>
                    <td height="15"></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr class="tr3">
                    <td></td>
                    <td class="position1"><input  class="baif" type="image" src="images/wx_icp.jpg" value="登陆"><a class="bais1" href="javascript:document.form1.submit()">登陆</a></td>
                    <td class="position2"><image id="register"  class="baif" src="images/wx_icp.jpg"><a class="bais2" href="register.jsp">注册</a></td>
                </tr>
            </table>
        </form>
    </div>
    <div class="footer">
        <sapn class="left">青鸟租房&nbsp;&copy;&nbsp;2010&nbsp;北大青鸟&nbsp;京ICP证1000001号</sapn>
        <span class="right">关于我们·联系方式·意见反馈·帮助中心</span>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.12.4.js"></script>
<script>
    $(document).ready(function () {
		$("#register").click(function(){
			window.location.href="register.jsp";
		})
    });
</script>

</body>
</html>