<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>search</title>
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
        .div141{
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .div141:nth-of-type(even){
        	background-color:#FAF9F6;
        }
        dt{
            width: 130px;
            float: left;
        }
        dd{
            float: left;
            height: 75px;
        }
        .dd1{
            width: 615px;
        }
        .dd2,.dd3{
            width: 120px;
            text-align: center;
            line-height: 75px;
        }
        .dd3{
            color: red;
        }
        .bold1{
            font: bold 20px/75px 微软雅黑;
        }
        .div1{
            font: bold 16px/30px 宋体;
            color: #485EAE;
        }
        .div2,.div3{
            font: normal 14px/20px 宋体;
        }
        .clear {
            clear: both;
        }
        .left,.right{
            font: normal 12px 宋体;
        }
        .hui{
            color: #AEAEAE;
        }
        .left{
            float: left;
        }
        .right{
            float: right;
        }
        .footer{
            padding-top: 30px;
            border-top: 1px solid #c0c0c0;
        }
    </style>
</head>
<body onload="init()">
<div id="main">
    <div class="header">
        <div><img src="images/logo.gif" height="74" width="193"/></div>
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
        <c:forEach var="house" items="${defaultlist}">
        	<div class="div141">
	            <dl>
	                <dt><img src="images/thumb_house.gif" height="75" width="100"/></dt>
	                <dd class="dd1">
	                    <div class="div1"><a class="a1" href="DetailAction?houseid=${house.id}">${house.title}</a></div>
	                    <div class="div2">${house.street.district.name}区${house.street.name},${house.floorage}平米</div>
	                    <div class="div3">联系方式:${house.contact}</div>
	                </dd>
	                <dd class="dd2">${house.type.name}</dd>
	                <dd class="dd3"><span class="bold1">${house.price}</span>元/月</dd>
	            </dl>
	            <div class="clear"></div>
        	</div>
        <hr style="background-color:#c0c0c0;height:1px;border:none;">
        </c:forEach>
        <br>
        <form action="PageAction" method="post" name="formhidden">
        	<input type="hidden" name="page" value="${page}"/>
        	<input type="hidden" name="title" value="${title}"/>
        	<input type="hidden" name="price" value="${price}"/>
        	<input type="hidden" name="districtId" value="${districtId}"/>
        	<input type="hidden" name="streetId" value="${streetId}"/>
        	<input type="hidden" name="typeId" value="${typeId}"/>
        	<input type="hidden" name="floorage" value="${floorage}"/>
        	<input type="hidden" name="pageall" value="${pageall}"/>
        </form>
        <div class="left">${page}/${pageall}页</div>
        <div class="right" id="right">
            <a class="firstpage" href="javascript:void(0)">首页</a>&nbsp;
            <a class="prevpage" href="javascript:void(0)">上一页</a>&nbsp;
            <a class="nextpage" href="javascript:void(0)">下一页</a>&nbsp;
            <a class="endpage" href="javascript:void(0)">末页</a>
        </div>
        <div class="clear"></div>
    </div>
    <div><a href="ReloadAction">管理员修改</a></div>
    <div class="footer">
        <sapn class="left hui">青鸟租房&nbsp;&copy;&nbsp;2010&nbsp;北大青鸟&nbsp;京ICP证1000001号</sapn>
        <span class="right hui">关于我们·联系方式·意见反馈·帮助中心</span>
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
		$(".firstpage").click(function(){
			$("[name='page']").val(1);
			var node = $("[name='formhidden']")[0];
			//node.action = "PageAction";
			node.submit();
		})
		$(".prevpage").click(function(){
			var pagenum = parseInt(${page});
			pagenum--;
			$("[name='page']").val(pagenum);
			var node = $("[name='formhidden']")[0];
			node.submit();
		})
		$(".nextpage").click(function(){
			var pagenum = parseInt(${page});
			pagenum++;
			$("[name='page']").val(pagenum);
			var node = $("[name='formhidden']")[0];
			node.submit();
		})
		$(".endpage").click(function(){
			$("[name='page']").val(${pageall});
			var node = $("[name='formhidden']")[0];
			node.submit();
		});
		$("#typeId").change(function(){
			//alert($(this).val());
		})
    });

</script>

</body>
</html>