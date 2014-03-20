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
			
			cid="14";
			ListBoxgzzz.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";	
			
			cid="15";
			Contentlxfs.SqlStr="select fld_"+cid+"_10,fld_"+cid+"_11,fld_"+cid+"_12,fld_"+cid+"_13 from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="12";
			ListBoxldcy.SqlStr="select fld_"+cid+"_10,fld_"+cid+"_11,substring(chcontent,0,30)+'...',"+cid+",chcode from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
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
                <td height="25" align="left" class="font1220_black"><!--#include file="traceup.aspx"--></td>
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
				<div style="width:526px; overflow:hidden; padding-top:5px">
				  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="93%" height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;领导成员</td>
                          <td width="7%" align="right"><a href="redirect.aspx?cid=12"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="center">
                          <td colspan="2">
                          
<!--领导成员-->                          
<G:ListTable id="ListBoxldcy" contentfield="chcontent" showchars="13" style="width:526px;  padding-top:5px;overflow:hidden;" runat="server">
<G:Template id="Templateldcy" type="head" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="1" class="font1225_black">
    <tr>
    <td><table width="100%"  border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFB7">
        <tr>
        <td height="25" align="center" bgcolor="#FFFFFF"  class="sub_jgsz_tbbg"><span class="font12B_gray">姓名</span></td>
        </tr>
    </table></td>
    <td><table width="100%"  border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFB7">
        <tr>
        <td height="25" align="center" bgcolor="#FFFFFF" class="sub_jgsz_tbbg"><span class="font12B_gray">职务</span></td>
        </tr>
    </table></td>
    <td><table width="100%"  border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFB7">
        <tr>
        <td height="25" align="center" bgcolor="#FFFFFF" class="sub_jgsz_tbbg"><span class="font12B_gray">负责工作</span></td>
        </tr>
    </table></td>
    </tr>
</G:Template>  
<G:Template id="Templateldcy2" type="repeat" runat="server">  
    <tr>
    <td align="center" bgcolor="#EDEDE1">*</td>
    <td align="center" bgcolor="#F4F4EA">*</td>
    <td align="center" bgcolor="#F4F4EA">*<a href="sub_lingdaochengyuan.aspx?cid=*&id=*">[<span class="font12_org">详细</span> <img src="images/sub_jgsz_03.gif" width="16" height="16" align="absmiddle" border="0">]</a></td>
    </tr>
</G:Template>
</table>
</G:ListTable>
<!--领导成员-->

						  </td>
                        </tr>
                      </table></td>
                      </tr>
					  <tr>
                      <td height="8" colspan="2"> </td>
                      </tr>
					  <tr>
                      <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="93%" height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;部门设置</td>
                          <td width="7%" align="right"><a href="redirect.aspx?cid=13"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="center">
                          <td colspan="2">
						  <div style="width:526px; height:140px; padding-top:5px;overflow:hidden;">
						    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50%" align="left" valign="top"><table width="258"  border="0" cellpadding="0" cellspacing="3" bgcolor="#F2F0F0">
                                  <tr>
                                    <td bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><img src="images/sub_jgsz_04.gif" width="252" height="57"></td>
                                      </tr>
                                      <tr>
                                        <td height="1" class="sub_underline"> </td>
                                      </tr>
                                      <tr>
                                        <td style="padding-top:5px; ">
                                        
<!--局机关各科室-->                                        
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225B_gray">
    <tr>
    <td width="8%"><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td width="42%">污染防治科</td>
    <td width="8%"><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td width="42%">法制综合管理科</td>
    </tr>
    <tr>
    <td><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td>环境影响评价科</td>
    <td><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td>辐射安全管理科</td>
    </tr>
    <tr>
    <td><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td>局办公室</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
</table>
<!--局机关各科室-->                                              
                                        
                                        </td>
                                      </tr>
                                    </table> </td>
                                  </tr>
                                </table></td>
                                <td width="50%" align="right" valign="top"><table width="258"  border="0" cellpadding="0" cellspacing="3" bgcolor="#F2F0F0">
                                  <tr>
                                    <td bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><img src="images/sub_jgsz_05.gif" width="252" height="57"></td>
                                        </tr>
                                        <tr>
                                          <td height="1" class="sub_underline"></td>
                                        </tr>
                                        <tr>
                                          <td style="padding-top:5px; ">
                                          
<!--局基层单位-->                                          
<table width="100%" height="140"  border="0" cellpadding="0" cellspacing="0" class="font1225B_gray">
    <tr>
    <td width="8%"><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td width="42%">环境监察支队</td>
    <td width="8%"><img src="images/sub_hbkj_04.gif" width="5" height="8" hspace="8" align="absmiddle"></td>
    <td width="42%">环境监测站</td>
    </tr>
    <tr>
    <td width="8%">&nbsp;</td>
    <td width="42%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="42%">&nbsp;</td>
    </tr>
    <tr>
    <td width="8%">&nbsp;</td>
    <td width="42%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="42%">&nbsp;</td>
    </tr>
    <tr>
    <td width="8%">&nbsp;</td>
    <td width="42%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="42%">&nbsp;</td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
</table>
<!--局基层单位-->                                          
                                          
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
                      </table></td>
                      </tr>
					  <tr>
                      <td height="8" colspan="2"> </td>
                      </tr>
					<tr>
                      <td width="50%"><table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                        <tr>
                          <td width="85%" height="30" align="left"><span class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;工作职责</span></td>
                          <td width="15%" align="right"><a href="redirect.aspx?cid=14"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
						<tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="left">
                          <td colspan="2">
                          
<!--工作职责-->                          
<G:ListBox id="ListBoxgzzz" rows="4" contentfield="chtopic" showchars="17" style="width:256px; height:100px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templategzzz" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
<tr align="left" class="sub_underline">
    <td width="10%"><img src="images/sub_jgsz_06.gif" width="15" height="13" hspace="8" align="absmiddle"></td>
    <td width="90%"><a href="sub_news.aspx?cid=*&id=*">*</a></td>
</tr>
</table>
</G:Template>
</G:ListBox>
<!--工作职责-->    						  
						  
						  </td>
                          </tr>
                      </table></td>
                      <td width="50%" align="right"><table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
                        <tr>
                          <td width="85%" height="30" align="left"><span class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;联系方式</span></td>
                          <td width="15%" align="right"><a href="redirect.aspx?cid=15"><img src="images/sub_hbkj_06.gif" width="38" height="20" border="0"></a></td>
                        </tr>
						<tr bgcolor="#E5E5E5">
                          <td height="3" colspan="2"> </td>
                          </tr>
                        <tr align="right">
                          <td colspan="2">
                      
<!--联系方式-->                          
<G:Content id="Contentlxfs" contentfield="chcontent" showchars="100" style="width:256px; height:100px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatelxfs" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr align="left" class="sub_underline">
    <td>地址： *</td>
    </tr>
    <tr align="left" class="sub_underline">
    <td>邮政编码： *</td>
    </tr>
    <tr align="left" class="sub_underline">
    <td>电话： *</td>
    </tr>
    <tr align="left" class="sub_underline">
    <td>E-mail： *</td>
    </tr>
</table>
</G:Template>
</G:Content>
<!--联系方式--> 						  
						  
						  </td>
                        </tr>
                      </table></td>
                    </tr>
				<tr>
                      <td height="8" colspan="2"> </td>
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
