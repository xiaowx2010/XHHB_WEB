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
	string filmtitle,filmname;
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			TraceUpXuHui.ChannelCode=cid;
			LeftFree.Url="tree.aspx?cid="+cid;
			
			ListBoxsplb.SqlStr="select "+cid+",chcode,chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+cast(datepart(month,chputdate) as varchar(50))+'-'+(Case When datepart(day,chputdate)<10 Then '0' Else '' End)+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			SqlDB db = new SqlDB();
			if(id !="0"){
				db.SqlString = "SELECT  * FROM "+GetChannelDataTableName(cid)+"  WHERE CHState=0 and CHCode="+id+" ORDER BY CHLastDate DESC ";
			}else{
				db.SqlString = "SELECT top 1 * FROM "+GetChannelDataTableName(cid)+"  WHERE CHState=0 ORDER BY "+ChSortField(cid)+" ";
			}	
				
			DataTable dt = db.GetDataTable();
			if(dt.Rows.Count>0){						
				filmtitle = dt.Rows[0]["chtopic"].ToString();				
				string[] videos= dt.Rows[0]["fld_"+cid+"_10"].ToString().Split(';');
				if(videos.Length>0 && videos[0].Trim().Length>0){
					db.SqlString = "select * from gcms_Attachments where AttachmentsCode="+videos[0];
					DataTable idt = db.GetDataTable();
					if(idt.Rows.Count>0){
						if(idt.Rows[0]["AttachmentsExtName"].ToString().ToLower() == ".swf") 
						{
							alertwmplay.Visible=false;
							alertswfplay.Visible=true;
							}
						filmname = ConfigurationSettings.AppSettings["ATTACHMENT_ROOT"]+idt.Rows[0]["AttachmentsName"].ToString();						
					  
					    }
				}
			}else{
				alertwmplay.Visible=false;
			}
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
	<div class="main box filmtitle"><%=filmtitle%></div>
	<div id="alertwmplay" runat="server"  class="main box shiping">
	 <ul>
	  <li>
	  
	  
	<OBJECT ID="WMPlay" width="600" height="420" classid="CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95"
codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701"
standby="Loading Microsoft Windows Media Player components..." type="application/x-oleobject"
VIEWASTEXT>
<PARAM name="FileName" value="<%=filmname%>">
<PARAM name="DisplaySize" value="0">
<PARAM NAME="ShowStatusBar" VALUE="1">
<EMBED type="application/x-mplayer2" pluginspage="http://www.microsoft.com/isapi/redir.dll?prd=windows&sbp=mediaplayer&ar=media&sba=plugin"filename="<%=filmname%>" displaysize="0" ShowStatusBar=1 width="600" height="420"></EMBED>
</OBJECT>
	</li>
	 </ul>
	</div>
	
	<div id="alertswfplay" visible="false" runat="server" align="center">				  
<table width="400"  border="0" cellspacing="0" cellpadding="0">
<tr>
    <td width="20"><img src="images/sub_shiping_03.jpg" width="20" height="16"></td>
    <td colspan="3" background="images/sub_shiping_04.jpg"> </td>
    <td width="18"><img src="images/sub_shiping_06.jpg" width="18" height="16"></td>
</tr>
<tr>
    <td background="images/sub_shiping_08.jpg"> </td>
    <td colspan="3">
    
<object id="film" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
width="362" height="208">
<param name="movie" value="<%=filmname%>">
<param name="quality" value="high">
<embed src="<%=filmname%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="362" height="208"></embed>
</object>
    
   </td>
    <td background="images/sub_shiping_10.jpg"> </td>
</tr>
<tr>
    <td><img src="images/sub_shiping_13.jpg" width="20" height="37"></td>
    <td width="37" background="images/sub_shiping_18.jpg"><a href="javascript:window.document.film.TPlay('_level0')"><img id="Play" src="images/sub_shiping_14.jpg" width="37" height="37" style="cursor:hand;" border="0"></a></td>
    <td width="33" background="images/sub_shiping_18.jpg"><a href="javascript:window.document.film.TStopPlay('_level0')"><img id="Pause" src="images/sub_shiping_15.jpg" width="33" height="37" style="cursor:hand;" border=0></a></td>
    <td width="292" align="left" background="images/sub_shiping_18.jpg"><a href="javascript:window.document.film.TPlay('_level0')"><img id="Play" src="images/sub_shiping_16.jpg" width="32" height="37" style="cursor:hand;" border=0></a></td>
    <td><img src="images/sub_shiping_19.jpg" width="18" height="37"></td>
</tr>
</table>
</div>	

   <div class="main box sub_gd_shiping">
	 <ul><li>更多视频</li></ul>
	</div>
	
<div class="main box shiping_sj">

<G:ListBox id="ListBoxsplb" rows="5" alert="本栏目正在建设中……" contentfield="chtopic" showchars="30"  runat="server">
<G:Template id="Templtesplb" runat="server">

<dl><dt><a href="sub_shiping.aspx?cid=*&id=*')">*</a></dt><dd>(*)</dd></dl>

</G:Template>
<G:NavStyle5 id="NavStyle1" prevtext="上一页" nexttext="下一页" class="fy" runat="server"></G:NavStyle5>
</G:ListBox>

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
