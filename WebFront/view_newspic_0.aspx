<!--功能：flash切换等-->
<%@ Page Language="C#" Debug="true"%>
<%@ Register TagPrefix="G" Assembly="Guangye.WebApplication.Controls" Namespace="Guangye.WebApplication.Controls" %>

<HTML>
	<HEAD>
		<G:HtmlHead id="Guangye" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
    <!--#include file="func.aspx"-->
<script language="C#" runat="server">
	string p_pics="",p_texts="",p_links="";
private void Page_Load(object sender, System.EventArgs e)
{
	GetNewsTopPics("50");
	 if(p_pics=="")
        {
            news_flash.Visible=false;
            no_flash.Visible=true;
        }
        
}
//返回第一篇有图片的文章;
private void GetNewsTopPics(string cid){
	
	SqlDB db = new SqlDB();
	db.SqlString ="select top 4 "+cid+", Chcode,(case when Len(chtopic)>=13 then substring(chtopic,0,12)+'...' when ISNUMERIC(chtopic)=1 then '&nbsp' else chtopic end) as chtopic,chcontent,chputdate from  "+GetChannelDataTableName(cid)+" where CHState=0 and chcontent like '%img%' "+GetSortField(cid)+"";
   
    DataTable dt = db.GetDataTable();
    if(dt.Rows.Count>0)
    {
	Regex r = new Regex(".*?<img.+?src=[\'|\"](?<iname>[^\'\"]+)[\'|\"].*?>.*?");
	foreach(DataRow dr in dt.Rows)
	{
		Match m = r.Match(dr["chcontent"].ToString().ToLower());					
		if (m.Success )
		{	
			p_pics+=m.Result("${iname}").ToLower()+"|";
			
			p_texts+=dr["chtopic"].ToString()+"|";
			p_links+=Server.UrlEncode("view_0.aspx?cid="+dr[0].ToString()+"&id="+dr["chcode"].ToString())+"|";
		}
	}
	p_pics=p_pics.Trim('|');
	p_texts=p_texts.Trim('|');
	p_links=p_links.Trim('|');
	}
}		
</script>
<body>
 <div id="news_flash" runat="server">
<script type="text/javascript">
 var focus_width=200
 var focus_height=180
 var text_height=20
 var swf_height = focus_height+text_height
 
 var pics="<%=p_pics%>"
 var links="<%=p_links%>"
 var texts="<%=p_texts%>"

 
 
 document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
 document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="images/guangyefocus.swf"><param name="quality" value="high"><param name="bgcolor" value="#F0F0F0">');
 document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
 document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
 document.write('<embed src="pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0F0F0" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');  
 document.write('</object>');
 </script></div>
  <div id="no_flash" visible="false" runat="server"><img src="images/default_33.GIF" width="190px" height="146px" /></div>
 </body>
 
</html>