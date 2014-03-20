<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<HTML>
	<HEAD>
		<G:HtmlHead id="HeadXuHui" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<!--#include file="func.aspx"-->
	<script runat="server" language="C#">
	string str="";
	string hint="";
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = (Request.QueryString.Get("cid") == null || Request.QueryString.Get("cid") == "")?"0":Request.QueryString.Get("cid");
			id = (Request.QueryString.Get("id") == null || Request.QueryString.Get("id") == "")?"0":Request.QueryString.Get("id");
			hint = (Request.QueryString.Get("hint") == null || Request.QueryString.Get("hint") == "")?"0":Request.QueryString.Get("hint");
			HeadXuHui.ChannelCode=cid;
			
			if (hint=="1")
			{
				alertvote.InnerText="您已投票成功,谢谢您的投票!";
			}
			if (hint=="2")
			{
				alertvote.InnerText="对不起，您已经投过一票了!";
			}
			
			SqlDB db = new SqlDB();
			db.SqlString = "select sum(reviewItemCount) from gcms_reviewitem where reviewCode='"+id+"' group by reviewcode";
			int vac = Convert.ToInt32(db.GetDataTable().Rows[0][0]);
			db.SqlString = "select reviewItemCount,'' as lv,'' as lv2,reviewItemName from gcms_reviewItem where reviewCode='"+id+"' ORDER BY EditDate DESC";
			DataTable dt = db.GetDataTable();
			for(int i=0;i<dt.Rows.Count;i++)
			{
				DataRow dr = dt.Rows[i];
				string _lv;
				if(vac >0)
				{
					_lv = Convert.ToString(100*(Convert.ToDouble(dr["reviewItemCount"])/vac));
				}
				else
				{
					_lv = "0.00";
				}
				dr["lv2"] = (_lv.Length>5)?_lv.Substring(0,5):_lv;//;
				dr["lv"] = 2*Convert.ToDouble(_lv);
			}
			ListTable1.DataTable = dt;
		}
	</script>

<body topmargin="0" leftmargin="0" class="page_bgline">
<form id="FormXuHui" runat="server">
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3"><img src="images/tanchu_01.jpg" width="600" height="105"></td>
  </tr>
  <tr>
    <td width="99"><img src="images/tanchu_02.jpg" width="99" height="445"></td>
    <td width="491" align="center" valign="top"><table width="97%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="35" align="center" class="font14B_black">投票结果</td>
      </tr>
      <tr class="sub_underline">
        <td class="font1225_black">
		<div style="height:370px; ">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>　　
            
<!-- 内容 -->
<G:ListTable id="ListTable1" style="width:100%;" runat="server">
	<G:Template id="Template2" type="head" runat="server">
		<table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" bordercolor="#111111"
			style="border-collapse: collapse" valign="top" ID="Table4">
			<tr>
				<td width="62" align="center" nowrap class="font12_red">
					<b>得票数</td>
				<td width="200" nowrap class="font12_red"><b> 得票率</td>
				<td height="25" nowrap class="font12_red" width="200"><b> 选 项</td>
			</tr>
	</G:Template>
	<G:Template id="Template1" type="repeat" runat="server">
		<tr class="font12_black">
			<td align="center" nowrap>
				*</td>
			<td nowrap>
				<img src="images/redbar.gif" width="*" height="10">(*%)</td>
			<td height="25">
				*
			</td>
		</tr>
	</G:Template>
</table>
</G:ListTable> 
<!-- 内容 -->

　　		</td>
          </tr>
          <tr>
        <td height="35" align="center" class="font14B_black"><div id="alertvote" runat="server" class="font_red" style="height:15px;padding-top:5px;"></div></td>
      </tr>
        </table>
		</div>
		</td>
      </tr>
      <tr>
        <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="66%">&nbsp;</td>
            <td width="17%"><a href="javascript:window.print()"><img src="images/tanchu_05.jpg" width="65" height="19" border="0"></a></td>
            <td width="17%"><a href="javascript:window.close()"><img src="images/tanchu_06.jpg" width="65" height="19" border="0"></a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="10"><img src="images/tanchu_03.jpg" width="10" height="445"></td>
  </tr>
  <tr align="center" valign="bottom">
    <td height="50" colspan="3" background="images/tanchu_04.jpg" class="font1220_gray">技术支持：<a class="font1220_gray" href="http://www.guangye.net">上海广野软件有限公司</a></td>
  </tr>
</table>
</form>
</body>
</html>
