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
	string cxname="";
	string cxtopic="";
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			id = GetQueryString("id","0");
			HeadXuHui.ChannelCode=cid;
			TraceUpXuHui.ChannelCode=cid;
			LeftFree.Url="tree.aspx?cid="+cid;
			
			
		}
		
		//提交查询
		string jindu="";
		string jieguo="";
		private void Go_Submit(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			cxname=vname.Value;
			cxtopic=vtopic.Value;
			
			SqlDB db=new SqlDB();
			db.SqlString="select cast(datepart(year,chputdate) as varchar(50))+'-'+cast(datepart(month,chputdate) as varchar(50))+'-'+cast(datepart(day,chputdate) as varchar(50)) as chputdate,fld_"+cid+"_10,chtopic,fld_"+cid+"_15,fld_"+cid+"_16 from "+GetChannelDataTableName(cid)+" where chstate=0 and (chtopic='"+cxtopic+"' or fld_"+cid+"_10='"+cxname+"') order by chputdate desc";	
			DataTable dt=db.GetDataTable();	
			if(dt.Rows.Count > 0)
			{
				foreach(DataRow dr in dt.Rows)
				{
					jindu = dr["fld_"+cid+"_15"].ToString().Trim();
					jieguo = dr["fld_"+cid+"_16"].ToString().Trim();
					if(jindu.ToString() == "未处理")
						jieguo="";
					else
						jieguo=dr["fld_"+cid+"_16"].ToString().Trim();
					ListBoxzxlb.SqlStr="select cast(datepart(year,chputdate) as varchar(50))+'-'+cast(datepart(month,chputdate) as varchar(50))+'-'+cast(datepart(day,chputdate) as varchar(50)) as chputdate,fld_"+cid+"_10,"+cid+",chcode,chtopic,'"+jindu+"','"+jieguo+"' from "+GetChannelDataTableName(cid)+" where chstate=0 and (chtopic='"+cxtopic+"' or fld_"+cid+"_10='"+cxname+"') order by chputdate desc ";	
					
				}
			}
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
                      <td height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;<span class="font1220B_green">信访查询</span></td>
                      <td align="right"><a href="redirect.aspx?cid=56"><img src="images/xinfang_shouli.jpg" border="0"></a></td>
                    </tr>
                    <tr bgcolor="#E5E5E5">
                      <td height="3" colspan="2"></td>
                    </tr>
                    <tr>
                      <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="sub_boxline" style="margin-top:8px; ">
						<tr>
						  <td width="100%" align="center" class="font1225B_gray" colspan="5">请输入主题或姓名进行查询</td>
						</tr>
                        <tr>
                          <td width="15%" align="center" class="font1225B_gray">主 题</td>
                          <td width="30%" align="left"><input id="vtopic" type="text" name="textfield" style="margin-left:10px;" runat="server">&nbsp;<font color="#ff0000">*</font>
                          </select></td>
                          <td width="19%" align="right"><span class="font1225B_gray">信访人姓名</span></td>
                          <td width="36%"><input id="vname" type="text" name="textfield" style="margin-left:10px;" runat="server">&nbsp;<font color="#ff0000">*</font>
                          </select></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td colspan="3" align="left"><input id="submit1" name="imageField" type="image" src="images/sub_zxhd_jsxm_07.jpg" width="56" height="20" border="0" style="margin:8px;" onserverclick="Go_Submit" runat="server"></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#E5E5E5">
                      <td height="3" colspan="2"></td>
                    </tr>
                    <tr>
                      <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-top:6px;">
                        <tr>
                          <td width="4"><img src="images/sub_zxhd_jsxm_11.jpg" width="4" height="31"></td>
                          <td width="86" align="center" background="images/sub_zxhd_jsxm_12.jpg">信访日期</td>
                          <td width="73" align="center" background="images/sub_zxhd_jsxm_12.jpg"> 信访人</td>
                          <td width="164" align="center" background="images/sub_zxhd_jsxm_12.jpg">主题 </td>
                          <td width="102" align="center" background="images/sub_zxhd_jsxm_12.jpg">处理进度</td>
                          <td width="91" align="center" background="images/sub_zxhd_jsxm_12.jpg">处理结果</td>
                          <td width="6"><img src="images/sub_zxhd_jsxm_15.jpg" width="4" height="31"></td>
                        </tr>
                        <tr align="center">
                          <td colspan="8" class="sub_boxline">
                          
                          
<!--咨询列表-->
<G:ListBox id="ListBoxzxlb" alert="暂时没有内容！" rows="7" contentfield="chtopic" showchars="15" runat="server">
<G:Template id="Templatezxlb" runat="server">
<table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_gray">
<tr>
    <td width="16%" align="center" class="sub_underline">*</td>
    <td width="15%" align="center" class="sub_underline">*</td>
    <td width="32%" align="center" class="sub_underline"><a href="javascript:__doOpenArticle2('pop_xfcx.aspx?cid=*&id=*')">*</a></td>
    <td width="19%" align="center" class="sub_underline">*</td>
    <td width="18%" align="center" class="sub_underline">*</td>
</tr>
</table>
</G:Template>
<G:NavStyle5 id="NavStyle55" prevtext="上一页" nexttext="下一页" runat="server"></G:NavStyle5>
</G:ListBox>
<!--咨询列表-->
                              
                              
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
