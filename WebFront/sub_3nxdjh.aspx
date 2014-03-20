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
			
			
			ListBoxlb.SqlStr="select "+cid+",chcode,chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+cast(datepart(month,chputdate) as varchar(50))+'-'+(Case When datepart(day,chputdate)<10 Then '0' Else '' End)+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			int _c=ListBoxlb.DataTable.Rows.Count;
			if(_c==0)
			{
				DataRow[] drs=GetChannels().Select("channeluppercode="+cid+"");
				if(drs.Length>0)
				{
					Response.Redirect("redirect.aspx?cid="+drs[0]["channelcode"].ToString()+"");
				}
			}
			/*
			else if(_c<4)
			{
				Response.Redirect("sub_news.aspx?cid="+cid+"");
			}
			*/
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
	<div class="main box sub_lb_btsj">
	 <dl><dt>标&nbsp;&nbsp;&nbsp;&nbsp;题</dt><dd>时&nbsp;&nbsp;&nbsp;&nbsp;间</dd></dl>
	</div>
	<div class="main box sub_news_lb">
	 <ul>
	  <li>
	   
	   <G:ListBox id="ListBoxlb" rows="15" alert="本栏目正在建设中……" contentfield="chtopic" showchars="50" runat="server">
       <G:Template id="Templatelb" runat="server">
	    <dl><dt><a href="sub_news.aspx?cid=*&id=*">*</a></dt><dd>*</dd></dl>
       </G:Template>
       <G:NavStyle5 id="NavStyle1" prevtext="上一页" nexttext="下一页" class="fy" runat="server"></G:NavStyle5>
       </G:ListBox>
	   
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
