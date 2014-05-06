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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>

</head>
<!--#include file="func.aspx"-->
<!--#include file="../insql.aspx"-->
<script runat="server" language="C#">
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
		    if (HttpContext.Current.Session["Redirect"] == null)
		    {
		        Response.Redirect("sub_xxgk_gateway.aspx?cid="+cid);
		    }
//            Session.Remove("Redirect");

			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			TraceUpXuHui.ChannelCode=cid;
			LeftFree.Url="tree.aspx?cid="+cid;		

//			ListBoxlb.SqlStr="select "+cid+",chcode,chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+(Case When datepart(month,chputdate)<10 Then '0' Else '' End)+cast(datepart(month,chputdate) as varchar(50))+'-'+(Case When datepart(day,chputdate)<10 Then '0' Else '' End)+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";

		}
	</script>
<script type="text/javascript">
	 $(document).ready(function () {
        $('#content_table').dataTable({
            "bSort" : false,
            "iDisplayLength" : 10,
            "bJQueryUI": false,
            "sPaginationType": "full_numbers",
            "sDom": '<""l>t<"F"fp>',
            "bFilter": false,
            "oLanguage": {
                "sLengthMenu": "ÿҳ��ʾ _MENU_ ����¼",
                "sZeroRecords": "�Բ��𣬲�ѯ�����κ��������",
                "sInfo": "��ǰ��ʾ _START_ �� _END_ ������ _TOTAL_ ����¼",
                "sInfoEmtpy": "�Ҳ����������",
                "sInfoFiltered": "���ݱ��й�Ϊ _MAX_ ����¼)",
                "sProcessing": "���ڼ�����...",
                "sSearch": "����",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "��һҳ",
                    "sPrevious": " ��һҳ ",
                    "sNext": " ��һҳ ",
                    "sLast": " ���һҳ "
                }
            }
        }); 
    });
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
	<div class="main box sub_xxgk_hpsp">
     <div class="main box bt"><%=GetChannelName(cid)%></div>
	 <div class="main box sub_xxgk_hpsp_tab">
      <table id="content_table" width="100%"  border="0" cellpadding="5" cellspacing="1" bgcolor="#71BE5E">
	  <thead>
        <tr class="fl">
          <%=GetDataTableHeaderStr(cid)%>
        </tr>
		</thead>
		<tbody>
        <%=GetDataTabeContent(cid)%>
		</tbody>
      </table>
	  </div>
	  <div class="main box zm">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Ϣ��ʾ�ڼ䣬���ڣ��������ˡ�����ȣ�����ͨ������վ���ԡ������ʼ���������ź������ʴ�Ϊ׼����ʽ��������
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ʼ���hpk@xh.sh.cn�����棺021-64878385
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ź���������ϵ���·106��5¥ ����Ӱ�����ۿ� �գ��ʱࣺ200030���������ŷ���ע������XXX ��������Ŀ���������
	  </div>

    </div>

   </div>
  </div>
  <div class="side sub_R">
   <div class="main box right_topbg"></div>
   <div class="main Righttree"><G:Include id="LeftFree" runat="server" url=""></G:Include></div>


  </div>
 </div>
 <div class="clear"></div>
</div>
<!--#include file="foot.aspx"-->
</form>
</body>
</html>
