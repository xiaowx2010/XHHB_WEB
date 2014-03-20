<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<HTML>
	<HEAD>
		<G:HtmlHead id="HeadXuHui" title="广野软件" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	
	<!--#include file="func.aspx"-->
	<!--#include file="../insql.aspx"-->
	<script runat=server language=C#>
		private void Page_Load(object sender, System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			
			Contentwz.SqlStr="select chtopic,chcontent from "+GetChannelDataTableName(cid)+" where chcode="+id;
			
		}
	</script>

<body topmargin="0" leftmargin="0" class="page_bgline">
<form id="FormXuHui" runat="server">
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3"><img src="images/pop_houtaitanchu01.gif" width="600" height="68"></td>
  </tr>
  <tr>
    <td width="15"><img src="images/pop_houtaitanchu02.gif" width="15" height="467"></td>
    <td width="570" valign="top"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
        
<!--文章-->        
<G:Content id="Contentwz" style="width:570px; height:428px; overflow:hidden;" runat="server">
<G:Template id="Templatewz" runat="server">
    <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="55" class="sub_underline"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center"><span class="font14B_black">*</span></td>
        </tr>
        <tr>
            <td align="center">&nbsp;</td>
        </tr>
        </table></td>
    </tr>
    <tr class="sub_underline">
        <td class="font1225_black">
		<div style="padding:5px; height:362px; overflow:auto; ">&nbsp;　　*</div>
　　	</td>
    </tr>
    </table>
</G:Template>
</G:Content>        
<!--文章-->  
        
        </td>
      </tr>
      <tr>
        <td valign="bottom"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="18"><img src="images/pop_houtaitanchu04.gif" width="18" height="39"></td>
            <td width="534" align="right">
				<a href="javascript:window.print()"><img src="images/tanchu_05.jpg" width="65" height="19" align="absmiddle" border="0"></a> &nbsp;
				<a href="javascript:window.close()"><img src="images/tanchu_06.jpg" width="65" height="19" align="absmiddle" border="0"></a>
			</td>
            <td width="18"><img src="images/pop_houtaitanchu05.gif" width="18" height="39"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="15"><img src="images/pop_houtaitanchu03.gif" width="15" height="467"></td>
  </tr>
  <tr>
    <td colspan="3"><img src="images/pop_houtaitanchu06.gif" width="600" height="15"></td>
  </tr>
</table>
</form>
</body>
