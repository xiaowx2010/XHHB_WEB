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
			
			cid="16";
			Contentgkbs.SqlStr="select "+cid+",chcode,chcontent from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="17";
			Contentxfcl.SqlStr="select chcontent,"+cid+",chcode from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="18";
			Contentxzfy.SqlStr="select chcontent,"+cid+",chcode from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="19";
			ListBoxpwsf.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="20";
			ListBoxxzcf.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
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
                <td><img src="images/sub_hbkj_02.gif" width="556" height="12"></td>
              </tr>
              <tr>
                <td align="center" background="images/sub_hbdt_23.gif">
				<div style="width:526px;overflow:hidden; padding-top:5px">
				  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                     <tr>
                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="93%" height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;公开办事制度</td>
                          <td width="7%" align="right"><a href="redirect.aspx?cid=16"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="center">
                          <td colspan="2">
						  <div style="width:500px; height:85px; overflow:hidden; padding-top:5px">
						    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                              <tr align="left">
                                <td width="20%" valign="top" class="font1225B_gray"><table width="85"  border="0" cellpadding="1" cellspacing="1" bgcolor="#D2CDD1">
                                  <tr>
                                    <td bgcolor="#FFFFFF"><img src="images/sub_zcfg_02.gif" width="81" height="62"></td>
                                  </tr>
                                </table></td>
                                <td width="80%" valign="top">
                                
<!--公开办事制度列表-->                                
<G:Content id="Contentgkbs" contentfield="chcontent" showchars="500" style="width:400px; height:85px; overflow:hidden;" runat="server">
<G:Template id="Templategkbs" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black" style="line-height:21px">
    <tr align="left">
    <td width="100%">&nbsp;&nbsp;&nbsp;&nbsp;<a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
</table>
</G:Template>
</G:Content>
<!--公开办事制度列表--> 								
								
								</td>
                              </tr>
                            </table>
						  </div>
						  </td>
                        </tr>
						
                      </table></td>
                      </tr>
                    <tr>
                      <td height="8"> </td>
                      </tr>
					 <tr>
                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="93%" height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;信访处理</td>
                          <td width="7%" align="right"><a href="redirect.aspx?cid=17"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"></td>
                        </tr>
                        <tr align="center">
                          <td colspan="2" class="sub_zwgkmiddletbbg">
                          
<!--信访处理-->                          
<G:Content id="Contentxfcl" contentfield="chcontent" showchars="282" style="width:515px; height:75px; overflow:hidden; padding-top:5px;" runat="server">
<G:Template id="Templatexfcl" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
<tr>
    <td>*<a href="sub_news.aspx?cid=*&id=*"><span class="font12_org">详细&gt;&gt;</span></a></td>
</tr>
</table>
</G:Template>
</G:Content>
<!--信访处理--> 						  
						  
						  </td>
                        </tr>
                      </table></td>
                      </tr>
                    <tr>
                      <td height="8"> </td>
                      </tr>
					  <tr>
                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="93%" height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;行政复议</td>
                          <td width="7%" align="right"><a href="redirect.aspx?cid=18"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="center">
                          <td colspan="2">
						  <div style="width:500px; height:75px; overflow:hidden; padding-top:5px">
						    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                              <tr align="left">
                                <td width="20%" valign="top" class="font1225B_gray"><table width="85"  border="0" cellpadding="1" cellspacing="1" bgcolor="#D2CDD1">
                                  <tr>
                                    <td bgcolor="#FFFFFF"><img src="images/sub_zwgk_03.gif" width="81" height="62"></td>
                                  </tr>
                                </table></td>
                                <td width="80%" valign="top">
                                
<!--行政复议-->                                
<G:Content id="Contentxzfy" contentfield="chcontent" showchars="92" style="width:400px; height:75px; overflow:hidden;" runat="server">
<G:Template id="Templatexzfy" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr align="left">
    <td colspan="4">*<a href="sub_news.aspx?cid=*&id=*"><span class="font12_org">详细&gt;&gt;</span></a></td>
    </tr>
</table>
</G:Template>
</G:Content>
<!--行政复议--> 								
								
								</td>
                              </tr>
                            </table>
						  </div>
						  </td>
                        </tr>
						
                      </table></td>
                      </tr>
                    <tr>
                      <td height="8"> </td>
                      </tr>
					   <tr>
                         <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td width="50%" align="left"><table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                               <tr>
                                 <td width="85%" height="30" align="left"><span class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;排污收费公示</span></td>
                                 <td width="15%" align="right"><a href="redirect.aspx?cid=19"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                               </tr>
                               <tr bgcolor="#E5E5E5">
                                 <td height="3" colspan="2"></td>
                               </tr>
                               <tr align="left">
                                 <td colspan="2">
                                 
<!--排污收费公示-->                                 
<G:ListBox id="ListBoxpwsf" rows="4" contentfield="chtopic" showchars="17" style="width:256px; height:100px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatepwsf" runat="server">
    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr align="left">
        <td width="10%"><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
        <td width="90%"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
    </table>
</G:Template>
</G:ListBox>
<!--排污收费公示-->                                 
                                 
                                 </td>
                               </tr>
                             </table></td>
                             <td width="50%" align="right"><table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                               <tr>
                                 <td width="85%" height="30" align="left"><span class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;行政处罚公示</span></td>
                                 <td width="15%" align="right"><a href="redirect.aspx?cid=20"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                               </tr>
                               <tr bgcolor="#E5E5E5">
                                 <td height="3" colspan="2"></td>
                               </tr>
                               <tr align="left">
                                 <td colspan="2">
                                 
<!--行政处罚公示-->                                 
<G:ListBox id="ListBoxxzcf" rows="4" contentfield="chtopic" showchars="17" style="width:256px; height:100px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatexzcf" runat="server">
    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr align="left">
        <td width="10%"><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
        <td width="90%"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
    </table>
</G:Template>
</G:ListBox>
<!--行政处罚公示-->                                  
                                 
                                 </td>
                               </tr>
                             </table></td>
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
