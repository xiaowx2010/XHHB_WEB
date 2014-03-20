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
			
			ListBoxzxlb.SqlStr="select substring(fld_"+cid+"_10,0,6)+'...',"+cid+",chcode,chtopic,substring(chcontent,0,28)+'...' from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			wancheng.Visible=false;
			
			dtable="gcms_ch_"+cid;
			vstate.Value=GetLowstRight(cid);
			
			vflds = new string[]{"vname","vphone","vemail","vtopic","vcontent","vstate"};
			flds = new string[]{"fld_"+cid+"_10","fld_"+cid+"_11","fld_"+cid+"_12","chtopic","chcontent","chstate"};
			mflds = new string[]{"��������|vname","�����ʼ�|vemail","����|vtopic","����|vcontent"};
			types="000001";
		}
		
		//��Ϣ�ύ
		private void Go_Submit(object sender, System.Web.UI.ImageClickEventArgs e){
			if(CheckMust()){
				string tmpemail=vemail.Value;							
				if(tmpemail.IndexOf("@")>0){
					string exeinfo = HeadXuHui.InsertData(dtable,flds,vflds,types);
					if(exeinfo == "����δ�ɹ���"){
						alert.InnerText = exeinfo;
					}else{
						shuru.Visible=false;
						wancheng.Visible=true;
					}
				}else{
					alert.InnerText="��ϵEmail�Ƿ�";
				}
			}
		}
		
		//���
		private void Go_Clear(object sender, System.Web.UI.ImageClickEventArgs e){
			alert.InnerText="";
			HeadXuHui.ClearData(vflds);
		}
		
		//��֤�����ֶ�
		private bool CheckMust(){
			alert.InnerText="";
			StringBuilder astr= new StringBuilder();
			for(int i=0;i<mflds.Length;i++){
				string[] cm=mflds[i].Split('|');
				if(cm.Length>1){
					if(HeadXuHui.GetControlValue(FindControl(cm[1])).Length == 0){
							astr.Append(cm[0]+"������Ϊ�գ�");
						}
					}else{
						astr.Append("���������ô���");
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
                      <td height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;<span class="font1220B_green">������ѯ</span></td>
                      <td align="right"></td>
                    </tr>
                    <tr bgcolor="#E5E5E5">
                      <td height="3" colspan="2"></td>
                    </tr>
                    
<!--��Ϣ����-->      
<input id="vstate" type="hidden" runat="server">
<div id="shuru" runat="server">               
<tr>
    <td height="5" colspan="2"><div style="width:525px;overflow:hidden;">
    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1220_gray" style="padding-top:10px;">
        <tr>
        <td width="13%">��������</td>
        <td width="42%" align="left"><input id="vname" name="textfield" type="text" size="18" runat="server">&nbsp;<font color="#ff0000">*</font></td>
        <td width="13%">��ϵ�绰</td>
        <td width="32%" align="left"><input id="vphone" name="textfield" type="text" size="18" runat="server"></td>
        </tr>
        <tr>
        <td>E-mail</td>
        <td colspan="3" align="left"><input id="vemail" name="textfield" type="text" size="18" runat="server">&nbsp;<font color="#ff0000">*</font></td>
        </tr>
        <tr>
        <td>��ѯ����</td>
        <td colspan="3" align="left"><input id="vtopic" name="textfield" type="text" size="30" runat="server">&nbsp;<font color="#ff0000">*</font></td>
        </tr>
        <tr>
        
        </tr>
        <tr>
        <td>��ѯ����</td>
        <td colspan="3" align="left"><textarea id="vcontent" name="textarea" cols="50" rows="6" runat="server"></textarea>&nbsp;<font color="#ff0000">*</font></td>
        </tr>
        <tr>
        <td>&nbsp;</td>
        <td colspan="3" align="left"><input id="Field1" name="imageField" type="image" src="images/sub_juchangxx_17.jpg" width="70" height="24" border="0" style="margin:8px;" onserverclick="Go_Submit" runat="server">
            <input id="Field2" name="imageField" type="image" src="images/sub_juchangxx_19.jpg" width="70" height="24" border="0" style="margin:8px;" onserverclick="Go_Clear" runat="server"></td>
        </tr>
        <tr>
		<td align="center" height="38" colspan="4"><div id="alert" runat="server"></div></td>
    </tr>
    </table>
    </div></td>
</tr>
</div>
<!--��Ϣ����-->

<!--�����ʾ-->
<div id="wancheng" runat="server">                  
<tr align="center">
    <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1220_gray" style="padding-top:10px;">
    <tr>
		<td colspan="2" align="center">������д����Ϣ�Ѿ��ύ��</td>
    </tr>
    <tr>
		<td colspan="2" align="center"><a href="redirect.aspx?cid=55">[<font color="#FF0000">����</font>]</a></td>
    </tr>
    </table></td>
</tr>
</div>
<!--�����ʾ-->                    
                    
                    <tr bgcolor="#E5E5E5">
                      <td height="3" colspan="2"></td>
                    </tr>
                    <tr>
                      <td height="10" colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-top:6px;">
                        <tr>
                          <td width="4"><img src="images/sub_zxhd_jsxm_11.jpg" width="4" height="31"></td>
                          <td width="87" align="left" background="images/sub_zxhd_jsxm_12.jpg">| ��ѯ�� | </td>
                          <td width="201" align="center" background="images/sub_zxhd_jsxm_12.jpg"> | �� �� | </td>
                          <td width="228" align="center" background="images/sub_zxhd_jsxm_12.jpg">| �� ��|</td>
                          <td width="4"><img src="images/sub_zxhd_jsxm_15.jpg" width="4" height="31"></td>
                        </tr>
                        <tr align="center">
                          <td colspan="6" class="sub_boxline">
                          
<!--��ѯ�б�-->                          
<G:ListBox id="ListBoxzxlb" rows="7" alert="����Ŀ��ʱû�����ݣ�" contentfield="chtopic" showchars="15" style="width:513px;overflow:hidden; " runat="server">
<G:Template id="Templatezxlb" runat="server">
    <table width="98%"  border="0" cellpadding="0" cellspacing="0" class="font1225_gray">
    <tr>
        <td width="16%" align="left" class="sub_underline">*</td>
        <td width="4%" class="sub_underline">&nbsp;</td>
        <td width="40%" class="sub_underline"><a href="sub_zixunnews.aspx?cid=*&id=*">*</a></td>
        <td width="4%" class="sub_underline">&nbsp;</td>
        <td width="36%" class="sub_underline">*</td>
        </tr>
    </table>
</G:Template>
<G:NavStyle5 id="NavStyle55" prevtext="��һҳ" nexttext="��һҳ" runat="server"></G:NavStyle5>
</G:ListBox>
<!--��ѯ�б�-->                          
                          
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
