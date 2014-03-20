<script language="c#" runat="server">
	private void Go_Search(object sender,System.Web.UI.ImageClickEventArgs e)
	{
		if(searchkey.Value.Trim().Replace(";","").Length>0)
		{
			Response.Redirect("sub_search.aspx?keytitle="+searchkey.Value.Replace(";","")+"&keybody="+searchkey.Value.Replace(";","")+"&keypage=or");
		}
	}
</script>

<tr>
    <td width="20" background="images/index_01.gif">&nbsp;</td>
    <td width="780"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="3" colspan="10" bgcolor="#14C03A"> </td>
      </tr>
      <tr>
        <td><a href="redirect.aspx?cid=0"><img src="images/index_03.gif" width="64" height="27" border="0"></a></td>
        <td><a href="redirect.aspx?cid=2"><img src="images/index_04.gif" width="75" height="27" border="0"></a></td>
        <td><a href="redirect.aspx?cid=3"><img src="images/index_05.gif" width="78" height="27" border="0"></a></td>
        <td><a href="redirect.aspx?cid=4"><img src="images/index_06.gif" width="81" height="27" border="0"></a></td>
        <td><a href="redirect.aspx?cid=5"><img src="images/index_07.gif" width="80" height="27" border="0"></a></td>
        <td><a href="redirect.aspx?cid=6"><img src="images/index_08.gif" width="79" height="27" border="0"></a></td>
        <td><a href="redirect.aspx?cid=7"><img src="images/index_09.gif" width="81" height="27" border="0"></a></td>
        <td><a href="redirect.aspx?cid=8"><img src="images/index_10.gif" width="79" height="27" border="0"></a></td>
        <td><a href="redirect.aspx?cid=9"><img src="images/index_11.gif" width="80" height="27" border="0"></a></td>
        <td><a href="redirect.aspx?cid=10"><img src="images/index_12.gif" width="83" height="27" border="0"></a></td>
      </tr>
      <tr>
        <td height="3" colspan="10" bgcolor="#19C741"> </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="1" colspan="10"></td>
      </tr>
      <tr>
        <td colspan="10"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/top_banner_01.jpg" width="780" height="151" alt=""></td>
          </tr>
          <tr>
            <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="44%"><img src="images/top_banner_02.jpg" width="344" height="35" alt=""></td>
                <td width="25%" height="35" background="images/top_banner_06.jpg"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="16%"><img src="images/top_banner_04.jpg" width="30" height="29" alt=""></td>
                    <td width="16%"><span class="font_green_12s">ËÑË÷</span></td>
                    <td width="54%"><input id="searchkey" name="textfield" type="text" size="13" runat="server"></td>
                    <td width="14%" align="right"><input id="Search_GO" type="image" src="images/top_banner_08.jpg" width="25" height="25" border="0" onServerClick="Go_Search" runat="server"></td>
                  </tr>
                </table></td>
                <td width="31%" height="35"><img src="images/top_banner_10.jpg" width="251" height="35" alt=""></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="20" background="images/index_02.gif">&nbsp;</td>
  </tr>