<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加类别</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[新闻中心]-[<s:property value="#session.topName"/>]-[添加类别]</td>
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
        <td background="images/bg1.gif" bgcolor="#FFFFFF" class="STYLE3" width="80%">
			添加类别
        </td>
        <td background="images/bg1.gif" bgcolor="#FFFFFF" class="STYLE1" align="right" width="20%">
        	<a href="category.action?category.topId=<s:property value="#session.topId"/>">返回【<s:property value="#session.topName"/>】>>【类别列表】</a>
        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
      <tr>
      	<td colspan="4" align="center">
      		<s:form action="category!addCategory.action" method="post" namespace="/">
      			<s:textfield name="category.name" label="类别名称"/>
      			<s:hidden name="category.topId" value="%{#session.topId}"/>
      			<s:submit value="添加"/>
      		</s:form>
      	
      	</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

