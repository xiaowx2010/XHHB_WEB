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
	string sitecode="";
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			
			Contentxxnr.SqlStr="select chtopic,fld_"+cid+"_10,fld_"+cid+"_11,fld_"+cid+"_13,fld_"+cid+"_19,fld_"+cid+"_14,fld_"+cid+"_15,cast(datepart(year,chputdate) as varchar(50))+'-'+cast(datepart(month,chputdate) as varchar(50))+'-'+cast(datepart(day,chputdate) as varchar(50)) as chputdate from "+GetChannelDataTableName(cid)+" where chstate=0 and chcode="+id;
			Contentxxnr.WriteLog(cid,id);
			
			SqlDB db=new SqlDB();
			db.SqlString="select count(*) from gcms_readlog where channelcode='57'";
			DataTable dt=db.GetDataTable();
			if(dt.Rows.Count>0)
			{
				sitecode=dt.Rows[0][0].ToString();
			}
		}
	</script>

<body>
<form id="FormXuHui" repeat="post" runat="server">
<div class="wrap_600">
 <div class="main box pop_top_banner"><img src="images/pop_01.jpg"></div>
 <div class="clear"></div>
</div>

<div class="wrap_600">
 <div class="main pop_M">
  <div class="main box sub_lmys_001">
   <dl>
	<dt><%=GetChannelName(cid)%></dt>
    <dd></dd>
   </dl>
  </div>
  <div class="main box pop_nr_01">
    <G:Content id="Contentxxnr" runat="server">
    <G:Template id="Templatexxnr" runat="server">
    <table width="100%"  border="0" cellspacing="0" cellspacing="2" bgcolor="#D9D9D9" class="tab">
      <tr bgcolor="#FFFFFF">
        <td class="RB_line BB">��Ŀ���ƣ�</td>
        <td class="RB_line">*</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td class="RB_line BB">����״̬��</td>
        <td class="RB_line">*</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td class="RB_line BB">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;׼��</td>
        <td class="RB_line">*</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td class="RB_line BB">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�գ�</td>
        <td class="RB_line">*</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td class="RB_line BB">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ��</td>
        <td class="RB_line">*</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td class="RB_line BB">������ţ�</td>
        <td class="RB_line">*</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td class="RB_line BB">���ձ�ţ�</td>
        <td class="RB_line">*</td>
      </tr>
	</table>
	
	
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="right" style="margin-top:5px; ">
  <tr>
    <td>
	<table border="0" cellspacing="0" cellpadding="0"  align="right">
      <tr>
        <td align="right" width="100" class="font1230_646464">¼�����ڣ�</td>
        <td align="left" width="120" class="font1225_646464" valign="top">*</td>
      </tr>
	</table>
	</td>
  </tr>
</table>

	
	

	</G:Template>
    </G:Content>
   
	
  </div>
  
   <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right">
		
		<table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" width="100" class="font1230_646464">�鿴������</td>
        <td align="left" width="120" class="font1225_646464" valign="top"><%=sitecode%></td>
      </tr>
	</table>
		
		</td>
      </tr>
    </table>
	
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-top:50px; ">
  <tr>
    <td>&nbsp;</td>
    <td width="80" align="center"><a href="javascript:window.print()"><img src="images/tanchu_05.jpg" width="65" height="19" border="0"></a></td>
    <td width="80" align="center"><a href="javascript:window.close()"><img src="images/tanchu_06.jpg" width="65" height="19" border="0"></a></td>
  </tr>
</table>

  
 </div>
 <div class="clear"></div>
</div>

<div class="wrap_600">
 <div class="main box pop_footer">Copyright���Ϻ������������������     ����֧�֣��Ϻ������Ϣ�������޹�˾</div>
 <div class="clear"></div>
</div>



</form>
</body>
</html>
