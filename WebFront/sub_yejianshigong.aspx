<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<HTML>
	<HEAD>
		<G:HtmlHead id="HeadXuHui" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"></HEAD>
	<!--#include file="func.aspx"-->
	<!--#include file="../insql.aspx"-->
	<script runat="server" language="C#">
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			TraceUpXuHui.ChannelCode=cid;
			LeftFree.Url="tree.aspx?cid="+cid;
			
			Contentbgxz.DataTable=GetPicList3(0,"69");
		}
	</script>

<body>
<form id="FormXuHui" runat="server">
<!--#include file="head.aspx"-->

<div class="wrap_980">
 <div class="main box pt10">
  <div class="main sub_L">
   <div class="main nk">
    <div class="main box sub_lmys_001">
	 <dl>
	  <dt><%=GetChannelName(cid)%></dt>
	  <dd></dd>
	 </dl>
	</div>
	
	<div class="main box sub_xxgk_yjsg">
	 <ul>
	  <li>
	  <img src="images/sub_xxgk_yjsg_001.jpg">
	  <img src="images/sub_xxgk_yjsg_002.jpg">
	  <a target="_blank" href="/webfront/intro_xxgk_06.aspx" target="_blank"><img src="images/sub_xxgk_yjsg_003.jpg"></a>
	  <img src="images/sub_xxgk_yjsg_004.jpg">
	  
	  <G:Content id="Contentbgxz" runat="server">
	  <G:Template id="Templatebgxz" runat="server">
	  <a href="*"><img src="images/sub_xxgk_yjsg_005.jpg"></a>
	  </G:Template>
	  </G:Content>
	  
	  <img src="images/sub_xxgk_yjsg_006.jpg">
	  <img src="images/sub_xxgk_yjsg_007.jpg">
	  </li>
	 </ul>
	</div>
   </div>
  </div>
  <div class="side sub_R">
   <div class="main box right_topbg"></div>
   <div class="main Righttree"><G:Include id="LeftFree" runat="server" url=""></G:Include></div>
   <div class="main box Right_links">
    <ul>
	 <li><a href="sub_news.aspx?cid=63&id=4" target="_blank"><img src="images/de_M_018.jpg"></a></li>
	 <li><a href="/webfront/intro_hudong_02.aspx" target="_blank"><img src="images/de_M_019.jpg"></a></li>
	</ul>
   </div>
  </div>
 </div>
 <div class="clear"></div>
</div>

<!--#include file="foot.aspx"-->
</form>
</body>
</html>
