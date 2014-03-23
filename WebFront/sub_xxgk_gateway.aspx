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
//			ListBoxlb.SqlStr="select "+cid+",chcode,chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+cast(datepart(month,chputdate) as varchar(50))+'-'+(Case When datepart(day,chputdate)<10 Then '0' Else '' End)+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";

		}

		private void Click_Save(object sender, System.EventArgs e)
		{
		    Session.Add("Redirect", true);
            Response.Redirect("sub_hjyxpj.aspx?cid="+cid);
		}
	</script>
<script type="text/javascript">
	    function Click_Save(){
	        if(!document.getElementById("iAgree").checked){
	            alert("请勾选“我已阅知”。");
	            return;
	        }
	        __doPostBack("confirmBtn", null);
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
	  <dt><%=GetXXGKStrByID(cid)%></dt>
	  <dd></dd>
	 </dl>
	</div>
	<div class="main box sub_xxgk_hpsp">
     <div class="main box bt"><%=GetXXGKStrByID(cid)%>的告知事项</div>
	 <div class="main box nr">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、徐汇区环境保护局按照《中华人民共和国环境影响评价法》、《行政许可法》、《信息公开条例》以及相关法规、规章和规定的要求，公示建设项目环境影响评价行政许可受理信息。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、受理信息公示时限：环境影响评价报告书自信息发布起10个工作日，环境影响评价报告表自信息发布起5个工作日。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、公示期间，公众（包括个人、团体等）可以通过本网站电子邮件、传真或信函（以邮戳为准）方式提出意见。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电子邮件：hpk@xh.sh.cn，传真：021-64878385。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信函请寄至：南丹东路106号5楼 环境影响评价科 收（邮编：200030）。请在信封上注明：对XXX （建设项目）的意见。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、信息公开后，我局将要求行政许可申请人对各方意见明确予以采纳或不采纳的处理意见，并对环评文件进行修改。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5、相关资料由外界所提供、并以行政许可申请人所提交的形式进行公开。上述资料和信息中如有错漏，使用上述信息和资料作为依据者自行承担责任。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="iAgree" type="checkbox"  /><span style="color:#CC0000; padding-left:5px; ">我已阅知</span><br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button runat="server"  onclick="Click_Save" text="确认" id="confirmBtn" style=" background:#09C; color:#FFF; height:30px; width:80px; font-size:14px; border:none;display:none"/>
<input onclick="Click_Save()" type="button" name="confirmBtn1" value="确认" id="confirmBtn1" style=" background:#09C; color:#FFF; height:30px; width:80px; font-size:14px; border:none;" />
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
