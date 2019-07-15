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
<title>新闻中心首页</title>
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
 <table width="800" height="680" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td width="216" rowspan="3" valign="top">
	 <table width="216" height="680px" border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td height="260px">		
          <table width="216" height="270px" border="0" cellpadding="0" cellspacing="0" background="images/leftTwo.jpg">
           <tr>
             <td height="36">&nbsp;</td>
           </tr>
           <tr>
             <td height="234" style="font-size:12px">
			 	<marquee direction="up" height="170" onmouseout="this.start()"
             onmouseover="this.stop()" scrollAmount="1" scrollDelay="1" class="linkBlack">
         <s:if test="news7.size()!=0">
         	<s:iterator value="news7" var="affiche">
         		<div align="left">&nbsp;&nbsp;&nbsp;
				<a href="index!getafNews.action?af.sign=1&af.id=<s:property value="#affiche.id"/>">
				<s:if test="#affiche.title.length()>5">
					<s:property value="#affiche.title.substring(0,5)"/>...
				</s:if>
				<s:else>
					<s:property value="#affiche.title"/>
				</s:else>
				（<s:date name="#affiche.createTime" format="MM-dd"/>）</a></div><br>
         	</s:iterator>
         </s:if>    
		<s:else>
			<div align="center">暂----无</div>
		</s:else>
	
	</marquee>


			 </td>
           </tr>
         </table></td>
       </tr>
       <tr>
         <td height="410">

		 <table width="216" height="410" border="0" cellpadding="0" cellspacing="0" background="images/leftThree.jpg">
           <tr>
             <td height="40">&nbsp;</td>
           </tr>
           <tr>
             <td height="370" valign="top" ><br>
             <s:if test="news8.size()!=0">
             	<s:iterator value="news8" var="force">
             		 <table width="156" border="0" align="center" cellpadding="0" cellspacing="0">
               <tr>
                 <td width="154"> 
                 <a href="index!getafNews.action?af.sign=2&af.id=<s:property value="#force.id"/>">
                 <s:if test="#force.title.length()>4">
                 	<s:property value="#force.title.substring(0,4)"/>...
                 </s:if>
                 <s:else>
                 <s:property value="#force.title"/>
                 </s:else>（<s:date name="#force.createTime" format="MM-dd"/>）
                 </a></td>
               </tr>
             </table>    <br>
             	</s:iterator>
             </s:if>
			<s:else>
				<div align="center">暂----无</div>
			</s:else>
			 

		     </td>
           </tr>
          
         </table>


		 </td>
       </tr>
</table>

	 </td>
     <td height="216" valign="middle">
	 <table width="584" height="224" border="0" cellpadding="0" cellspacing="0" background="images/rightOne.jpg">
       <tr>
         <td height="44"><table width="262" border="0" align="center" cellpadding="0" cellspacing="0">
           <tr>
             <td width="131" height="18">&nbsp;</td>
             <td width="134"><div align="right" class="word_white"><strong>
             <a href="index!getNewsList.action?topId=1"><font color="#FFFFFF">more...</font></a></strong></div></td>
           </tr>
         </table></td>
         <td height="44"><table width="262" border="0" align="center" cellpadding="0" cellspacing="0">
           <tr>
             <td width="131" height="18">&nbsp;</td>
             <td width="134"><div align="right" ><strong><a href="index!getNewsList.action?topId=2"><font color="#FFFFFF">more...</font></a></strong></div></td>
           </tr>
         </table></td>
       </tr>
       <tr>
         <td width="291" valign="top">
         <s:if test="news1.size()==0">
         	<div align="center"><br>暂----无</div>  
         </s:if>
         <s:else>
         	<s:iterator value="news1" var="polity">
         		 <br>   <table width="234" border="0" align="center" cellpadding="0" cellspacing="0" height="17px">
         		  <tr >
                <td width="77" height="17px"><strong>
                <a href="index!getNewsByCid.action?topId=1&cid=<s:property value="#polity.category.id"/>">[<s:property value="#polity.category.name"/>]</a>
                </strong></td>
             <td width="115"><a href="index!getNewsById.action?topId=1&news.id=<s:property value="#polity.id"/>">
             <s:if test="#polity.title.length()>7">
             	<s:property value="#polity.title.substring(0,7)"/>...
             </s:if>
             <s:else>
             	<s:property value="#polity.title"/>
             </s:else>     
             </a></td>
             <td width="42"><img src="images/new.gif" height="15px"> </td>
           </tr> </table>
         	</s:iterator>
         </s:else>
		    		 
         </td>
         <td width="291" valign="top">
         <s:if test="news2.size()==0">
         	<div align="center"><br>暂----无</div>
         </s:if>
         <s:else>
         	<s:iterator value="news2" var="economy">
         		 <br>   <table width="234" border="0" align="center" cellpadding="0" cellspacing="0" height="17px">
         		  <tr >
                <td width="77" height="17"><strong><a href="index!getNewsByCid.action?topId=2&cid=<s:property value="#economy.category.id"/>">[<s:property value="#economy.category.name"/>]</a></strong></td>
             <td width="115"><a href="index!getNewsById.action?topId=2&news.id=<s:property value="#economy.id"/>">
             <s:if test="#economy.title.length()>7">
             	<s:property value="#economy.title.substring(0,7)"/>...
             </s:if>
             <s:else>
             	<s:property value="#economy.title"/>
             </s:else>    
            
             
             </a></td>
             <td width="42"><img src="images/new.gif" height="15px"> </td>
           </tr> </table>
         	</s:iterator>
         </s:else>
		   </td>
       </tr>
     </table>



 	  </td>
    </tr>
   <tr>
     <td height="222">

	 <table width="584" height="226" border="0" cellpadding="0" cellspacing="0" background="images/rightTwo.jpg">
       <tr>
         <td height="44"><table width="262" border="0" align="center" cellpadding="0" cellspacing="0">
           <tr>
             <td width="131" height="18">&nbsp;</td>
             <td width="134"><div align="right"><strong><a href="index!getNewsList.action?topId=4"><font color="#FFFFFF">more...</font></a></strong></div></td>
           </tr>
         </table></td>
         <td height="44"><table width="262" border="0" align="center" cellpadding="0" cellspacing="0">
           <tr>
             <td width="131" height="18">&nbsp;</td>
             <td width="134"><div align="right"><strong><a href="index!getNewsList.action?topId=3"><font color="#FFFFFF">more...</font></a></strong></div></td>
           </tr>
         </table></td>
       </tr>
       <tr>
         <td width="293" valign="top">
		  		 
		  		 <s:if test="news4.size()==0">
         	<div align="center"><br>暂----无</div>
         </s:if>
         <s:else>
         	<s:iterator value="news4" var="law">
         		 <br>   <table width="234" border="0" align="center" cellpadding="0" cellspacing="0" height="17px">
         		  <tr >
                <td width="77" height="17px"><strong><a href="index!getNewsByCid.action?topId=4&cid=<s:property value="#law.category.id"/>">[<s:property value="#law.category.name"/>]</a></strong></td>
             <td width="115"><a href="index!getNewsById.action?topId=4&news.id=<s:property value="#law.id"/>">
              <s:if test="#law.title.length()>7">
             	<s:property value="#law.title.substring(0,7)"/>...
             </s:if>
             <s:else>
             	<s:property value="#law.title"/>
             </s:else>    
             </a></td>
             <td width="42"><img src="images/new.gif" height="15px"> </td>
           </tr> </table>
         	</s:iterator>
         </s:else>
		  		 
		  		 <br></td>
         <td width="296" valign="top">

		 		  <s:if test="news3.size()==0">
         	<div align="center"><br>暂----无</div>
         </s:if>
         <s:else>
         	<s:iterator value="news3" var="science">
         		 <br>   <table width="234" border="0" align="center" cellpadding="0" cellspacing="0" height="17px">
         		  <tr >
                <td width="77" height="17"><strong><a href="index!getNewsByCid.action?topId=3&cid=<s:property value="#science.category.id"/>">[<s:property value="#science.category.name"/>]</a></strong></td>
             <td width="115"><a href="index!getNewsById.action?topId=3&news.id=<s:property value="#science.id"/>">
              <s:if test="#science.title.length()>7">
             	<s:property value="#science.title.substring(0,7)"/>...
             </s:if>
             <s:else>
             	<s:property value="#science.title"/>
             </s:else>    
             </a></td>
             <td width="42"><img src="images/new.gif" height="15px"> </td>
           </tr> </table>
         	</s:iterator>
         </s:else>


		 <br></td>
       </tr>
     </table></td>
    </tr>
   <tr>
     <td height="225">

	   <table width="584" height="228" border="0" cellpadding="0" cellspacing="0" background="images/rightThree.jpg">
       <tr>
         <td height="42"><table width="262" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
           <tr>
             <td width="131" height="23">&nbsp;</td>
             <td width="134"><div align="right"><strong><a href="index!getNewsList.action?topId=5"><font color="#FFFFFF">more...</font></a></strong></div></td>
           </tr>
         </table></td>
         <td height="42"><table width="262" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
           <tr>
             <td width="131" height="18">&nbsp;</td>
             <td width="134"><div align="right"><strong><a href="index!getNewsList.action?topId=6"><font color="#FFFFFF">more...</font></a></strong></div></td>
           </tr>
         </table></td>
       </tr>
       <tr>
         <td width="293" valign="top">
          <s:if test="news5.size()==0">
         	<div align="center"><br>暂----无</div>
         </s:if>
         <s:else>
         	<s:iterator value="news5" var="society">
         		 <br>   <table width="234" border="0" align="center" cellpadding="0" cellspacing="0" height="17px">
         		  <tr >
                <td width="77" height="17"><strong><a href="index!getNewsByCid.action?topId=5&cid=<s:property value="#society.category.id"/>">[<s:property value="#society.category.name"/>]</a></strong></td>
             <td width="115"><a href="index!getNewsById.action?topId=5&news.id=<s:property value="#society.id"/>"><s:property value="#society.title"/></a></td>
             <td width="42"><img src="images/new.gif" height="15px"> </td>
           </tr> </table>
         	</s:iterator>
         </s:else>
         
		  
		 <br></td>
         <td valign="top">
         <s:if test="news6.size()==0">
         	<div align="center"><br>暂----无</div>
         </s:if>
         <s:else>
         	<s:iterator value="news6" var="fun">
         		 <br>   <table width="234" border="0" align="center" cellpadding="0" cellspacing="0" height="17px">
         		  <tr >
                <td width="77" height="17"><strong><a href="index!getNewsByCid.action?topId=6&cid=<s:property value="#fun.category.id"/>">[<s:property value="#fun.category.name"/>]</a></strong></td>
             <td width="115"><a href="index!getNewsById.action?topId=6&news.id=<s:property value="#fun.id"/>"><s:property value="#fun.title"/></a></td>
             <td width="42"><img src="images/new.gif" height="15px"> </td>
           </tr> </table>
         	</s:iterator>
         </s:else>

      <br></td>
       </tr>
     </table>

	 </td>
    </tr>
 </table>
 <table width="800" height="25" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/bottencc.jpg">
    <a href="login.jsp"><div align="center">进入后台</div></a></td>
  </tr>
</table>
<table width="800" height="80" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <th background="images/bottom.jpg" scope="col"></th>
  </tr>
</table>
</div>
</body>
</html>
