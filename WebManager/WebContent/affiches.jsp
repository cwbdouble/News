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
    <title>公告、焦点导读管理页面</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[新闻中心]-[
                	<s:if test="#session.sign==1">
                		公告管理
                	</s:if>
                	<s:else>
                		焦点新闻管理
                	</s:else>
                ]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
               
                <td width="100"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1">
                    <a href="affiche!inputAffiche.action"><div align="center">
                    <s:if test="#session.sign==1">
                		发布公告
                	</s:if>
                	<s:else>
                		发布焦点新闻
                	</s:else>
                    </div></a>
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
    <td align="center" style="font-size:12px;">
    <s:if test="affiches.size()>0">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="25%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">标题</span></div></td>
            <td width="25%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">内容</span></div></td>
            <td width="25%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">发布时间</span></div></td>
            <td width="25%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
          </tr>
          <s:iterator value="affiches" var="affiche">  
          <tr>
          
            <td height="20" bgcolor="#FFFFFF"><div align="center">
            <a href="affiche!getAffiche.action?affiche.id=<s:property value="#affiche.id"/>"><span class="STYLE1"><s:property value="#affiche.title"/> </span></a>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><s:property value="#affiche.content"/> </span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><s:date name="#affiche.createTime" format="yyyy-MM-dd HH:mm:ss"/></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
            <span class="STYLE4">
           	<a href="affiche!getAfficheById.action?affiche.id=<s:property value="#affiche.id"/>&signStr=update"><img src="images/edt.gif" width="16" height="16" border="0"/>编辑</a> 
            &nbsp; &nbsp;
            <a href="affiche!delAffiche.action?affiche.id=<s:property value="#affiche.id"/>"><img src="images/del.gif" width="16" height="16" border="0"/>删除</a>
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
 
</table>
</body>
</html>

