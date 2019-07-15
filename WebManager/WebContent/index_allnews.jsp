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
<title>更多新闻</title>
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.STYLE4{
	font-size: 12px;
}
</style>
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
     <td height="31" width="800px" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;当前位置>><s:property value="#session.topName"/></td>
    </tr>
   
   <tr>
     <td width="160" height="100%" align="center" valign="top" ><br>	 
     <table width="102" height="107" cellpadding="0" cellspacing="0">
       <tr>
         <td background="images/politics.jpg">&nbsp;</td>
       </tr>
     </table></td>
     <td width="640" align="left" valign="top">
	 
<br>     <s:if test="allnews.size()==0">
			<font size="+3" color="#CC3333"><b>暂——--无</b></font>
		</s:if>
         <s:else>
         	<s:iterator value="allnews" var="news">
         	 <table width="640" cellpadding="0" cellspacing="0">
       <tr>
         <td width="20" height="20" ><img src="images/triangle.jpg" width="6" height="9"></td>
    <td width="250px"><a href="index!getNewsById.action?news.id=<s:property value="#news.id"/>&topId=<s:property value="#session.topId"/>">
    <s:if test="#news.title.length()>10">
    	<s:property value="#news.title.substring(0,10)"/>...
    </s:if>
    <s:else>
    	 <s:property value="#news.title"/>
    </s:else>
   
    
    </a></td>
     <td width="100px"><s:date name="#news.createTime" format="yyyy-MM-dd"/></td>
     <td width="154"><img src="images/new.gif"></td>
      </tr>
     </table>
	<hr>
         	
         	</s:iterator>
         </s:else>

	 </td>
   </tr>
 </table>
 <br/><br/>
 <table width="800px" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;当前第 <s:property value="pageNo"/>/<s:property value="pageCount"/> 页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40" style="STYLE4">
                 <a href="index!getNewsList.action?pageNo=1&topId=<s:property value="#session.topId"/>"> 首页</a>
                  </td>
                  <td width="45" style="STYLE4">
                  <a href="index!getNewsList.action?pageNo=<s:property value="pageNo-1"/>&topId=<s:property value="#session.topId"/>">上一页</a>
                  </td>
                  <td width="45" style="STYLE4">
                  <a href="index!getNewsList.action?pageNo=<s:property value="pageNo+1"/>&topId=<s:property value="#session.topId"/>">下一页</a>
                  </td>
                  <td width="40" style="STYLE4">
                  <a href="index!getNewsList.action?pageNo=<s:property value="pageCount"/>&topId=<s:property value="#session.topId"/>">尾页</a>
                  </td>
                 
                </tr>
            </table></td>
          </tr>
        </table></td>
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
