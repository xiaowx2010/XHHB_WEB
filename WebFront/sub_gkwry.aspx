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
     <div class="main box bt">��ˮ���������ص�����ҵ����</div>
	 <div class="main box sub_xxgk_hpsp_tab">
	 <G:ListTable ID="list" Rows="20"  runat="server">
	 <G:Template id="listtemphead" type="head" runat="server">
        <table id="content-table" class="content-table" width="100%"  border="0" cellpadding="5" cellspacing="1" bgcolor="#71BE5E">
				 
                   <thead>
                   <tr class="fl">
                      <th width="144" class="txt_01">��ҵ����</th>
                      <th width="130" class="txt_01">�ſ�����</th>
                      <th width="70" class="txt_01">���ʱ��</th>
                      <th width="82" class="txt_01">����</th>
                      <th width="43" class="txt_01">�������</th>
                      <th width="44" class="txt_01">���ֵ</th>
                      <th width="88" class="txt_01">��׼ֵ</th>
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
  <ul><li>Copyright:�Ϻ������������������&nbsp;&nbsp;&nbsp;&nbsp;��ַ���Ϻ���������ϵ���·106��&nbsp;&nbsp;&nbsp;&nbsp;����֧�֣�<a href="http://www.yuhesys.com" target="_blank">�Ϻ������Ϣ�������޹�˾</a></li></ul>
 </div>
 <div class="clear"></div>
</div>
</body>
</html>
