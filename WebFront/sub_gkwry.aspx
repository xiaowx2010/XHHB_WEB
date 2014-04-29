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
<link href="skins/6.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
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
			LeftFree.Url="tree.aspx?cid="+cid;

//			ListBoxlb.SqlStr="select "+cid+",chcode,chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+cast(datepart(month,chputdate) as varchar(50))+'-'+(Case When datepart(day,chputdate)<10 Then '0' Else '' End)+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
            list.SqlStr="select entName, portName, convert(varchar(10),monitorTime,120) as monitorTime,flow,factorName,factorValue,standard from sync_sewage order by monitorTime desc";
            list.Rows = list.DataTable.Rows.Count;
		}
	</script>
	<script type="text/javascript">
	 $(document).ready(function () {
        $('.content-table').dataTable({
            "aaSorting": [[2, "desc"]],
            "bSort" : false,
            "iDisplayLength" : 10,
            "bJQueryUI": false,
            "sPaginationType": "full_numbers",
            "sDom": '<""l>t<"F"fp>',
            "bFilter": false,
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "对不起，查询不到任何相关数据",
                "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                "sInfoEmtpy": "找不到相关数据",
                "sInfoFiltered": "数据表中共为 _MAX_ 条记录)",
                "sProcessing": "正在加载中...",
                "sSearch": "搜索",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": " 上一页 ",
                    "sNext": " 下一页 ",
                    "sLast": " 最后一页 "
                }
            },
            "aoColumns": [
			null, null,null,null,null,null,null

		]


        });
    });
	</script>
<body>
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
	<div class="main box sub_xxgk_hpsp">
     <div class="main box bt">污水处理厂国家重点监控企业名单</div>
	 <div class="main box sub_xxgk_hpsp_tab">
	 <G:ListTable ID="list" Rows="20"  runat="server">
	 <G:Template id="listtemphead" type="head" runat="server">
        <table id="content-table" class="content-table" width="100%"  border="0" cellpadding="5" cellspacing="1" bgcolor="#71BE5E">
				 
                   <thead>
                   <tr class="fl">
                      <th width="144" class="txt_01">企业名称</th>
                      <th width="130" class="txt_01">排口名称</th>
                      <th width="70" class="txt_01">监测时间</th>
                      <th width="82" class="txt_01">流量</th>
                      <th width="43" class="txt_01">监测因子</th>
                      <th width="44" class="txt_01">监测值</th>
                      <th width="88" class="txt_01">标准值</th>
                  </tr>
                   </thead>
            </G:Template>
            <G:Template id="listtemp1" runat="server">
               <tr class="bg_01">
                  <td class="txt_02">*</td>
                  <td class="txt_02">*</td>
                  <td class="txt_02">*</td>
                  <td class="txt_02">*</td>
                  <td class="txt_02">*</td>
                  <td class="txt_02">*</td>
                  <td class="txt_02">*</td>
              </tr>
            </G:Template>
           
        </G:ListTable>

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


<div class="wrap_980">
 <div class="main box pt10 footer">
  <ul><li>Copyright:上海市徐汇区环境保护局&nbsp;&nbsp;&nbsp;&nbsp;地址：上海市徐汇区南丹东路106号&nbsp;&nbsp;&nbsp;&nbsp;技术支持：<a href="http://www.yuhesys.com" target="_blank">上海雨和信息技术有限公司</a></li></ul>
 </div>
 <div class="clear"></div>
</div>
</body>
</html>
