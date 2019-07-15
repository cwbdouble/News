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
    <title>发布公告</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>： 
               [新闻中心]-[<s:if test="#session.sign==1">
                	公告管理
                </s:if>
                <s:else>
                	焦点新闻管理
                </s:else>
                ]-[<s:if test="#session.sign==1">发布公告</s:if><s:else>发布焦点新闻</s:else>]</td>
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
			<s:if test="#session.sign==1">
                		发布公告
             </s:if>
             <s:else>
                		发布焦点新闻
             </s:else>
        </td>
        <td background="images/bg1.gif" bgcolor="#FFFFFF" class="STYLE1" align="right" width="20%">
        	<a href="affiche.action?sign=<s:property value="#session.sign"/>">返回【
        	<s:if test="#session.sign==1">
                		公告管理
            </s:if>
           <s:else>
                		焦点新闻管理
          </s:else>
        	】</a>
        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
      <tr>
      	<td colspan="4" align="center">
      		<s:form action="affiche!addAffiche.action" method="post" namespace="/">
      			<s:textfield name="affiche.title" label="标题"/>
      			<s:textarea name="affiche.content" label="内容"  cols="100" rows="20"/>
      			<s:hidden name="affiche.sign" value="%{#session.sign}"/>
      			<s:submit value="发布"/>
      		</s:form>
      	
      	</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

