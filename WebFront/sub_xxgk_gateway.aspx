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
	            alert("�빴ѡ��������֪����");
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
     <div class="main box bt"><%=GetXXGKStrByID(cid)%>�ĸ�֪����</div>
	 <div class="main box nr">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1����������������ְ��ա��л����񹲺͹�����Ӱ�����۷�������������ɷ���������Ϣ�����������Լ���ط��桢���º͹涨��Ҫ�󣬹�ʾ������Ŀ����Ӱ�������������������Ϣ��<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2��������Ϣ��ʾʱ�ޣ�����Ӱ�����۱���������Ϣ������10�������գ�����Ӱ�����۱��������Ϣ������5�������ա�<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3����ʾ�ڼ䣬���ڣ��������ˡ�����ȣ�����ͨ������վ�����ʼ���������ź������ʴ�Ϊ׼����ʽ��������<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ʼ���hpk@xh.sh.cn�����棺021-64878385��<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ź���������ϵ���·106��5¥ ����Ӱ�����ۿ� �գ��ʱࣺ200030���������ŷ���ע������XXX ��������Ŀ���������<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4����Ϣ�������Ҿֽ�Ҫ��������������˶Ը��������ȷ���Բ��ɻ򲻲��ɵĴ�����������Ի����ļ������޸ġ�<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5�����������������ṩ����������������������ύ����ʽ���й������������Ϻ���Ϣ�����д�©��ʹ��������Ϣ��������Ϊ���������ге����Ρ�<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="iAgree" type="checkbox"  /><span style="color:#CC0000; padding-left:5px; ">������֪</span><br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button runat="server"  onclick="Click_Save" text="ȷ��" id="confirmBtn" style=" background:#09C; color:#FFF; height:30px; width:80px; font-size:14px; border:none;display:none"/>
<input onclick="Click_Save()" type="button" name="confirmBtn1" value="ȷ��" id="confirmBtn1" style=" background:#09C; color:#FFF; height:30px; width:80px; font-size:14px; border:none;" />
	 </div>
    </div>

   </div>
  </div>
  <div class="side sub_R">
   <div class="main box right_topbg"></div>
   <div class="main Righttree">
    <ul>
     <li><a href="#" class="dq">������������</a></li>
	 <dl><dt><a href="#">������Ŀ����Ӱ������������Ϣ��ʾ</a></dt></dl>
	 <dl><dd><a href="#">������Ŀ����Ӱ��������������ʾ</a></dd></dl>
	 <dl><dd><a href="#">������Ŀ����Ӱ������������������</a></dd></dl>
	 <dl><dd><a href="#">������Ŀ����������������������Ϣ��ʾ</a></dd></dl>
	 <dl><dd><a href="#">������Ŀ������������������������ʾ</a></dd></dl>
	 <dl><dd><a href="#">������Ŀ����������������������������</a></dd></dl>
     <li><a href="redirect.aspx?cid=58">ҹ��ʩ��������ѯ</a></li>
     <li><a href="redirect.aspx?cid=82">������Ŀ������ʾ</a></li>
     <li><a href="redirect.aspx?cid=19">�����շ���¼</a></li>
     <li><a href="redirect.aspx?cid=20">���䰲ȫ�����¼</a></li>
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
