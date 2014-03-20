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
	string str="";
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			TraceUpXuHui.ChannelCode=cid;
			LeftFree.Url="tree.aspx?cid="+cid;
			
			ListBoxcxjg.SqlStr="select "+cid+",chcode,chtopic,fld_"+cid+"_10,fld_"+cid+"_11,fld_"+cid+"_13 from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
		}
		
		private void Go_Submit(object sender,System.Web.UI.ImageClickEventArgs e)
		{
			str=vname.Value;
			ListBoxcxjg.SqlStr="select "+cid+",chcode,chtopic,fld_"+cid+"_10,fld_"+cid+"_11,fld_"+cid+"_13 from "+GetChannelDataTableName(cid)+" where chstate=0 and chtopic like '%"+str+"%' order by chputdate desc";
		//	Response.Write(ListBoxcxjg.SqlStr);
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
                <td height="25" align="left"><!--#include file="traceup.aspx"--></td>
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
                <td><img src="images/sub_hbkj_02.gif" width="556" height="12"></td>
              </tr>
              <tr>
                <td align="center" background="images/sub_hbdt_23.gif">
				<div style="width:526px;overflow:hidden; padding-top:5px">				  
				  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;<span class="font1220B_green">建设项目审批查询</span></td>
                      <td align="right"></td>
                    </tr>
                    <tr bgcolor="#E5E5E5">
                      <td height="3" colspan="2"></td>
                    </tr>
                    <tr>
                      <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="sub_boxline" style="margin-top:8px; ">
						<tr>
						  <td width="100%" align="center" class="font1225B_gray" colspan="5">请输入关键字进行查询</td>
						</tr>
                        <tr>
                          <td width="18%" align="right" class="font1225B_gray" style="padding-right:10px;">项目名称</td>
                          <td width="38%" align="left"><input id="vname" name="textarea" type="text" value="" style="height:20px; width:200px; " runat="server"></td>
                          <td width="44%" align="left"><input id="field11" name="imageField" type="image" style="margin:8px;" src="images/sub_zxhd_jsxm_07.jpg" align="middle" width="56" height="20" border="0" onserverclick="Go_Submit" runat="server"></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td colspan="2"><img src="images/spacer.gif" width="1" height="10"></td>
                    </tr>
                    <tr>
                      <td height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;<span class="font1220B_green">查询结果</span></td>
                      <td align="right"></td>
                    </tr>
                    <tr bgcolor="#E5E5E5">
                      <td height="3" colspan="2"></td>
                    </tr>
                    <tr>
                      <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-top:6px;">
                        <tr>
                          <td width="4"><img src="images/sub_zxhd_jsxm_11.jpg" width="4" height="31"></td>
                          <td width="311" align="left" background="images/sub_zxhd_jsxm_12.jpg">| 项目名称 | </td>
                          <td width="55" align="center" background="images/sub_zxhd_jsxm_12.jpg"> | 受 理 | </td>
                          <td width="61" align="center" background="images/sub_zxhd_jsxm_12.jpg">| 批 准|</td>
                          <td width="61" align="center" background="images/sub_zxhd_jsxm_12.jpg">| 验 收 |</td>
                          <td width="4"><img src="images/sub_zxhd_jsxm_15.jpg" width="4" height="31"></td>
                        </tr>
                        <tr align="center">
                          <td colspan="6" class="sub_boxline">
                          
<!--查询结果-->                          
<G:ListBox id="ListBoxcxjg" rows="7" contentfield="chtopic" showchars="15" style="width:513px;overflow:hidden; " runat="server">
<G:Template id="Templatecxjg" runat="server">
<table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_gray">
<tr>
    <td width="64%" align="left" class="sub_underline"><a href="javascript:__doOpenArticle('pop_chaxunjieguo.aspx?cid=*&id=*')">*</a></td>
    <td width="14%" class="sub_underline">*</td>
    <td width="10%" class="sub_underline">*</td>
    <td width="12%" class="sub_underline">*</td>
</tr>
</table>
</G:Template>
<G:NavStyle5 id="NavStylePage2" style="padding-top:15px;text-align:center;width:450px" runat="server" prevtext="上一页" nexttext="下一页"></G:NavStyle5> 
</G:ListBox>
<!--查询结果-->                           
                          
                          </td>
                          </tr>
                      </table></td>
                    </tr>
                  </table>
				</div>
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
