<script language="c#" runat="server">
	private void Go_Search(object sender,System.Web.UI.ImageClickEventArgs e)
	{
		if(searchkey.Value.Trim().Replace(";","").Length>0)
		{
			Response.Redirect("sub_search.aspx?keytitle="+searchkey.Value.Replace(";","")+"&keybody="+searchkey.Value.Replace(";","")+"&keypage=or");
		}
	}
</script>


<script>
function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("�����ղ�ʧ�ܣ���ʹ��Ctrl+D�������");
        }
    }
}

function SetHome(obj,vrl){
        try{
                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        }
        catch(e){
                if(window.netscape) {
                        try {
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                        }
                        catch (e) {
                                alert("�˲�����������ܾ���\n�����������ַ�����롰about:config�����س�\nȻ�� [signed.applets.codebase_principal_support]��ֵ����Ϊ'true',˫�����ɡ�");
                        }
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                        prefs.setCharPref('browser.startup.homepage',vrl);
                 }
        }
}
</script>

<div class="wrap_980">
 <div class="main box top_link">
  <div class="main L">
   <ul>
    <li><a href="http://www.sepb.gov.cn" target="_blank">�Ϻ��л���������</a></li>
	<li><a href="http://www.xuhui.gov.cn" target="_blank">�Ϻ����</a></li>
   </ul>
  </div>
  <div class="main M">
   <!--#include file="date.aspx"-->
  </div>
  <div class="side R">
   <ul>
    <!--<li><a href="#">վ���ͼ</a></li>-->
	<li><a href="#" onclick="AddFavorite(window.location,document.title)">�����ղ�</a></li>
	<li><a href="#" onclick="SetHome(this,window.location)">��Ϊ��ҳ</a></li>
   </ul>
  </div>
 </div>
 <div class="clear"></div>
</div>
<div class="wrap_980">
 <div class="main box top_banner">
 <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="980" height="185">
     <param name="movie" value="images/top_banner.swf">
     <param name="quality" value="high">
	 <param name="wmode" value="transparent">
     <embed src="images/top_banner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="980" height="185" wmode="transparent"></embed>
   </object>
 </div>
 <div class="clear"></div>
</div>
<div class="wrap_980 top_menu">
 <table width="100%"  border="0" cellpadding="0" cellspacing="0" background="images/de_top_006.gif">
  <tr>
    <td width="2"><img src="images/de_top_004.gif" width="2" height="39"></td>
    <td align="center"><a href="/webfront/default.aspx">&nbsp;��   ҳ&nbsp;</a></td>
    <td width="2"><img src="images/de_top_007.gif" width="2" height="39"></td>
    <td align="center"><a href="redirect.aspx?cid=85">����Ӱ������</a></td>
    <td width="2"><img src="images/de_top_007.gif" width="2" height="39"></td>
    <td align="center"><a href="sub_3nxdjh.aspx?cid=48">�����ж��ƻ�</a></td>
    <td width="2"><img src="images/de_top_007.gif" width="2" height="39"></td>
    <td align="center"><a href="redirect.aspx?cid=30">��Ⱦ����</a></td>
    <td width="2"><img src="images/de_top_007.gif" width="2" height="39"></td>
    <td align="center"><a href="redirect.aspx?cid=83">���䰲ȫ</a></td>
    <td width="2"><img src="images/de_top_007.gif" width="2" height="39"></td>
    <td align="center"><a href="sub_lsxc.aspx?cid=74">��ɫ����</a></td>
    <td width="2"><img src="images/de_top_007.gif" width="2" height="39"></td>
    <td align="center"><a href="intro_zcfg.aspx?cid=5">���߷���</a></td>
    <td width="2"><img src="images/de_top_005.gif" width="2" height="39"></td>
  </tr>
 </table>
 <div class="clear"></div>
</div>
<div class="wrap_980">
 <div class="main box de_gg_search">
  <div class="main L_gg">
   <div class="main bt"><img src="images/de_top_011.gif"></div>
   <div class="main sj" onMouseOver="stop()" onMouseOut="start()">
    <ul id="scrollimg">
	<li id="simg">
	   <!--���¹��������б�-->
	   <G:ListBox id="ListBoxzxgg" rows="3" contentfield="chtopic" showchars="28" runat="server">
       <G:Template id="Templatezxgg" runat="server">
		<a href="sub_news.aspx?cid=*&id=*">*</a>
	   </G:Template>
       </G:ListBox>
	   <!--���¹��������б�-->
	   </li>
	   <li id="simg1"></li>
	</ul>
   </div>
  </div>
  <div class="side R_search">
   <div class="main">
    <dl>
	 <dt><img src="images/de_top_014.gif"></dt>
	 <dd><input id="searchkey" name="textfield" type="text" runat="server" class="search_srk"></dd>
	 <dd><input id="Search_GO" type="image" src="images/de_top_015.gif" width="53" height="22" border="0" onServerClick="Go_Search" runat="server"></dd>
	</dl>
   </div>
   <div class="side"><img src="images/de_top_009.gif"></div>
  </div>
 </div>
 <div class="clear"></div>
</div>

<SCRIPT   LANGUAGE="JavaScript">   
  var   tm=null   
  function   newsScroll()   {   
  if(scrollimg.parentNode.scrollLeft!=(scrollimg.clientWidth/2))   
  scrollimg.parentNode.scrollLeft++;   
  else   
  scrollimg.parentNode.scrollLeft=0   
  }   
  window.onload=function()   {   
  simg1.innerHTML=simg.innerHTML   
  tm=setInterval('newsScroll()',40)     
  }   
  function   stop()   
  {   
  clearInterval(tm)   
  }   
    
  function   start()   
  {   
  tm=setInterval('newsScroll()',40)     
  }   
  </SCRIPT>