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
        <td width="190" bgcolor="#BEE6A7" class="left_bottombg"><!--#include file="left.aspx"--></td>
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
                <td height="25" align="left" border="0"><!--#include file="traceup.aspx"--></td>
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
                      <td width="93%" height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;�ֳ�����</td>
                      <td width="7%" align="right"><img src="images/sub_hbkj_06.gif" width="38" height="20"></td>
                    </tr>
                    <tr bgcolor="#E5E5E5">
                      <td height="3" colspan="2"></td>
                    </tr>
                    <tr align="center">
                      <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30%" align="left" valign="middle" class="sub_jzxx_bj" style="padding-left:15px;"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="167">&nbsp;</td>
                            </tr>
                            <tr>
                              <td align="center" class="font1225_gray">�ֳ�:ĳĳĳ</td>
                            </tr>
                          </table></td>
                          <td width="70%"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_gray">
                            <tr>
                              <td align="left"><p>��ӭ������ֳ�����<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;������Ļ������������������ǻۺ͹���,����δ�����벻�����Ĺ�ע��ı��,����������������������к�����ͽ�����ͨ���ֳ�����ֱ����ֳ���ͨ.<br>
                                ��ӭ������ֳ�����<br>
&nbsp;&nbsp;&nbsp;&nbsp;������Ļ������������������ǻۺ͹���,����δ�����벻�����Ĺ�ע��ı��,����������������������к�����ͽ�����ͨ���ֳ�����ֱ����ֳ���ͨ.                              </p>
                                </td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr bgcolor="#E5E5E5">
                      <td height="3" colspan="2"></td>
                    </tr>
                    
<!--��Ϣ����-->  
<div id="shuru" runat="server">                  
<tr align="center">
    <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1220_gray" style="padding-top:10px;">
    <tr>
        <td width="13%">��������</td>
        <td width="42%" align="left"><input name="textfield" type="text" size="18"></td>
        <td width="13%">��ϵ�绰</td>
        <td width="32%" align="left"><input name="textfield" type="text" size="18"></td>
    </tr>
    <tr>
        <td>E-mail</td>
        <td align="left"><input name="textfield" type="text" size="18"></td>
        <td>��������</td>
        <td align="left"><input name="textfield" type="text" size="18"></td>
    </tr>
    <tr>
        <td>��ϵ��ַ</td>
        <td colspan="3" align="left"><input name="textfield" type="text" size="30"></td>
        </tr>
    <tr>
        <td>��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
        <td colspan="3" align="left"><input name="textfield" type="text" size="30"></td>
        </tr>
    <tr>
        <td>��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
        <td colspan="3" align="left"><textarea name="textarea" cols="50" rows="6"></textarea></td>
        </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="3" align="left"><input name="imageField" type="image" src="images/sub_juchangxx_17.jpg" width="70" height="24" border="0" style="margin:8px;">
        <input name="imageField" type="image" src="images/sub_juchangxx_19.jpg" width="70" height="24" border="0" style="margin:8px;"></td>
        </tr>
    </table></td>
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
		<td colspan="2" align="center"><a href="redirect.aspx?cid=54">[<font color="#FF0000">����</font>]</a></td>
    </tr>
    </table></td>
</tr>
</div>
<!--�����ʾ-->
                    
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
