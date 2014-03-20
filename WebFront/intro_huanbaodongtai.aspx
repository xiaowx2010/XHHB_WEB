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
			id = GetQueryString("id","");
			HeadXuHui.ChannelCode=cid;
			TraceUpXuHui.ChannelCode=cid;
			LeftFree.Url="tree.aspx?cid="+cid;
			
			cid="24";
			ListBoxggl.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="21";
			ListBoxxhhb.SqlStr="select "+cid+",chcode,chtopic,cast(datepart(year,chputdate) as varchar(50))+'-'+cast(datepart(month,chputdate) as varchar(50))+'-'+cast(datepart(day,chputdate) as varchar(50)) as chdate from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
		//	Response.Write(ListBoxxhhb.SqlStr);
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
            <td align="center">
            
			<table width="169" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/sub_hbdt_02.gif" width="169" height="48"></td>
              </tr>
              <tr>
                <td align="center" background="images/sub_hbdt_03.gif">
			  <table width="133" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2"><img src="images/sub_hbdt_05.gif" width="133" height="25"></td>
                </tr>
              </table>

<!--栏目树-->                
<G:Include id="LeftFree" runat="server" url=""></G:Include>
<!--栏目树-->                
                
                </td>
              </tr>
              <tr>
                <td><img src="images/sub_hbdt_04.gif" width="169" height="11"></td>
              </tr>
            </table>
            
            </td>
          </tr>
          <tr>
            <td height="13"> </td>
          </tr>
          <tr>
            <td align="center"><table width="169" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><a href="redirect.aspx?cid=24"><img src="images/sub_hbdt_08.gif" width="169" height="40" border="0"></a></td>
              </tr>
              <tr>
                <td align="center" background="images/sub_hbdt_09.gif">
                
<!--公告栏-->                
<G:ListBox id="ListBoxggl" rows="5" contentfield="chtopic" showchars="8" style="width:145px; height:126px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templateggl" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1220_black">
    <tr>
    <td width="13%" align="left" valign="top" style="padding-top:7px; "><img src="images/sub_hbdt_11.gif" width="11" height="11"></td>
    <td width="87%" ><span class="font1225_gray"><a href="sub_news.aspx?cid=*&id=*">*</a></span></td>
    </tr>
</table>
</G:Template>
</G:ListBox>
<!--公告栏-->

				</td>
              </tr>
              <tr>
                <td><img src="images/sub_hbdt_10.gif" width="169" height="14"></td>
              </tr>
            </table></td>
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
                <td><table width="556" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="35"><img src="images/sub_hbdt_19.gif" width="35" height="34"></td>
                    <td width="101" bgcolor="#F5F5F5"><span class="font1220B_green">徐汇环保动态</span></td>
                    <td width="392" background="images/sub_hbdt_20.gif">&nbsp;</td>
                    <td width="28"><img src="images/sub_hbdt_21.gif" width="28" height="34"></td>
                  </tr>
                </table></td>
                </tr>
              <tr>
                <td><img src="images/sub_hbdt_22.gif" width="556" height="4"></td>
              </tr>
              <tr>
                <td align="center" background="images/sub_hbdt_23.gif">
				
<!--徐汇环保动态-->				
<G:ListBox id="ListBoxxhhb" rows="14" contentfield="chtopic" showchars="30" style="width:513px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Tempaltexhhb" runat="server">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr class="sub_underline" >
    <td width="5%" align="left" valign="top" style="padding-top:8px; "><img src="images/sub_hbdt_24.gif" width="9" height="9"></td>
    <td width="75%" align="left" class="font1225_gray"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    <td width="20%" align="left" class="font1225_gray">[*]</td>
    </tr>
</table>
</G:Template>
<G:NavStyle5 id="NavStyle555" prevtext="上一页" nexttext="下一页" runat="server"></G:NavStyle5>
</G:ListBox>
<!--徐汇环保动态-->				
				
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
