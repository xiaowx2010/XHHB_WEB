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
			
			cid="25";
			Gridhjbh.SqlStr="select "+cid+",chcode,chtopic, cast(datepart(year,chputdate) as varchar(50))+'-'+(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+cast(datepart(month,chputdate) as varchar(50))+'-'+(Case When datepart(day,chputdate)<10 Then '0' Else '' End)+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="76";
			Gridhjbz.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="77";
			ListBoxgfx.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="26";
			Gridpfbz.SqlStr="select "+cid+",chcode,chtopic, cast(datepart(year,chputdate) as varchar(50))+'-'+(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+cast(datepart(month,chputdate) as varchar(50))+'-'+(Case When datepart(day,chputdate)<10 Then '0' Else '' End)+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
		}
	</script>

<body>
<form id="FormXuHui" runat="server">
<!--#include file="head.aspx"-->

<div class="wrap_980">
 <div class="main box pt10">
  <div class="main sub_L">
   <div class="main nk">
    
	<div class="main box intro_hbfl_T">
	 <dl><dt><img src="images/intro_01.gif"></dt><dd><img src="images/intro_02.gif"></dd></dl>
	</div>
	<div class="main intro_hbfl_M">
	 <div class="main L"><img src="images/intro_01.jpg"></div>
	 <div class="side R">
	  <div class="main box sub_lmys_001">
	   <div class="main">
	   <dl>
	    <dt>环保法律</dt>
	    <dd></dd>
	   </dl>
	   </div>
	   <div class="side gd"><a href="sub_zcfg.aspx?cid=25">更多+</a></div>
	  </div>
	  <div class="main box lb_sj">
	   <ul>
	    <li>
		  <G:ListBox id="Gridhjbh" rows="5" alert="本栏目正在建设中……" contentfield="chtopic" showchars="20" runat="server">
          <G:Template id="Templatehjbh" runat="server">
		  <dl><dt><a href="sub_news.aspx?cid=*&id=*">*</a></dt><dd>(*)</dd></dl>
		  </G:Template>
          </G:ListBox>
		</li>
	   </ul>
	  </div>
	 </div>
	</div>
	<div class="main box intro_hbfl_B">
	 <dl><dt><img src="images/intro_03.gif"></dt><dd><img src="images/intro_04.gif"></dd></dl>
	</div>
	
	<div class="main box intro_fg_gz">
	 <div class="main intro_hbfg">
	  <div class="main box lm_bt">
	   <div class="main L"><img src="images/intro_05.gif"></div>
	   <div class="main M">
	    <div class="main box sub_lmys_001">
	     <div class="main">
	     <dl>
	      <dt>环保法规</dt>
	      <dd></dd>
	     </dl>
	     </div>
	     <div class="side gd"><a href="sub_zcfg.aspx?cid=76">更多+</a></div>
	    </div>
	   </div>
	   <div class="side R"><img src="images/intro_06.gif"></div>
	  </div>
	  <div class="main nk_sj">
	   <ul>
	     <G:ListBox id="Gridhjbz" rows="5" alert="本栏目正在建设中……" contentfield="chtopic" showchars="20" runat="server">
          <G:Template id="Templatehjbz" runat="server">
		  <li><a href="sub_news.aspx?cid=*&id=*">*</a></li>
		  </G:Template>
          </G:ListBox>
	   </ul>
	  </div>
	 </div>
	 <div class="side intro_hbfg">
	  <div class="main box lm_bt">
	   <div class="main L"><img src="images/intro_05.gif"></div>
	   <div class="main M">
	    <div class="main box sub_lmys_001">
	     <div class="main">
	     <dl>
	      <dt>环保规章</dt>
	      <dd></dd>
	     </dl>
	     </div>
	     <div class="side gd"><a href="sub_zcfg.aspx?cid=77">更多+</a></div>
	    </div>
	   </div>
	   <div class="side R"><img src="images/intro_06.gif"></div>
	  </div>
	  <div class="main nk_sj">
	   <ul>
	     <G:ListBox id="ListBoxgfx" rows="5" alert="本栏目正在建设中……" contentfield="chtopic" showchars="20" runat="server">
          <G:Template id="Templatehbgz" runat="server">
		  <li><a href="sub_news.aspx?cid=*&id=*">*</a></li>
		  </G:Template>
          </G:ListBox>
	   </ul>
	  </div>
	 </div>
	</div>
	
	<div class="main box intro_hbfl_T mt12">
	 <dl><dt><img src="images/intro_01.gif"></dt><dd><img src="images/intro_02.gif"></dd></dl>
	</div>
	<div class="main intro_hbfl_M">
	 <div class="main L"><img src="images/intro_02.jpg"></div>
	 <div class="side R">
	  <div class="main box sub_lmys_001">
	   <div class="main">
	   <dl>
	    <dt>环境标准</dt>
	    <dd></dd>
	   </dl>
	   </div>
	   <div class="side gd"><a href="sub_zcfg.aspx?cid=26">更多+</a></div>
	  </div>
	  <div class="main box lb_sj">
	   <ul>
	    <li>
		  <G:ListBox id="Gridpfbz" rows="5" alert="本栏目正在建设中……" contentfield="chtopic" showchars="20" runat="server">
          <G:Template id="Templatepfbz" runat="server">
		  <dl><dt><a href="sub_news.aspx?cid=*&id=*">*</a></dt><dd>(*)</dd></dl>
		  </G:Template>
          </G:ListBox>
		</li>
	   </ul>
	  </div>
	 </div>
	</div>
	<div class="main box intro_hbfl_B">
	 <dl><dt><img src="images/intro_03.gif"></dt><dd><img src="images/intro_04.gif"></dd></dl>
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
