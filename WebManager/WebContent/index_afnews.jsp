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
<title>��������</title>
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
    <td width="584" align="center"><strong><a href="index.action"><font color="#FFFFFF">��ҳ&nbsp;|</font></a>&nbsp;
	                                      <a href="index!getNewsList.action?topId=1"><font color="#FFFFFF">ʱ��&nbsp;|</font></a>&nbsp;
										 <a href="index!getNewsList.action?topId=2"><font color="#FFFFFF">����&nbsp;|</font></a>&nbsp;
										 <a href="index!getNewsList.action?topId=4"><font color="#FFFFFF">����&nbsp;|</font></a>&nbsp;
										<a href="index!getNewsList.action?topId=3"><font color="#FFFFFF">��ѧ&nbsp;|</font></a>&nbsp;
									<a href="index!getNewsList.action?topId=5"><font color="#FFFFFF">���&nbsp;|</font></a>&nbsp;
									<a href="index!getNewsList.action?topId=6"><font color="#FFFFFF">����</font>&nbsp;</a></strong>
											</td>
  </tr>
</table>
 <table width="800px" height="auto" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="31" width="800px" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;��ǰλ��>>
     <s:if test="#session.sign==1">
     	������Ϣ
     </s:if>
     <s:else>
     	��������
     </s:else>
    >>�鿴����</td>
    </tr>
   <tr>
     <td height="31" colspan="2"  width="800px" align="left" valign="middle" background="images/newsSort.jpg"><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;���⣺<s:property value="af.title"/></font>
     	
     </td>
   
   </tr>
   <tr>
     <td width="160" height="100%" align="center" valign="top" ><br>	 
     <table width="102" height="107" cellpadding="0" cellspacing="0">
       <tr>
         <td background="images/politics.jpg">&nbsp;</td>
       </tr>
     </table></td>
     <td width="640" align="center" valign="top">
<table cellpadding="0" cellspacing="3" border="0" width="640">
	<tr>
		<td style="font-size:12px;">
		�������ݣ�
		</td>
		<td style="font-size:12px;">
		<s:textarea value="%{af.content}" rows="10" cols="60" readonly="true"/>
	 </td>
	</tr>
	<tr>
		<td style="font-size:12px;">
		����ʱ�䣺
		</td>
		<td style="font-size:12px;">
		<s:date name="af.createTime" format="yyyy-MM-dd HH:mm:ss"/>
	 </td>
	</tr>
</table> 
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
