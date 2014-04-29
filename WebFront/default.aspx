<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<html>
	<HEAD>
		<G:HtmlHead id="HeadXuHui" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<script src="jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="jquery.KinSlideshow.js" type="text/javascript"></script>
	</HEAD>
	<!--#include file="func.aspx"-->
	<!--#include file="../insql.aspx"-->
	
	<script runat="server" language="C#">
	
	 StringBuilder viewpic = new StringBuilder();
	 
	 private void Page_Load(object sender,System.EventArgs e)
	  {
	  
DataTable dt,idt;
SqlDB db = new SqlDB();
			
cid="50";
db.SqlString = "select top 5 CHTopic,"+cid+",chcode,'' as imgstr,"+cid+",chcode,CHTopic,CHContent from "+GetChannelDataTableName(cid)+" where chcontent like '%img%' and CHState=0 order by chputdate desc";
dt = db.GetDataTable();
			
foreach(DataRow aRow in dt.Rows)
    {
	string imgStr="";
				Match match = new Regex(".*?<img.+?src=['|\"](?<iname>[^'\"]+)['|\"].*?>.*?").Match(aRow[7].ToString());
				if (match.Success)
				{
					imgStr = "<img src=\"" + match.Result("${iname}").ToLower() +"\" alt='"+aRow[0].ToString()+"' border='0' />";
				}
	
        viewpic.Append("<a href='sub_pic.aspx?cid="+aRow[1].ToString()+"&id="+aRow[2].ToString()+"' target='_blank'>"+imgStr+"</a>");    
    }
	
	
	
	
	  cid="21";
	  ListBoxhbdt.SqlStr="select "+cid+",chcode,chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+cast(datepart(month,chputdate) as varchar(50))+'-'+(Case When datepart(day,chputdate)<10 Then '0' Else '' End)+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
	  

      cid="45";
	  ListBoxhbzs.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
	  
	  cid="83";
	  ListBoxfsaq.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
	  
	  cid="24";
	  ListBoxzxgg.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
	  
	  cid="5";
	  listboxzcfg.DataTable=GetDataSql_4("25,26,76,77");
	  
	  cid="47";
	  listboxlscj.DataTable=GetDataSql_4("73,74");
	  
	  cid="10";
	  listbox3nxdjh.DataTable=GetDataSql_4("48,49,78");
	  
	  }
	
	private DataTable GetDataSql_4(string chstr)
{
	SqlDB db = new SqlDB();
	DataTable dt,dtt;
	DataTable ndt = new DataTable();
    DataTable idt2 = new DataTable();
    DataRow[] idrs;	
	ndt.Columns.Add("chid1");
	ndt.Columns.Add("chcode");
	ndt.Columns.Add("title");
	ndt.Columns.Add("chtopic");
	ndt.Columns.Add("chyear");
	ndt.Columns.Add("chmonth");
	ndt.Columns.Add("chday");
	ndt.Columns.Add(new DataColumn("CHPutDate",typeof(DateTime)));	
	DataRow[] cdr=GetChannels().Select(" channelcode in ("+chstr+")","channelindex asc");

	foreach(DataRow idr in cdr){

			db.SqlString = "select top 6 "+idr["ChannelCode"].ToString()+",Chcode,chtopic as title,Chtopic,Cast(datepart(year,chputdate) as varchar(50)),(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+Cast(datepart(month,chputdate) as varchar(50)) as chmonth, (Case When datepart(day,chputdate)<10 Then '0' Else '' End)+Cast(datepart(day,chputdate) as varchar(50)) as chday,chputdate from  "+GetChannelDataTableName(idr["channelcode"].ToString())+" where CHState=0 "+GetSortField(idr["channelcode"].ToString());
		
		dtt = db.GetDataTable();
		foreach(DataRow iddr in dtt.Rows){
			ndt.Rows.Add(iddr.ItemArray);
		}
		
	}
		idrs = ndt.Select("","CHPutDate desc");
		idt2.Columns.Add("chid1");
		idt2.Columns.Add("chcode");
		idt2.Columns.Add("title");	
		idt2.Columns.Add("chtopic");
		idt2.Columns.Add("chyear");
		idt2.Columns.Add("chmonth");
        idt2.Columns.Add("chday");		
		idt2.Columns.Add("CHPutDate");
		foreach(DataRow dr in idrs){
			if(idt2.Rows.Count > 6)
			{
				break;
			}
			idt2.Rows.Add(dr.ItemArray);
		}
	return idt2;
}	
	
	</script>
	
	
<script>
    $(document).ready(function () {
        $("#picsShow").KinSlideshow({titleBar:{titleBar_height:45,titleBar_bgColor:"#000000",titleBar_alpha:0.4}});
    });
</script>

<body>
<form id="FormXuHui" runat="server">
<!--#include file="main_head.aspx"-->
<div class="wrap_980">
 <div class="main de_DL de_hbdt pt10">
  <div class="main wk">
   <div class="main nk">
    <div class="main de_picnews" id="picsShow" style="visibility:hidden;">
	
	<%=viewpic.ToString()%>
	
	</div>
	<div class="side de_hbdt_news">
	 <div class="main box lmys_001">
	  <div class="main L">
	   <dl>
	    <dt>环保动态</dt>
		<dd></dd>
	   </dl>
	  </div>
	  <div class="side R"><a href="redirect.aspx?cid=21">更多+</a></div>
	 </div>
	 <div class="main box sjlb">
	  <ul>
	   <li>
	    <!--环保动态文章列表-->
	    <G:listBox id="ListBoxhbdt" rows="6" contentfield="chtopic" showchars="22" runat="server">
		<G:Template id="Templatehbdt" runat="server">
		 <dl><dt><a href="sub_news.aspx?cid=*&id=*">*</a></dt><dd>(*)</dd></dl>
		</G:Template>
		</G:listBox>
	   <!--环保动态文章列表-->
	   </li>
	  </ul>
	 </div>
	</div>
   </div>
  </div>
 </div>
 <div class="side de_DR pt10">
  <div class="main box lmys_002">
   <dl>
    <dt>信息公开</dt>
	<dd><img src="images/de_M_009.gif"></dd>
	<dd><a href="sub_xxgk_jsxmspcx.aspx?cid=57">更多+</a></dd>
   </dl>
  </div>
  <div class="main de_xxgk">
   <ul>
    <li><a href="/webfront/intro_xxgk_01.aspx" target="_blank"><img src="images/de_M_002.jpg"></a></li>
	<li><a href="/webfront/intro_xxgk_02.aspx" target="_blank"><img src="images/de_M_003.jpg"></a></li>
	<li><a href="/webfront/intro_xxgk_03.aspx" target="_blank"><img src="images/de_M_004.jpg"></a></li>
	<li><a href="/webfront/intro_xxgk_04.aspx" target="_blank"><img src="images/de_M_005.jpg"></a></li>
	<li><a href="/webfront/intro_xxgk_05.aspx" target="_blank"><img src="images/de_M_006.jpg"></a></li>
   </ul>
  </div>
 </div>
 <div class="clear"></div>
</div>

<div class="wrap_980">
 <div class="main box pt10">
  <div class="main de_DL">
   <div class="main bkys_001">
    
	<div class="main box lmys_003">
	 <div class="main L">
	  <dl><dt>三年行动计划</dt><dd><img src="images/de_M_011.gif"></dd></dl>
	 </div>
	 <div class="side R">
	  <dl><dt><a href="redirect.aspx?cid=48">更多+</a></dt><dd><img src="images/de_M_013.gif"></dd></dl>
	 </div>
	</div>
	<div class="main de_sjys_001">
	 <ul>
	  <!--三年行动计划文章列表--> 
	   <G:ListBox id="listbox3nxdjh" rows="6" contentfield="chtopic" showchars="23" runat="server">
       <G:Template id="Templatesnxd" runat="server">
		<li><a href="sub_news.aspx?cid=*&id=*">*</a></li>
	   </G:Template>
       </G:ListBox>
	   <!--三年行动计划文章列表--> 
	 </ul>
	</div>
	
   </div>
   <div class="side bkys_001">
    
	<div class="main box lmys_003">
	 <div class="main L">
	  <dl><dt>辐射安全</dt><dd><img src="images/de_M_011.gif"></dd></dl>
	 </div>
	 <div class="side R">
	  <dl><dt><a href="redirect.aspx?cid=83">更多+</a></dt><dd><img src="images/de_M_013.gif"></dd></dl>
	 </div>
	</div>
	<div class="main de_sjys_001">
	 <ul>
	  <!--辐射安全文章列表--> 
	   <G:ListBox id="ListBoxfsaq" rows="6" contentfield="chtopic" showchars="23" runat="server">
       <G:Template id="Templatefsaq" runat="server">
		<li><a href="sub_news.aspx?cid=*&id=*">*</a></li>
	   </G:Template>
       </G:ListBox>
	   <!--辐射安全文章列表--> 
	 </ul>
	</div>
	
   </div>
  </div>
  <div class="side de_DR">
   <div class="main xxgk_btn">
    <div class="main nk">
	 <ul>
	  <li><a href="/webfront/sub_xxgk_jsxmspcx.aspx?cid=57"><img src="images/de_M_007.jpg"></a></li>
	  <li><a href="/webfront/sub_yejianshigong.aspx?cid=58"><img src="images/de_M_008.jpg"></a></li>
	  <li><a href="/webfront/redirect.aspx?cid=85"><img src="images/de_M_009.jpg"></a></li>
	  <li><a href="/webfront/sub_newslist.aspx?cid=20"><img src="images/de_M_010.jpg"></a></li>
	  <li><a href="/webfront/sub_newslist.aspx?cid=19"><img src="images/de_M_011.jpg"></a></li>
	 </ul>
	</div>
   </div>
  </div>
 </div>
 <div class="clear"></div>
</div>

<div class="wrap_980">
 <div class="main box pt10">
  <div class="main de_DL de_M_picbtn01">
   <ul>
    <li><a href="/webfront/intro_hudong_01.aspx" target="_blank"><img src="images/de_M_012.jpg"></a></li>
	<li><a href="/webfront/sub_news.aspx?cid=63&id=4" target="_blank"><img src="images/de_M_013.jpg"></a></li>
	<li><a href="/webfront/intro_hudong_02.aspx" target="_blank"><img src="images/de_M_014.jpg"></a></li>
   </ul>
  </div>
  <div class="side de_DR de_M_picbtn02">
   <a href="/xuhuihuanbaogis_2006/speedmap/speedmap.aspx" target="_blank"><img src="images/de_M_015.jpg"></a>
  </div>
 </div>
 <div class="clear"></div>
</div>

<div class="wrap_980">
 <div class="main box pt10">
  <div class="main de_DL">
   <div class="main bkys_001">
    <div class="main box lmys_003">
	 <div class="main L">
	  <dl><dt>环保知识</dt><dd><img src="images/de_M_011.gif"></dd></dl>
	 </div>
	 <div class="side R">
	  <dl><dt><a href="sub_lsxc.aspx?cid=45">更多+</a></dt><dd><img src="images/de_M_013.gif"></dd></dl>
	 </div>
	</div>
	<div class="main de_sjys_001">
	 <ul>
	  <!--环保知识文章列表--> 
	   <G:ListBox id="ListBoxhbzs" rows="6" contentfield="chtopic" showchars="23" runat="server">
       <G:Template id="Templatehbzs" runat="server">
		<li><a href="sub_news.aspx?cid=*&id=*">*</a></li>
	   </G:Template>
       </G:ListBox>
	   <!--环保知识文章列表--> 
	 </ul>
	</div>
   </div>
   <div class="side bkys_001">
    
	<div class="main box lmys_003">
	 <div class="main L">
	  <dl><dt>绿色创建</dt><dd><img src="images/de_M_011.gif"></dd></dl>
	 </div>
	 <div class="side R">
	  <dl><dt><a href="redirect.aspx?cid=47">更多+</a></dt><dd><img src="images/de_M_013.gif"></dd></dl>
	 </div>
	</div>
	<div class="main de_sjys_001">
	 <ul>
	  <!--污染防治文章列表--> 
	  <G:ListBox id="listboxlscj" rows="6" contentfield="chtopic" showchars="23" runat="server">
      <G:Template id="Templatelscj" runat="server">
	   <li><a href="sub_news.aspx?cid=*&id=*">*</a></li>
      </G:Template>
      </G:ListBox>
	  <!--污染防治文章列表--> 
	 </ul>
	</div>
	
   </div>
  </div>
  <div class="side de_DR">
   <div class="main box lmys_002">
    <dl>
     <dt>政策法规</dt>
	 <dd><img src="images/de_M_009.gif"></dd>
	 <dd><a href="sub_zcfg.aspx?cid=25">更多+</a></dd>
    </dl>
   </div>
   <div class="main de_zcfg">
    <ul>
	 <!--政策法规文章列表--> 
	 <G:ListBox id="listboxzcfg" rows="6" contentfield="chtopic" showchars="20" runat="server">
     <G:Template id="Templatezcfg" runat="server">
	  <li><a href="sub_news.aspx?cid=*&id=*">*</a></li>
     </G:Template>
     </G:ListBox>
	 <!--政策法规文章列表--> 
	</ul>
   </div>
  </div>
 </div>
 <div class="clear"></div>
</div>

<div class="wrap_980">
 <div class="main mt10 de_yqlj_tj">
  <div class="main L">
   <dl>
    <dt>友情链接：</dt>
	<dd>
	 <select name="select1" onchange="if(this.options[this.selectedIndex].value!=''){window.open(this.options[this.selectedIndex].value);}" class="select_01">
	  <option selected>区内政府部门网站</option>
	  <G:ListBox id="ListBoxLink1" SqlStr="select chkeyword,chtopic from gcms_ch_67 where chstate=0 order by chputdate desc" runat="server">
      <G:Template id="TemplateLink1" type="repeat" runat="server">                          
       <option value="*">*</option>
      </G:Template>
      </G:ListBox>
	 </select>
	</dd>
	<dd>
	 <select name="select1" onchange="if(this.options[this.selectedIndex].value!=''){window.open(this.options[this.selectedIndex].value);}" class="select_01">
	  <option selected>上海市区县环保局网站</option>
	  <G:ListBox id="ListBoxLink2" SqlStr="select chkeyword,chtopic from gcms_ch_66 where chstate=0 order by chputdate desc" runat="server">
      <G:Template id="TemplateLink2" type="repeat" runat="server">                          
       <option value="*">*</option>
      </G:Template>
      </G:ListBox>
	 </select>
	</dd>
	<dd>
	 <select name="select1" onchange="if(this.options[this.selectedIndex].value!=''){window.open(this.options[this.selectedIndex].value);}" class="select_01">
	  <option selected>国内环保网站</option>
	  <G:ListBox id="ListBoxLink3" SqlStr="select chkeyword,chtopic from gcms_ch_80 where chstate=0 order by chputdate desc" runat="server">
      <G:Template id="TemplateLink3" type="repeat" runat="server">                          
       <option value="*">*</option>
      </G:Template>
      </G:ListBox>
	 </select>
	</dd>
   </dl>
  </div>
  <div class="side R">您是第<span><G:SiteCount id="SiteCount1" SiteCode="1" runat="server"></G:SiteCount></span>位客人</div>
 </div>
 <div class="clear"></div>
</div>
<!--#include file="foot.aspx"-->

</form>
</body>
</html>