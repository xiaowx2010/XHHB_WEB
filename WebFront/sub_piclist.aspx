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
			
			ContainListtp.DataTable = GetPicListFromContent(cid);
			//Response.Write("select  CHTopic,"+cid+",chcode,'' as imgstr,"+cid+",chcode,CHTopic,CHContent from "+GetChannelDataTableName(cid)+" where chcontent like '%img%' and CHState=0 order by chputdate desc");
		}
		
		private DataTable GetPicListFromContent(string cid)
		{
		
		 //<dt><a title="*" href="sub_news_tpxw.aspx?cid=*&id=*">*</a></dt>
		 //<dd><a href="sub_news_tpxw.aspx?cid=*&id=*">*</a></dd>
			DataTable dt,idt;
			SqlDB db = new SqlDB();
			
			db.SqlString = "select  CHTopic,"+cid+",chcode,'' as imgstr,"+cid+",chcode,CHTopic,CHContent from "+GetChannelDataTableName(cid)+" where chcontent like '%img%' and CHState=0 order by chputdate desc";
			dt = db.GetDataTable();
			
			return dt;		
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
	
	<div class="main box sub_pic_lb">
	 <ul>
	  <li> 
	   
<G:ContainList id="ContainListtp" rows="3" cols="4" alert="����Ŀ��ʱû�����ݣ�" runat="server">
<G:TopArticle id="TopArticle_10" imgstr="images/sub_pp01.JPG" contentfield="CHContent" runat="server"  showchars="110">
<G:Template id="Templatetp" runat="server">


<dl>
<dt><a title="*" href="sub_pic.aspx?cid=*&id=*">*</a></dt>
<dd><a href="sub_pic.aspx?cid=*&id=*">*</a></dd>
</dl>

		
</G:Template>
</G:TopArticle>
<G:NavStyle5 id="NavStyle55" prevtext="��һҳ" nexttext="��һҳ" class="fy" runat="server"></G:NavStyle5>
</G:ContainList>
	   
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
