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
    <title>add</title>
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
        .form1{
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
            font: normal 12px 宋体;
        }
        .left{
            float: left;
        }
        .right{
            float: right;
        }
        .footer{
            margin-top: 60px;
            border-top: 1px solid #c0c0c0;
        }
    </style>
</head>
<body>
<div id="main">
    <div>
    </div>
    <div class="header"><img src="images/logo.gif" height="74" width="193"/></div>
    <div class="content1">
        <div><a class="xyhzc" href="javascript:void(0)">新房屋信息发布</a><a class="txgrxx" href="javascript:void(0)">填写房屋信息</a></div>
        <hr color="#0099CC" size="3">
        <div class="content" id="left">
            <form class="form1" name="form1" action="UpdateAction?id=${houseupdate.id}" method="post">
                <table>
                    <tr class="tr1">
                        <td class="tdhui">&nbsp;标&nbsp;&nbsp;&nbsp;&nbsp;题:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="text" name="title" value="${houseupdate.title}" required/></td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">&nbsp;户&nbsp;&nbsp;&nbsp;&nbsp;型:</td>
                        <td colspan="2">&nbsp;
                            <select name="typeId" id="typeId" required>
	                            <option value="${houseupdate.typeId}">${houseupdate.type.name}</option>
	                             <c:forEach var="type" items="${type2list}">
	                            	<option value="${type.id}">${type.name}</option>
	                            </c:forEach>
                        	</select>
                        </td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">&nbsp;面&nbsp;&nbsp;&nbsp;&nbsp;积:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="number" name="floorage" value="${houseupdate.floorage}" required></td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">&nbsp;价&nbsp;&nbsp;&nbsp;&nbsp;格:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="number" name="price" value="${houseupdate.price}" required></td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">房产证日期:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="date" name="pubdate" value="${houseupdate.pubdate}"></td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">&nbsp;位&nbsp;&nbsp;&nbsp;&nbsp;置:</td>
                        <td colspan="2">&nbsp;区:
                            <select name="districtId" id="districtId" required>
                                <option value="${houseupdate.street.districtId}" selected>${houseupdate.street.district.name}区</option>
                                <option value="">不限</option>
                                 <c:forEach var="district" items="${districtlist}">
                            		<option value="${district.id}">${district.name}</option>
                            	</c:forEach>
                            </select>街:
                            <select name="streetId" id="streetId" required>
                                <option value="${houseupdate.streetId}" selected>${houseupdate.street.name}</option>
                                <option value="">不限</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">&nbsp;联系方式:</td>
                        <td colspan="2">&nbsp;<input class="input1" type="tel" name="contact" value="${houseupdate.contact}" required></td>
                    </tr>
                    <tr class="tr1">
                        <td class="tdhui">&nbsp;详细信息:</td>
                        <td colspan="2">&nbsp;<textarea rows="6" cols="36" name="description" required>${houseupdate.description}</textarea>
                        </td>
                    </tr>
                    <tr class="tr">
                        <td height="30"></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="tr">
                        <td></td>
                        <td colspan="2" class="position1"><input class="baif1" id="baif1" type="image" src="images/ss.jpg"><a class="bais1" href="javascript:document.form1.submit()">立即发布</a></td>
                    </tr>
                    <tr class="tr">
                        <td height="60"></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="footer">
        <sapn class="left">青鸟租房&nbsp;&copy;&nbsp;2010&nbsp;北大青鸟&nbsp;京ICP证1000001号</sapn>
        <span class="right">关于我们·联系方式·意见反馈·帮助中心</span>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
    	$("#baif1").click(function(){
    		$("#form1").submit();
    	});
/*         $(".xyhzc").click(function () {
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
        }); */
		//判断值,级联
		$("#districtId").change(function(){
			var districtid = $(this).val();
			if(districtid!=""){
				$.post("StreetAction",{"districtid":districtid},function(data){
					if(data.length>0){
						$("#streetId").empty();
						$("#streetId").append($("<option>").val("").html("不限"));
						$.each(data,function(i,n){
							$("#streetId").append($("<option>").val(n.id).html(n.name));
						});
					}
					else{
						$("#streetId").empty();
						$("#streetId").append($("<option>").val("").html("不限"));
					}
				},"json");
			}
			else{
				$("#streetId").empty();
				$("#streetId").append($("<option>").val("").html("不限"));
			}
		});
    });
</script>

</body>
</html>