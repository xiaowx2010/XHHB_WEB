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
			
			wancheng.Visible=false;
			
			dtable="gcms_ch_"+cid;
			vstate.Value=GetLowstRight(cid);
			
			vflds = new string[]{"vname","vphone","vemail","vyoubian","vaddress","vtopic","vcontent","vstate"};
			flds = new string[]{"fld_"+cid+"_10","fld_"+cid+"_11","fld_"+cid+"_12","fld_"+cid+"_13","fld_"+cid+"_14","chtopic","chcontent","chstate"};
			mflds = new string[]{"您的姓名|vname","电子邮件|vemail","标题|vtopic","内容|vcontent"};
			types="00000001";
		}
		
		//信息提交
		private void Go_Submit(object sender, System.Web.UI.ImageClickEventArgs e){
			if(CheckMust()){
				string tmpemail=vemail.Value;							
				if(tmpemail.IndexOf("@")>0){
					string exeinfo = HeadXuHui.InsertData(dtable,flds,vflds,types);
					if(exeinfo == "操作未成功！"){
						alert.InnerText = exeinfo;
					}else{
						shuru.Visible=false;
						wancheng.Visible=true;
					}
				}else{
					alert.InnerText="联系Email非法";
				}
			}
		}
		
		//清空
		private void Go_Clear(object sender, System.Web.UI.ImageClickEventArgs e){
			alert.InnerText="";
			HeadXuHui.ClearData(vflds);
		}
		
		//验证必填字段
		private bool CheckMust(){
			alert.InnerText="";
			StringBuilder astr= new StringBuilder();
			for(int i=0;i<mflds.Length;i++){
				string[] cm=mflds[i].Split('|');
				if(cm.Length>1){
					if(HeadXuHui.GetControlValue(FindControl(cm[1])).Length == 0){
							astr.Append(cm[0]+"不可以为空！");
						}
					}else{
						astr.Append("必填项设置错误！");
						break;
					}
				}
				if(astr.Length>0){
					alert.InnerText = astr.ToString();
					return false;
				}else{
				return true;
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
                      <td height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;<span class="font1220B_green">信访受理</span></td>
                      <td align="right"><a href="sub_XinFangchaxun.aspx?cid=56"><img src="images/xinfang_chaxun.jpg" border="0"></a></td>
                    </tr>
                    <tr bgcolor="#E5E5E5">
                      <td height="3" colspan="2"></td>
                    </tr>
                    
<!--信息输入-->  
<input id="vstate" type="hidden" runat="server">
<div id="shuru" runat="server">                  
<tr align="center">
    <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1220_gray" style="padding-top:10px;">
    <tr>
        <td width="13%">您的姓名</td>
        <td width="42%" align="left"><input id="vname" name="textfield" type="text" size="18" runat="server">&nbsp;<font color="#ff0000">*</font></td>
        <td width="13%">联系电话</td>
        <td width="32%" align="left"><input id="vphone" name="textfield" type="text" size="18" runat="server"></td>
    </tr>
    <tr>
        <td>E-mail</td>
        <td align="left"><input id="vemail" name="textfield" type="text" size="18" runat="server">&nbsp;<font color="#ff0000">*</font></td>
        <td>邮政编码</td>
        <td align="left"><input id="vyoubian" name="textfield" type="text" size="18" runat="server"></td>
    </tr>
    <tr>
        <td>联系地址</td>
        <td colspan="3" align="left"><input id="vaddress" name="textfield" type="text" size="30" runat="server"></td>
        </tr>
    <tr>
        <td>标&nbsp;&nbsp;&nbsp;&nbsp;题</td>
        <td colspan="3" align="left"><input id="vtopic" name="textfield" type="text" size="30" runat="server">&nbsp;<font color="#ff0000">*</font></td>
        </tr>
    <tr>
        <td>内&nbsp;&nbsp;&nbsp;&nbsp;容</td>
        <td colspan="3" align="left"><textarea id="vcontent" name="textarea" cols="50" rows="6" runat="server"></textarea>&nbsp;<font color="#ff0000">*</font></td>
        </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="3" align="left">
        <input id="imageField1" name="imageField" type="image" src="images/sub_juchangxx_17.jpg" width="70" height="24" border="0" style="margin:8px;" onserverclick="Go_Submit" runat="server">
        <input id="imageField2" name="imageField" type="image" src="images/sub_juchangxx_19.jpg" width="70" height="24" border="0" style="margin:8px;" onserverclick="Go_Clear" runat="server"></td>
        </tr>
    <tr>
		<td align="center" height="38" colspan="4"><div id="alert" runat="server"></div></td>
    </tr>
    </table></td>
</tr>
</div>
<!--信息输入-->                     

<!--完成提示-->
<div id="wancheng" runat="server">                  
<tr align="center">
    <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1220_gray" style="padding-top:10px;">
    <tr>
		<td colspan="2" align="center">您所填写的信息已经提交！</td>
    </tr>
    <tr>
		<td colspan="2" align="center"><a href="redirect.aspx?cid=56">[<font color="#FF0000">返回</font>]</a></td>
    </tr>
    </table></td>
</tr>
</div>
<!--完成提示-->

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
