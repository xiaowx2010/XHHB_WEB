<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<html>
<head>
<G:HtmlHead id="HeadXuHui" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="wf.css" rel="stylesheet" type="text/css">
<link href="skins/3.css" rel="stylesheet" type="text/css">
</head>
<!--#include file="func.aspx"-->
<!--#include file="../insql.aspx"-->
<script runat="server" language="C#">
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			TraceUpXuHui.ChannelCode=cid;


//			ListBoxlb.SqlStr="select "+cid+",chcode,chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+cast(datepart(month,chputdate) as varchar(50))+'-'+(Case When datepart(day,chputdate)<10 Then '0' Else '' End)+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";

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
	  <dt>建设项目环境影响评价受理信息公示</dt>
	  <dd></dd>
	 </dl>
	</div>

	<!--
	<div class="main box sub_xxgk_cxjg">
	 <ul><li>查询结果</li></ul>
	</div>
    -->

	<div class="main box sub_xxgk_hpsp">
     <div class="main box bt">建设项目环境影响评价受理信息公示</div>
	 <div class="main box sub_xxgk_hpsp_tab">
      <table width="100%"  border="0" cellpadding="5" cellspacing="1" bgcolor="#71BE5E">
        <tr class="fl">
          <td width="144" class="txt_01">项目名称</td>
          <td width="130" class="txt_01">建设地点</td>
          <td width="70" class="txt_01">建设单位</td>
          <td class="txt_01">环评形式</td>
          <td width="82" class="txt_01">环境影响评价机构</td>
          <td width="88" class="txt_01">公示时间</td>
          <td width="66" class="txt_01">公示状态</td>
        </tr>
        <tr class="bg_01">
          <td class="txt_02"><a href="#">宝嘉公路（宝山段）道路新建工程</a></td>
          <td class="txt_02">宝山区/县罗店镇西起宝山嘉定区界，东至沪太公路与月罗公路衔接处</td>
          <td class="txt_02">上海市宝山区重大工程建设指挥部</td>
          <td class="txt_02">环境影响报告书</td>
          <td class="txt_02">上海船舶运输科学研究所</td>
          <td class="txt_02">2014-03-12~2014-03-26</td>
          <td class="txt_02">已过期</td>
        </tr>
		<tr class="bg_02">
          <td class="txt_02"><a href="#">宝嘉公路（宝山段）道路新建工程</a></td>
          <td class="txt_02">宝山区/县罗店镇西起宝山嘉定区界，东至沪太公路与月罗公路衔接处</td>
          <td class="txt_02">上海市宝山区重大工程建设指挥部</td>
          <td class="txt_02">环境影响报告书</td>
          <td class="txt_02">上海船舶运输科学研究所</td>
          <td class="txt_02">2014-03-12~2014-03-26</td>
          <td class="txt_02">已过期</td>
        </tr>
		<tr class="bg_01">
          <td class="txt_02"><a href="#">宝嘉公路（宝山段）道路新建工程</a></td>
          <td class="txt_02">宝山区/县罗店镇西起宝山嘉定区界，东至沪太公路与月罗公路衔接处</td>
          <td class="txt_02">上海市宝山区重大工程建设指挥部</td>
          <td class="txt_02">环境影响报告书</td>
          <td class="txt_02">上海船舶运输科学研究所</td>
          <td class="txt_02">2014-03-12~2014-03-26</td>
          <td class="txt_02">已过期</td>
        </tr>
		<tr class="bg_02">
          <td class="txt_02"><a href="#">宝嘉公路（宝山段）道路新建工程</a></td>
          <td class="txt_02">宝山区/县罗店镇西起宝山嘉定区界，东至沪太公路与月罗公路衔接处</td>
          <td class="txt_02">上海市宝山区重大工程建设指挥部</td>
          <td class="txt_02">环境影响报告书</td>
          <td class="txt_02">上海船舶运输科学研究所</td>
          <td class="txt_02">2014-03-12~2014-03-26</td>
          <td class="txt_02">已过期</td>
        </tr>
		<tr class="bg_01">
          <td class="txt_02"><a href="#">宝嘉公路（宝山段）道路新建工程</a></td>
          <td class="txt_02">宝山区/县罗店镇西起宝山嘉定区界，东至沪太公路与月罗公路衔接处</td>
          <td class="txt_02">上海市宝山区重大工程建设指挥部</td>
          <td class="txt_02">环境影响报告书</td>
          <td class="txt_02">上海船舶运输科学研究所</td>
          <td class="txt_02">2014-03-12~2014-03-26</td>
          <td class="txt_02">已过期</td>
        </tr>
      </table>
	  </div>
	  <div class="main box zm">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受理信息公示期间，公众（包括个人、团体等）可以通过本网站留言、电子邮件、传真或信函（以邮戳为准）方式提出意见。
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电子邮件：hpk@xh.sh.cn，传真：021-64878385
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信函请寄至：南丹东路106号5楼 环境影响评价科 收（邮编：200030）。请在信封上注明：对XXX （建设项目）的意见。
	  </div>

    </div>

   </div>
  </div>
  <div class="side sub_R">
   <div class="main box right_topbg"></div>
   <div class="main Righttree">
    <ul>
     <li><a href="#" class="dq">环评审批公告</a></li>
	 <dl><dt><a href="#">建设项目环境影响评价受理信息公示</a></dt></dl>
	 <dl><dd><a href="#">建设项目环境影响评价拟审批公示</a></dd></dl>
	 <dl><dd><a href="#">建设项目环境影响评价审批决定公告</a></dd></dl>
	 <dl><dd><a href="#">建设项目竣工环境保护验收受理信息公示</a></dd></dl>
	 <dl><dd><a href="#">建设项目竣工环境保护验收拟审批公示</a></dd></dl>
	 <dl><dd><a href="#">建设项目竣工环境保护验收审批决定公告</a></dd></dl>
     <li><a href="redirect.aspx?cid=58">夜间施工审批查询</a></li>
     <li><a href="redirect.aspx?cid=82">建设项目环评公示</a></li>
     <li><a href="redirect.aspx?cid=19">排污收费名录</a></li>
     <li><a href="redirect.aspx?cid=20">辐射安全许可名录</a></li>
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
