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
    <title>�޸��û�����</title>
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
                <td width="100%" class="STYLE1"><span class="STYLE3">�㵱ǰ��λ��</span>��[�û�����]-[�޸��û�����]</td>
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
        <td background="images/bg1.gif" bgcolor="#FFFFFF" class="STYLE3" width="100%">
			�޸��û�����
        </td>
        
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
      <tr>
      	<td colspan="3" align="center">
      		<s:form action="manager!updateManager.action" method="post" namespace="/">
      			<s:hidden name="manager.id" value="%{manager.id}"/>
      			<s:textfield name="manager.account" label="��¼�˻�" value="%{manager.account}" />
      			<s:textfield name="manager.password" label="��¼����" value="%{manager.password}"/>
      			<s:textfield name="manager.name" label="��ʵ����" value="%{manager.name}" />
      			<s:submit value="ȷ������"/>
      		</s:form>      	
      	</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

