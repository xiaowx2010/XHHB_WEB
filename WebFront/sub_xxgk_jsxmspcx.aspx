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
		string str="";
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			TraceUpXuHui.ChannelCode=cid;
			LeftFree.Url="tree.aspx?cid="+cid;
			
			ListBoxcxjg.SqlStr="select "+cid+",chcode,chtopic,fld_"+cid+"_10,fld_"+cid+"_11,fld_"+cid+"_13 from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
		}
		
		private void Go_Submit(object sender,System.Web.UI.ImageClickEventArgs e)
		{
			str=vname.Value;
			ListBoxcxjg.SqlStr="select "+cid+",chcode,chtopic,fld_"+cid+"_10,fld_"+cid+"_11,fld_"+cid+"_13 from "+GetChannelDataTableName(cid)+" where chstate=0 and chtopic like '%"+str+"%' order by chputdate desc";
		//	Response.Write(ListBoxcxjg.SqlStr);
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
	
	<div class="main box sub_xxgk_srk01">
	 <dl>
	  <dt>请输入项目名称进行查询：</dt>
	  <dd><input id="vname" name="textarea" type="text" value="" runat="server" class="input_01"></dd>
	  <dd><input id="field11" name="imageField" type="image" class="input_02" src="images/sub_zxhd_jsxm_07.jpg" align="middle" border="0" onserverclick="Go_Submit" runat="server"></dd>
	 </dl>
	</div> 
	
	<div class="main box sub_xxgk_cxjg">
	 <ul><li>查询结果</li></ul>
	</div>

	<div class="main box sub_lb_xxgk_cx">
	 <dl><dt>项目名称</dt><dd>验收</dd><dd>批准</dd><dd>受理</dd></dl>
	</div>
	
	<div class="main box sub_lb_xxgk_sj">
	<!--查询结果-->                          
    <G:ListBox id="ListBoxcxjg" rows="7" contentfield="chtopic" showchars="15" runat="server">
    <G:Template id="Templatecxjg" runat="server">

	 <dl><dt><a href="javascript:__doOpenArticle('pop_chaxunjieguo.aspx?cid=*&id=*')">*</a></dt><dd>*</dd><dd>*</dd><dd>*</dd></dl>
	 
    </G:Template>
    <G:NavStyle5 id="NavStyle1" prevtext="上一页" nexttext="下一页" class="fy" runat="server"></G:NavStyle5>
    </G:ListBox>
<!--查询结果--> 
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
