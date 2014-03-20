<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<HTML>
	<HEAD>
		<G:HtmlHead id="HeadXuHui" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
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
			
			ListBoxwznr.SqlStr="select chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+cast(datepart(month,chputdate) as varchar(50))+'-'+cast(datepart(day,chputdate) as varchar(50)),chcontent,fld_"+cid+"_13 from "+GetChannelDataTableName(cid)+" where chcode="+id;
			
		}
	</script>

<body topmargin="0" leftmargin="0" class="page_bgline">
<form id="FormXuHui" runat="server">
<table width="820"  border="0" align="center" cellpadding="0" cellspacing="0">
  <!--#include file="head.aspx"-->
  <tr>
    <td background="images/index_01.gif">&nbsp;</td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr valign="top">
        <td width="190" bgcolor="#BEE6A7" class="left_bottombg"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/sub_hbdt_01.gif" width="190" height="24"></td>
          </tr>
          <tr>
            <td align="center"><!--#include file="left.aspx"--></td>
          </tr>
          <tr>
            <td height="13"> </td>
          </tr>
        </table></td>
        <td width="590"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="175"><img src="images/sub_hbdt_12.gif" width="175" height="24"></td>
            <td width="146" align="center" background="images/sub_hbdt_13.gif" class="font1220_green"><!--#include file="date.aspx"--></td>
            <td width="269"><img src="images/sub_hbdt_14.gif" width="269" height="24"></td>
          </tr>
          <tr>
            <td colspan="3"><img src="images/sub_hbdt_15.gif" width="590" height="8"></td>
            </tr>
          <tr align="center">
            <td colspan="3"><table width="556"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="25" align="left" class="font1225_black"><!--#include file="traceup.aspx"--></td>
              </tr>
              <tr>
                <td height="2" bgcolor="#BFE7A8"> </td>
              </tr>
              <tr>
                <td align="left" style="padding-left:20px; "><img src="images/sub_hbdt_17.gif" width="7" height="6"></td>
              </tr>
              <tr>
                <td height="10"> </td>
              </tr>
              <tr>
                <td><img src="images/sub_hbdt_18.gif" width="556" height="14"></td>
              </tr>
              <tr>
                <td><img src="images/sub_hbdt_22.gif" width="556" height="4"></td>
              </tr>
              <tr>
                <td align="center" valign="top" background="images/sub_hbdt_23.gif" class="font1225_black">
                
<!--文章内容-->                
<G:ListBox id="ListBoxwznr" rows="1" alert="本栏目暂时没有内容！" style="width:513px;height:500px;overflow-y:auto;overflow-x:auto; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatewznr" runat="server">
	<table width="100%"  cellspacing="0" cellpadding="0">
    <tr>
        <td align="center" class="font14_black_B">*</td>
    </tr>
    <tr class="sub_underline">
        <td height="25" align="center" class="font12_org">发布日期：*</td>
    </tr>
    <tr>
        <td align="left">
        <p class="font1225_gray">&nbsp;&nbsp;&nbsp;&nbsp;*</p>
        </td>
    </tr>
    <tr>
		<td height="50">&nbsp;</td>
    </tr>
    <tr class="sub_underline">
        <td height="25" align="left" class="font12_org">回复内容：</td>
    </tr>
    <tr>
        <td align="left">
        <p class="font1225_gray">&nbsp;&nbsp;&nbsp;&nbsp;*</p>
        </td>
    </tr>
    </table>
</G:Template>
<G:NavStyle1 id="NavStyle55" prevtext="上一篇" nexttext="下一篇" style="font-size:13px" runat="server"></G:NavStyle1>
</G:ListBox>
<!--文章内容-->

				</td>
              </tr>
              <tr>
                <td><img src="images/sub_hbdt_27.gif" width="557" height="13"></td>
              </tr>
            </table></td>
          </tr>
        </table>          </td>
      </tr>
    </table></td>
    <td background="images/index_02.gif">&nbsp;</td>
  </tr>
  <!--#include file="foot.aspx"-->
</table>
</form>
</body>
</html>
