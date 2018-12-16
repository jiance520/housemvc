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
    <title>detail</title>
    <style>
        
               * {
            margin: 0;
            padding: 0;
            /* border: 1px solid #c0c0c0; */
        }
        #main {
            margin: 0 auto;
            width: 1000px;
        }
        .input99{
            background-color: #5E77AA;
            color: white;
            padding: 3px;
        }
        .bold2{
            font: bold 14px 宋体;
        }
        .title{
            width: 200px;
        }
        .td1{
            width: 130px;
            
        }
        select{
            width: 75px;
            
        }
        #typeId{
        	width:80px;
        }
        .form1{
            border: 1px solid #c0c0c0;
            border-top:3px solid #c0c0c0;
            padding: 5px;
        }
        .div127{
            height: 30px;
        }
        
        .form124{
            border: 1px solid #c0c0c0;
            border-top:3px solid #c0c0c0;
            padding: 5px;
        }
        .p{
            color: red;
            text-align: center;
            font: bold 24px/30px 宋体;
        }
        .hui{
            color:#C3C3C3;
            font:normal 12px 宋体;
            text-align: center;
        }
        .red{
            color: red;
            font:bold 14px 宋体;
        }
        .clear {
            clear: both;
        }
        .detail{
            font: bold 16px 宋体;
            color:white;
            padding: 10px 10px 10px 10px;
            background-color: #0099CC;
            width: 100px;
        }
        .left1{
            width: 800px;
            float: left;
        }
        .right1{
            float: right;
            border: 1px solid #B5C5CD;
            padding: 5px;
            line-height: 24px;
            font: normal 12px/24px 宋体;
        }
        .a2{
            font:bold 14px 宋体;
            color: #6376BB;
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
            margin-top: 30px;
            padding-top:5px;
            border-top: 1px solid #c0c0c0;
        }
    </style>
</head>
<body>
<div id="main">
    <div class="header">
        <div><img class="img95" src="images/logo.gif" height="74" width="193"/></div>
        <form action="SearchAction" name="form1" method="post" class="form1" id="form1">
            <table>
                <tr>
                    <td colspan="3" class="bold2">房屋信息</td>
                    <td class="bold2">价格</td>
                    <td class="bold2">区域</td>
                    <td class="bold2">街道</td>
                    <td class="bold2">房型</td>
                    <td class="bold2">面积</td>
                </tr>
                <tr>
                    <td>标题:</td>
                    <td><input type="text" class="title" name="title"></td>
                    <td><input class="input99" type="button" value="搜索房屋">&nbsp;&nbsp;</td>
                    <td class="td1">
                        <select name="price" id="price">
                            <option value="">不限</option>
                            <option value="0">0-1000</option>
                            <option value="1000">1000-2000</option>
                            <option value="2000">2000以上</option>
                        </select>
                    </td>
                    <td class="td1">
                        <select name="districtId" id="districtId">
                            <option value="">不限</option>
                            <c:forEach var="district" items="${districtlist}">
                            	<option value="${district.id}">${district.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="td1">
                        <select name="streetId" id="streetId" class="streetId">
                            <option value="">不限</option>
                        </select>
                    </td>
                    <td class="td1">
                        <select name="typeId" id="typeId">
                            <option value="">不限</option>
                             <c:forEach var="type" items="${type2list}">
                            	<option value="${type.id}">${type.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="td1">
                        <select name="floorage" id="floorage">
                            <option value="">不限</option>
                            <option value="0">0-100</option>
                            <option value="100">100-200</option>
                            <option value="200">200以上</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div class="content">
        <div>当前位置:青鸟租房网-浏览房源</div>
        <div class="left1">
            <p class="p">${house.title}</p>
            <div class="hui">${house.pubdate}</div>
            <hr style="border: 1px #c0c0c0 dashed">
            <div class="div127">户&nbsp;&nbsp;型:<span class="red">${house.type.name}</span></div>
            <div class="div127">面&nbsp;&nbsp;积:<span class="red">${house.floorage}平米</span></div>
            <div class="div127">区&nbsp;&nbsp;域:<span class="red">${house.street.district.name}区</span></div>
            <div class="div127">街&nbsp;&nbsp;道:<span class="red">${house.street.name}</span></div>
            <div class="div127">联系方式:<span class="red">${house.contact}</span></div>
        </div>
        <div class="right1">
            <div><a class="a2" href="#">北京青鸟房地产公司</a></div>
            <div>资质证书:有</div>
            <div>内部编号:1000</div>
            <div>联系人:</div>
            <div>联系电话:</div>
            <div>手机号码:<span class="red">暂无</span></div>
        </div>
        <div class="clear"></div>
        <div>
            <div class="detail">房源详细信息</div>
            <div style="border-top: 1px #0099CC solid;padding: 20px;">${house.description}</div>
        </div>
    </div>
    <div class="footer">
        <sapn class="left">青鸟租房&nbsp;&copy;&nbsp;2010&nbsp;北大青鸟&nbsp;京ICP证1000001号</sapn>
        <span class="right">关于我们·联系方式·意见反馈·帮助中心</span>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
<script>
	$(document).ready(function () {
		$(".input99").click(function(){
    		$("#form1").submit();
    	});
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