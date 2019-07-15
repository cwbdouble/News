<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <s:head />
    <title>新闻管理页面</title>
    <script src="js/main.js"></script>
	<link rel="stylesheet" href="css/main.css">

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[新闻中心]-[<s:property value="#session.topName"/>]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
               
                <td width="100"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1">
                    <a href="news!addInputNews.action?topId=<s:property value="#session.topId"/>"><div align="center">发布新闻</div></a>
                    </td>
                  </tr>
                </table></td>
                <td width="100"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1">
                    <a href="category.action?category.topId=<s:property value="#session.topId"/>"/><div align="center">类别管理</div></a>
                    </td>
                  </tr>
                </table></td>
               
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td style="font-size:12px;" align="center">
        <s:if test="newsList.size()!=0">
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="18%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">标题</span></div></td>
            <td width="14%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">发布时间</span></div></td>
            <td width="30%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">内容</span></div></td>
             <td width="10%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">详细类别</span></div></td>
            <td width="15%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
          </tr>
          <s:iterator value="newsList" var="news">  
          <tr>
           <td height="20" bgcolor="#FFFFFF"><div align="center">
           		<a href="news!getNewsById.action?news.id=<s:property value="#news.id"/>"/><span class="STYLE1">
           		<s:if test="#news.title.length()>8">
           			<s:property value="#news.title.substring(0,8)"/>...
           		</s:if>
           		<s:else>
           			<s:property value="#news.title"/>
           		</s:else>
           		</span></a>
           </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">
          	<s:date name="#news.createTime" format="yyyy-MM-dd HH:mm:ss"/>
            </span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">
            <s:if test="#news.content.length()>15">
            	<s:property value="#news.content.substring(0,15)"/>...
            </s:if>
            <s:else>
            	<s:property value="#news.content"/> 
            </s:else>
            
            </span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><s:property value="#news.category.name"/></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
            <span class="STYLE4">
           	<a href="news!getNewsById.action?news.id=<s:property value="#news.id"/>&signStr=update&topId=<s:property value="#session.topId"/>"><img src="images/edt.gif" width="16" height="16" border="0"/>编辑</a> 
            &nbsp; &nbsp;
            <a href="news!delNews.action?news.id=<s:property value="#news.id"/>&pageNo=<s:property value="pageNo"/>"><img src="images/del.gif" width="16" height="16" border="0"/>删除</a>
            </span></div></td>
          </tr>
        </s:iterator>
        </table>
        </s:if>
        <s:else>
        	暂无数据！
        </s:else>
        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;当前第 <s:property value="pageNo"/>/<s:property value="pageCount"/> 页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40">
                 <a href="news.action?pageNo=1&topId=<s:property value="#session.topId"/>"> <img src="images/first.gif" width="37" height="15" border="0"/></a>
                  </td>
                  <td width="45">
                  <a href="news.action?pageNo=<s:property value="pageNo-1"/>&topId=<s:property value="#session.topId"/>"><img src="images/back.gif" width="43" height="15" border="0"/></a>
                  </td>
                  <td width="45">
                  <a href="news.action?pageNo=<s:property value="pageNo+1"/>&topId=<s:property value="#session.topId"/>"><img src="images/next.gif" width="43" height="15" border="0"/></a>
                  </td>
                  <td width="40">
                  <a href="news.action?pageNo=<s:property value="pageCount"/>&topId=<s:property value="#session.topId"/>"><img src="images/last.gif" width="37" height="15" border="0"/></a>
                  </td>
                 
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

