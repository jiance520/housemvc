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
    <title>modify</title>
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
        .left96{
            float: left;
        }
        .right96{
            float: right;
            height: 74px;
        }
        .input97,.input98{
            background-color: #68A54C;
            padding: 5px;
            color: white;
            font: bold 14px 宋体;
        }
        .input105,.input106{
            background-color: #68A54C;
            padding: 3px;
            color: white;
            font: bold 12px 宋体;
        }
        .form1{
            border: 1px solid #c0c0c0;
            border-top:3px solid #c0c0c0;
            padding: 5px;
        }
        .div141{
            margin-top: 10px;
            margin-bottom: 10px;
            line-height:74px;
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
          	line-height: 74px;
        }
        .dd3{
            color: red;
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
<body >
<div id="main">
    <div class="header">
        <div class="left96"><img src="images/logo.gif" height="74" width="193"/></div>
        <div class="right96">
            <input class="input97" type="button" value="发布房屋信息">&nbsp;<input class="input98" type="button" value="退  出">
        </div>
        <div class="clear"></div>
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
	                <dd class="dd2"><input class="input105" type="button" value="修改"><input type="hidden" name="hidden" value="${house.id}"/></dd>
	                <dd class="dd3"><input class="input106" type="button" value="删除"><input type="hidden" name="hidden" value="${house.id}"/></dd>
	            </dl>
	            <div class="clear"></div>
	        </div>
	        <hr style="background-color:#c0c0c0;height:1px;border:none;">
        </c:forEach>
        <br>
        <form action="ModifyPageAction" method="post" name="formhidden">
        	<input type="hidden" name="page" value="${page}"/>
        </form>
        <div class="left">${page}/${pageall}页</div>
        <div class="right">
            <a class="firstpage" href="javascript:void(0)">首页</a>&nbsp;
            <a class="prevpage" href="javascript:void(0)">上一页</a>&nbsp;
            <a class="nextpage" href="javascript:void(0)">下一页</a>&nbsp;
            <a class="endpage" href="javascript:void(0)">末页</a>
        </div>
        <div class="clear"></div>
    </div>
    <div><a href="SearchAction">起始页</a></div>
    <div class="footer">
        <sapn class="left hui">青鸟租房&nbsp;&copy;&nbsp;2010&nbsp;北大青鸟&nbsp;京ICP证1000001号</sapn>
        <span class="right hui">关于我们·联系方式·意见反馈·帮助中心</span>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
		$(".input105").click(function(){
			var houseid = $(this).next().val();
 			window.location.href="ModifyAction?houseid="+houseid;	 		
	 	});
		$(".input97").click(function(){
	 		window.location.href="add.jsp";	 		
		});
		$(".input98").click(function(){
	 		window.location.href="login.jsp";	 		
		});
		$(".input106").click(function(){
			var houseid = $(this).next().val();
 			window.location.href="DeleteAction?houseid="+houseid;	 		
	 	});
		/* 分页查询 */
		$(".firstpage").click(function(){
			$("[name='page']").val(1);
			var node = $("[name='formhidden']")[0];
			node.action = "ModifyPageAction";
			node.submit();
		})
		$(".prevpage").click(function(){
			var pagenum;
			if(${page}==null){
				pagenum=1;
			}
			else{
				pagenum = parseInt(${page});
			}
			pagenum--;
			$("[name='page']").val(pagenum);
			var node = $("[name='formhidden']")[0];
			node.action = "ModifyPageAction";
			node.submit();
		})
		$(".nextpage").click(function(){
			var pagenum;
			if(${page}==null){
				pagenum=1;
			}
			else{
				pagenum = parseInt(${page});
			}
			pagenum++;
			$("[name='page']").val(pagenum);
			var node = $("[name='formhidden']")[0];
			node.action = "ModifyPageAction";
			node.submit();
		})
		$(".endpage").click(function(){
			var pagenum;
			if(${page}==null){
				pagenum=1;
			}
			else{
				pagenum = parseInt(${page});
			}
			$("[name='page']").val(${pageall});
			var node = $("[name='formhidden']")[0];
			node.action = "ModifyPageAction";
			node.submit();
		})
    });
</script>

</body>
</html>