<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>京东台管理系统</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/e3.css" />
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<style type="text/css">
	.content { padding: 10px 10px 10px 10px;}
	.span1{color:white; font-size:32px;padding-left:225px;padding-top:20px; position:absolute;}
</style>
</head>
<body class="easyui-layout">
    <!-- 头部标题 -->
	 
	<div data-options="region:'north',border:false" style="height:95px; padding:5px; background:url(images/topbg.gif) repeat-x;"> 
		<div class="topleft"></div>
		<span class="span1">京东商城后台管理系统 </span>
		<div class="topright">    
		<ul>
			<li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
			<li><a href="http://localhost:8081">退出</a></li>
		</ul>
		<div class="user">
			<span>欢迎</span>
			<%String username = (String)session.getAttribute("username"); %>
			<i>${username}  &nbsp;&nbsp;登录</i>
			<i>消息</i>
			<b>5</b>
		</div>    
    </div>
	</div>
	
    <div data-options="region:'west',title:'菜单',split:true" style="width:180px; background:#f0f9fd;">
    	<ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;" >
         	<li>
         		<span>商品管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'item-add'}">新增商品</li>
	         		<li data-options="attributes:{'url':'item-list'}">查询商品</li>
	         		<li data-options="attributes:{'url':'item-param-list'}">规格参数</li>
	         	</ul>
         	</li>
         	<li>
         		<span>网站内容管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'content-category'}">内容分类管理</li>
	         		<li data-options="attributes:{'url':'content'}">内容管理</li>
	         	</ul>
         	</li>
         	<li>
         		<span>索引库管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'index-item'}">solr索引库维护</li>
	         	</ul>
         	</li>
         </ul>
    </div>
    <div data-options="region:'center',title:''">
    	<div id="tabs" class="easyui-tabs">
		    <div title="首页" style="padding:22px;">
		        
		    </div>
		</div>
    </div>
    <!-- 页脚信息 -->
	<div data-options="region:'south',border:false" style="height:20px; background:#046dad; color:#000; padding:2px; vertical-align:middle;color:white;">
		<span id="sysVersion">系统版本：V1.0</span>
	    <span id="nowTime"></span>
	</div>
<script type="text/javascript">
$(function(){
	$('#menu').tree({
		onClick: function(node){
			if($('#menu').tree("isLeaf",node.target)){
				var tabs = $("#tabs");
				var tab = tabs.tabs("getTab",node.text);
				if(tab){
					tabs.tabs("select",node.text);
				}else{
					tabs.tabs('add',{
					    title:node.text,
					    href: node.attributes.url,
					    closable:true,
					    bodyCls:"content"
					});
				}
			}
		}
	});
});
setInterval("document.getElementById('nowTime').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>
</body>
</html>