<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<HTML>
	<HEAD>
		<G:HtmlHead id="HeadSHSR" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<!--#include file="func.aspx"-->
	<!--#include file="../insql.aspx"-->
	<script runat="server" language="C#">
	private void Page_Load(object sender, System.EventArgs e)
	{
		string code = GetQueryString("code","0");
		ContentPop.SqlStr = "SELECT FloatLogoWidth,FloatLogoHeight,FloatLogoContent FROM gcms_FloatLogo WHERE FloatLogoState='1' AND FloatLogoCode=" + code;
	}
	</script>
	<body topmargin="0" leftmargin="0">
		<G:Content id="ContentPop" height="350" runat="server">
			<G:Template id="TemplatePop" runat="server">
				<table border="0" cellspacing="0" cellpadding="0" width="*" height="*">
					<tr>
						<td align="center">*</td>
					</tr>
				</table>
			</G:Template>
		</G:Content>
	</body>
</HTML>
