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
			
			if(cid=="12"){
				Response.Redirect("sub_lingdaochengyuan.aspx?cid="+cid+"&id="+id);
			}else{
				if(id!="0")
				{
					ListBoxwznr.SqlStr="select chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+cast(datepart(month,chputdate) as varchar(50))+'-'+cast(datepart(day,chputdate) as varchar(50)),(select count(*) from gcms_readlog where channelcode="+cid+" and articlecode="+id+") as chcount,chcontent from "+GetChannelDataTableName(cid)+" where chcode="+id;
					ListBoxwznr.WriteLog(cid,id);
				}
				else
				{
					ListBoxwznr.SqlStr="select chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+cast(datepart(month,chputdate) as varchar(50))+'-'+cast(datepart(day,chputdate) as varchar(50)),chcontent from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
					ListBoxwznr.WriteLog(cid,id);
				}
			}
			
		}
	</script>

<body>
<form id="FormXuHui" runat="server">
<!--#include file="head.aspx"-->
  
<div class="wrap_980">
 <div class="main box pop_news">
  <div class="main nk">
   <div class="main box sub_lmys_001">
	<dl>
	 <dt><%=GetChannelName(cid)%></dt>
	 <dd></dd>
	</dl>
   </div>
   <div class="main box pop_news_xxnr">
    
    <G:ListBox id="ListBoxwznr" rows="1" alert="本栏目正在建设中..." runat="server">
    <G:Template id="Templatewznr" runat="server">
	 <div class="main box bt">*</div>
	 <div class="main box fbsh_ll">
	  <ul><li>发布时间：*&nbsp;&nbsp;&nbsp;&nbsp;已被浏览：*&nbsp;次</li></ul>
	 </div>
	 <div class="main box xxnr">
	  <ul>
	   <li>*</li>
	  </ul>
	 </div>
    </G:Template>
    </G:ListBox>

   </div>
  </div>
 </div>
 <div class="clear"></div>
</div>

<!--#include file="foot.aspx"-->
</form>
</body>
</html>
