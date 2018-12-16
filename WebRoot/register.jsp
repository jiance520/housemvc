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
    <title>register</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            /*border: 1px solid #c0c0c0;*/
        }
        #main {
            width: 1000px;
            margin: 0px auto;
        }
        .content1{
            width:528px;
            margin: 0px auto;
            margin-top: 50px;
        }
        .content{
            width:526px;
            border: 1px solid #E0E0E0;
            background-color: #F0F5F8;
        }
         #right{
            display: none;
        }
        .xyhzc{
            display: inline-block;
            font: bold 16px 宋体;
            text-decoration: none;
            color:#5B5B5B;
            padding: 10px 50px 10px 10px;
            background-color: white;
        }
        .txgrxx{
            display: inline-block;
            font: bold 16px 宋体;
            color:white;
            padding: 10px 50px 10px 50px;
            background-color: #0099CC;
            text-decoration: none;
        }
        .form109,.form149{
            margin-top: 50px;
            margin-left: 50px;

        }
        .tdhui{
            font:normal 14px 宋体;
            color: #5C5D5D;
        }
        .tr1{
            height: 45px;
        }
        .input1{
            height: 23px;
            width: 260px;
            border: 1px solid #C2CFDE;
        }
        .position1{
            position: relative;
            text-align: center;
            /*vertical-align: middle;*/
            /*border: 1px solid #0000ff;*/
        }
        .bais1{
            position: absolute;
            top:15%;
            left: 39%;
            font: bold 14px/20px 宋体;
            color: white;
            text-decoration: none;
        }
        .baif1{
            /*border: 1px solid #ff0e11;*/
            vertical-align:middle;

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
    </style>
</head>
<body>
<div id="main">
<div>
</div>
    <div class="header"><img src="images/logo.gif" height="74" width="193"/></div>
    <div class="content1">
        <div><a class="xyhzc" href="javascript:void(0)">新用户注册</a><a class="txgrxx" href="javascript:void(0)">填写个人信息</a></div>
        <hr color="#0099CC" size="3">
        <div class="content" id="left">
            <form class="form109" action="RegisterAction" method="post" name="form1" id="search_form">
                <table>
                    <tr class="tr1">
                        <td class="tdhui">用&nbsp;户&nbsp;名:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="text" name="name" required></td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="password" name="password" required></td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">确认密码:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="password" name="password2" required></td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">电&nbsp;&nbsp;&nbsp;&nbsp;话:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="tel" name="tel" required></td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">用户姓名:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="text" name="username" required></td>
                    </tr>
                    <tr class="tr">
                        <td height="30"></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="tr">
                        <td></td>
                        <td colspan="2" class="position1"><input class="baif1" type="image" src="images/ss.jpg"><a class="bais1" href="javascript:document.form1.submit()">立即注册</a></td>
                    </tr>
                    <tr class="tr">
                        <td height="60"></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </form>
        </div>
<!--         <div class="content" id="right">
            <form action="IndexAction" class="form149" method="post">
                <table>
                    <tr class="tr1">
                        <td class="tdhui">地&nbsp;&nbsp;&nbsp;&nbsp;址:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="text" name="address"></td>
                    </tr>
                    <tr class="tr">
                        <td height="30"></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="tr">
                        <td></td>
                        <td colspan="2" class="position1"><input  class="baif1" type="image" src="images/ss.jpg"><span class="bais1" href="#">立即注册</span></td>
                    </tr>
                    <tr class="tr">
                        <td height="60"></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </form>
        </div> -->
    </div>
    <div class="footer">
        <sapn class="left">青鸟租房&nbsp;&copy;&nbsp;2010&nbsp;北大青鸟&nbsp;京ICP证1000001号</sapn>
        <span class="right">关于我们·联系方式·意见反馈·帮助中心</span>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
<script type="text/javascript">
	
    $(document).ready(function () {
        $(".xyhzc").click(function () {
            // alert(0);
            $(this).css({
                "color":"#5B5B5B",
                "background-color":"white"
            });
            $(".txgrxx").css(
                {
                    "color":"white",
                    "background-color":"#0099CC"
                }
            );
            $("#right").hide();
            $("#left").show();
        });
        $(".txgrxx").click(function () {
            $(this).css({
                "color":"#5B5B5B",
                "background-color":"white"
            });
            $(".xyhzc").css(
                {
                    "color":"white",
                    "background-color":"#0099CC"
                }
            );
            $("#left").hide();
            $("#right").show();
        });
    });
</script>

</body>
</html>