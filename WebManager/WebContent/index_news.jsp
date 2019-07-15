<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib prefix="s" uri="/struts-tags"   %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>新闻列表</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
<div align="center">

<table width="800" height="159" border="0" cellpadding="0" cellspacing="0" background="images/two.jpg">
  <tr>
    <td width="627">&nbsp;</td>
    <td width="173" valign="top">	  
	</td>
  </tr>
</table>
<table width="800" height="26" border="0" cellpadding="0" cellspacing="0" background="images/three.jpg">
  <tr>
    <td width="216">&nbsp;</td>
    <td width="584" align="center"><strong><a href="index.action"><font color="#FFFFFF">首页&nbsp;|</font></a>&nbsp;
	                                       <a href="index!getNewsList.action?topId=1"><font color="#FFFFFF">时政&nbsp;|</font></a>&nbsp;
										 <a href="index!getNewsList.action?topId=2"><font color="#FFFFFF">经济&nbsp;|</font></a>&nbsp;
										 <a href="index!getNewsList.action?topId=4"><font color="#FFFFFF">法制&nbsp;|</font></a>&nbsp;
										<a href="index!getNewsList.action?topId=3"><font color="#FFFFFF">科学&nbsp;|</font></a>&nbsp;
									<a href="index!getNewsList.action?topId=5"><font color="#FFFFFF">社会&nbsp;|</font></a>&nbsp;
									<a href="index!getNewsList.action?topId=6"><font color="#FFFFFF">娱乐</font>&nbsp;</a></strong>
											</td>
  </tr>
</table>
 <table width="800" height="auto" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="31" width="800px" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;当前位置>><s:property value="#session.topName"/>>><s:property value="#session.cname"/></td>
    </tr>
   <tr>
     <td height="31" colspan="2" align="left" valign="middle"  background="images/newsSort.jpg"><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#session.cname"/></font></td>
   </tr>
   <tr>
     <td width="160" height="100%" align="center" valign="top" ><br>	 
     <table width="102" height="107" cellpadding="0" cellspacing="0">
       <tr>
         <td background="images/politics.jpg">&nbsp;</td>
       </tr>
     </table></td>
     <td width="640" align="left" valign="top">
	 
<br>     <s:if test="cnews.size()==0">
			<font size="+3" color="#CC3333"><b>暂——--无</b></font>
		</s:if>
         <s:else>
         	<s:iterator value="cnews" var="cn">
         	 <table width="640" cellpadding="0" cellspacing="0">
       <tr>
         <td width="20" height="20" ><img src="images/triangle.jpg" width="6" height="9"></td>
    <td width="250px"><a href="index!getNewsById.action?news.id=<s:property value="#cn.id"/>&topId=<s:property value="#session.topId"/>">
    <s:if test="#cn.title.length()>10">
    	<s:property value="#cn.title.substring(0,10)"/>...
    </s:if>
    <s:else>
    	<s:property value="#cn.title"/>
    </s:else>
    
    
    </a></td>
     <td width="100px"><s:date name="#cn.createTime" format="yyyy-MM-dd"/></td>
     <td width="154"><img src="images/new.gif"></td>
      </tr>
     </table>
	<hr>
         	
         	</s:iterator>
         </s:else>

	 </td>
   </tr>
 </table>
 <table width="800" height="25" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/bottencc.jpg"><div align="center"></div></td>
  </tr>
</table>
<table width="800" height="80" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <th background="images/bottom.jpg" scope="col">&nbsp;</th>
  </tr>
</table>
</div>
</body>
</html>
