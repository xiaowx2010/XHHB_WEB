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
	string voteCode="0";
		private void Page_Load(object sender,System.EventArgs e)
		{
			
			cid="21";
			TopArticlehbdt.SqlStr="select "+cid+",chcode,' ' as imgstr,chcontent from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			ListBoxhbdt.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="22";
			ListBoxgdhb.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			TopArticlegdhb.SqlStr="select "+cid+",chcode,' ' as imgstr,chcontent from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="48";
			ListBoxcm.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			cid="24";
			ListBoxzngg.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
		//	cid="27":
		//	ListBoxgdt.SqlStr="select "+cid+",chcode,chtopic from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			BindVote();
		}
		
		//在线调查
		private void BindVote()
		{
			SqlDB db = new SqlDB();
			int i = 0;
			System.Web.UI.WebControls.ListItem liVote;
			db.SqlString = "SELECT TOP 1 VoteName,VoteCode FROM gcms_Vote where VoteState<>'停用'  ORDER BY EditDate DESC";
			ContentVTopic.DataTable = db.GetDataTable();
			if (ContentVTopic.DataTable.Rows.Count > 0)
			{
				voteCode = ContentVTopic.DataTable.Rows[0][1].ToString();
				if (!IsPostBack)
				{
					db.SqlString = "SELECT TOP 3 VoteItemCode,VoteItemName FROM gcms_VoteItem WHERE VoteCode=" + ContentVTopic.DataTable.Rows[0][1].ToString() + " ORDER BY EditDate DESC";
					if (db.GetDataTable().Rows.Count > 0)
					{
						foreach (DataRow dr in db.GetDataTable().Rows)
						{
							liVote = new ListItem(dr["VoteItemName"].ToString(), dr["VoteItemCode"].ToString());
							if (i==0)
								liVote.Selected = true;
							rblVVote.Items.Add(liVote);	
							i++;			
						}
					}
				}
			}
		}
		
		private void Go_Vote(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			SqlDB db = new SqlDB();
			if(rblVVote.Items.Count>0)
			{
				string b1="";
					SqlDB db1 = new SqlDB();	
					db1.SqlString="select VoteDesc from gcms_Vote WHERE VoteCode=" + voteCode ;		
					if(db1.GetDataTable().Rows.Count!=0)  
					{
						b1=db1.GetDataTable().Rows[0]["VoteDesc"].ToString(); 
						if(b1.IndexOf(Page.Request.UserHostAddress) > 0)
						{
						Response.Write("<s"+"cript language=javascript>pop=open('pop_vote.aspx?id=" + voteCode + "&hint=2','OpenDetail','height=600,width=600,status=no,toolbar=no,menubar=no,location=no,resizable=no,directories=no,top=0,left=100','');pop.focus();window.history.back();</s"+"cript>");
						}
						else	
						{					
						string b=Page.Request.UserHostAddress;
						if(rblVVote.SelectedValue != null)
							{
								db.SqlString = "UPDATE gcms_VoteItem SET VoteItemCount=VoteItemCount+1 WHERE VoteItemCode=" + rblVVote.SelectedValue.Replace(";","");
								db.UpdateTable();
							}
						SqlDB db2 = new SqlDB();
						db2.SqlString="UPDATE gcms_Vote SET  VoteDesc=CAST(ISNULL(VoteDesc, '') as varchar)+';"+Page.Request.UserHostAddress+"' WHERE VoteCode=" + voteCode;
						db2.UpdateTable();
						Response.Write("<s"+"cript language=javascript>pop=open('pop_vote.aspx?id=" + voteCode + "&hint=1','OpenDetail','height=600,width=600,status=no,toolbar=no,menubar=no,location=no,resizable=no,directories=no,top=0,left=100','');;pop.focus();window.history.back();</s"+"cript>");
						}
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
      <tr>
        <td width="190" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/index_13.gif" width="190" height="31"></td>
          </tr>
          <tr>
            <td align="center" bgcolor="#BFE7A8">
            
<!--空气质量日报-->
<iframe border=0 frameborder=0 framespacing=0 marginheight=0 marginwidth=0 name=gb_big5 noResize scrolling=no src="zhiliangribao.aspx" width="175" height="274" allowtransparency="true" ></iframe>            
<!--空气质量日报-->			
			
			</td>
          </tr>
          <tr>
            <td align="center" bgcolor="#BFE7A8">
			<div style="width:175px; height:240px; overflow:hidden; padding-top:8px">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><a href="redirect.aspx?cid=78"><img src="images/index_20.gif" width="174" height="46" border="0"></a></td>
              </tr>
              <tr>
                <td height="6"> </td>
              </tr>
              <tr>
                <td><a href="http://www.xuhui.gov.cn/website2009/infoopen/deptIndex.aspx?pageurl=dept&dt_id=147" target="_blank"><img src="images/index_21.gif" width="174" height="46" border="0"></a></td>
              </tr>
              <tr>
                <td height="6"> </td>
              </tr>
              <tr>
                <td><a href="redirect.aspx?cid=63"><img src="images/index_22.gif" width="174" height="46" border="0"></a></td>
              </tr>
              <tr>
                <td height="6"> </td>
              </tr>
              <tr>
                <td><a href="http://epb.xh.sh.cn/xuhuihuanbaogis_2006/speedmap/speedmap.aspx" target="_blank"><img src="images/index_23.gif" width="174" height="70" border="0"></a></td>
              </tr>
            </table>
			</div>
			</td>
          </tr>
          <tr>
            <td><table width="100%"  border="0" cellspacing="0" cellpadding="0"> 
              <tr>
                <td><img src="images/index_24.gif" width="190" height="19"></td>
              </tr>
              <tr>
                <td align="center" class="pingcebg">  


<div style="width:165px; height:149px; overflow:hidden; padding-top:5px;">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
    <td colspan="2">
    
<G:Content id="ContentVTopic" showchars="150" style="OVERFLOW-Y:hidden" contentfield="CHContent" runat="server">
		<G:Template id="TemplateSReview" runat="server">*</G:Template>
</G:Content>    
    
    </td>
</tr>
<tr>
    <td colspan="2">
    
<asp:RadioButtonList ID="rblVVote" runat="server" />            
    
    </td>
</tr>
    <tr align="left">
    <td height="25" align="center"><input id="btn_goVote" name="imageField" type="image" src="images/index_25.gif" width="48" height="18" border="0" onserverclick="Go_Vote" runat="server"></td>
    <td><input id="btn_goView" name="imageField" type="image" src="images/index_26.gif" width="68" height="18" border="0" onclick="javascript:__doOpenArticle('pop_vote.aspx?id=<%=voteCode%>')"></td>
    </tr>
</table>
</div>

				</div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="390" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="171"><img src="images/index_28.gif" width="171" height="24"></td>
                <td width="150" align="center" background="images/index_29.gif" class="font1220_green"><!--#include file="date.aspx"--></td>
                <td width="69"><img src="images/index_30.gif" width="69" height="24"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><table width="360" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="330" align="left"><img src="images/index_31.gif" width="244" height="27"></td>
                <td width="30" valign="bottom"><a href="redirect.aspx?cid=48"><img src="images/index_32.gif" width="30" height="17" border="0"></a></td>
                </tr>
              <tr bgcolor="#C9C9C9">
                <td height="1" colspan="2"> </td>
              </tr>
              <tr>
                <td height="6" colspan="2"> </td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td colspan="2"><img src="images/index_33.gif" width="360" height="7"></td>
                  </tr>
                  <tr>
                    <td width="132" height="105" align="center" background="images/index_34.gif">
                    
<!--环保三年行动计划及创模图片-->                    
<table width="120" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td colspan="3"><img src="images/index_36.gif" width="115" height="4"></td>
    <td rowspan="3"><img src="images/index_40.gif" width="5" height="93"></td>
    </tr>
    <tr>
    <td width="4"><img src="images/index_37.gif" width="4" height="79"></td>
    <td width="107">
	<div style="width:107px; height:79px; overflow:hidden">
	<img src="images/index_41.gif" width="107" height="79">
	</div>
	</td>
    <td width="4"><img src="images/index_38.gif" width="4" height="79"></td>
    </tr>
    <tr>
    <td colspan="3"><img src="images/index_39.gif" width="115" height="10"></td>
    </tr>
</table>
<!--环保三年行动计划及创模图片-->                     
                    
                    </td>
                    <td width="228" align="left" valign="top" background="images/index_34.gif">
                    
<!--环保三年行动计划及创模列表-->                    
<G:ListBox id="ListBoxcm" rows="4" contentfield="chtopic" showchars="15" style="width:225px; height:100px; overflow:hidden;" runat="server">
<G:Template id="Templatecm" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr>
    <td><span class="font1220_blue">·</span><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
</table>
</G:Template>
</G:ListBox>
<!--环保三年行动计划及创模列表--> 					
					
					</td>
                  </tr>
                  <tr>
                    <td colspan="2"><img src="images/index_35.gif" width="360" height="8"></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="8" bgcolor="#FFFFFF"> </td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><table width="360" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="330" align="left"><img src="images/index_42.gif" width="98" height="27"></td>
                <td width="30" valign="bottom"><a href="redirect.aspx?cid=21"><img src="images/index_32.gif" width="30" height="17" border="0"></a></td>
              </tr>
              <tr bgcolor="#C9C9C9">
                <td height="1" colspan="2"></td>
              </tr>
              <tr>
                <td height="6" colspan="2"></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="132" height="105" align="center">
                      
<!--徐汇环保动态图片-->    
<G:TopArticle id="TopArticlehbdt" contentfield="chcontent" showchars="200" imgstr="images/index_41.1.gif" imgwidth="107" imgheight="79" runat="server">
<G:Template id="Templatehbdtt" runat="server">                  
<table width="120" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td colspan="3"><img src="images/index_36.gif" width="115" height="4"></td>
    <td rowspan="3"><img src="images/index_43.gif" width="5" height="93"></td>
    </tr>
    <tr>
    <td width="4"><img src="images/index_37.gif" width="4" height="79"></td>
    <td width="107"><div style="width:107px; height:79px; overflow:hidden"><a href="sub_news.aspx?cid=*&id=*">*</a></div></td>
    <td width="4"><img src="images/index_38.gif" width="4" height="79"></td>
    </tr>
    <tr>
    <td colspan="3"><img src="images/index_44.gif" width="115" height="10"></td>
    </tr>
</table>
</G:Template>
</G:TopArticle>
<!--徐汇环保动态图片-->                       
                      
                      </td>
                      <td width="228" align="left" valign="top">
                      
<!--徐汇环保动态列表-->                      
<G:ListBox id="ListBoxhbdt" rows="4" contentfield="chtopic" showchars="15" style="width:225px; height:100px; overflow:hidden;" runat="server">
<G:Template id="Templatehbdt" runat="server">
    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr>
        <td><span class="font1220_blue">·</span><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
    </table>
</G:Template>
</G:ListBox>
<!--徐汇环保动态列表-->                      
                      
                      </td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="8" bgcolor="#FFFFFF"> </td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><table width="360" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="330" align="left"><img src="images/index_46.gif" width="94" height="28"></td>
                <td width="30" valign="bottom"><a href="redirect.aspx?cid=22"><img src="images/index_32.gif" width="30" height="17" border="0"></a></td>
              </tr>
              <tr bgcolor="#C9C9C9">
                <td height="1" colspan="2"></td>
              </tr>
              <tr>
                <td height="6" colspan="2"></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="228" align="left" valign="top">
                      
<!--各地环保动态列表-->                      
<G:ListBox id="ListBoxgdhb" rows="4" contentfield="chtopic" showchars="15" style="width:225px; height:100px; overflow:hidden;" runat="server">
<G:Template id="Templategdhblb" runat="server">
    <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_black">
    <tr>
        <td><span class="font1220_blue">·</span><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
    </table>
</G:Template>
</G:ListBox>
<!--各地环保动态列表-->                      
                      
                      </td>
					  <td width="132" height="105" align="center">
					  
<!--各地环保动态图片-->	
<G:TopArticle id="TopArticlegdhb" imgstr="images/index_41.2.gif" imgwidth="107" imgheight="79" contentfield="chcontent" showchars="200" runat="server">
<G:Template id="Templategdhbtp" runat="server">				  
<table width="120" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td colspan="3"><img src="images/index_36.gif" width="115" height="4"></td>
    <td rowspan="3"><img src="images/index_43.gif" width="5" height="93"></td>
    </tr>
    <tr>
    <td width="4"><img src="images/index_37.gif" width="4" height="79"></td>
    <td width="107"><div style="width:107px; height:79px; overflow:hidden"><a href="sub_news.aspx?cid=*&id=*">*</a></div></td>
    <td width="4"><img src="images/index_38.gif" width="4" height="79"></td>
    </tr>
    <tr>
    <td colspan="3"><img src="images/index_44.gif" width="115" height="10"></td>
    </tr>
</table>
</G:Template>
</G:TopArticle>
<!--各地环保动态图片-->                      
                      
                      </td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="8" bgcolor="#FFFFFF"> </td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><table width="360" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="330" align="left"><img src="images/index_48.gif" width="78" height="27"></td>
                <td width="30" valign="bottom"></td>
              </tr>
              <tr bgcolor="#C9C9C9">
                <td height="1" colspan="2"></td>
              </tr>
              <tr>
                <td colspan="2" style="padding-top:4px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr align="center">
                    <td><a href="redirect.aspx?cid=26"><img src="images/index_49.gif" width="171" height="45" border="0"></a></td>
                    <td><a href="redirect.aspx?cid=23"><img src="images/index_50.gif" width="171" height="45" border="0"></a></td>
                  </tr>
                  <tr align="center">
                    <td height="4" colspan="2"> </td>
                    </tr>
                  <tr align="center">
                    <td><a href="redirect.aspx?cid=45"><img src="images/index_51.gif" width="171" height="45" border="0"></a></td>
                    <td><a href="redirect.aspx?cid=47"><img src="images/index_52.gif" width="171" height="45" border="0"></a></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="8" bgcolor="#FFFFFF"> </td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><table width="360" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="330" align="left"><img src="images/index_53.gif" width="82" height="24"></td>
              </tr>
              <tr bgcolor="#C9C9C9">
                <td height="1" colspan="2"></td>
              </tr>
              <tr>
                <td height="26" colspan="2" style="padding-top:4px; ">
                
<!--相关链接-->                
<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="font1225_black">
    <tr align="center">
    <td height="30" align="center" valign="middle">
    <select name="select1" onchange="if(this.options[this.selectedIndex].value!=''){window.open(this.options[this.selectedIndex].value);}" >
        <option selected>环境相关网站</option>
        <G:ListBox id="ListBoxLink1" SqlStr="select chkeyword,chtopic from gcms_ch_66 where chstate=0 order by chputdate desc" runat="server">
        <G:Template id="TemplateLink1" type="repeat" runat="server">                          
        <option value="*">*</option>
        </G:Template>
        </G:ListBox>
    </select>
    </td>
    
    <td height="30" align="center" valign="middle">
    <select name="select1" onchange="if(this.options[this.selectedIndex].value!=''){window.open(this.options[this.selectedIndex].value);}" >
        <option selected>政府部门网站</option>
        <G:ListBox id="ListBoxLink2" SqlStr="select chkeyword,chtopic from gcms_ch_67 where chstate=0 order by chputdate desc" runat="server">
        <G:Template id="TemplateLink2" type="repeat" runat="server">                          
        <option value="*">*</option>
        </G:Template>
        </G:ListBox>
    </select>
    </td>
    </tr>
</table>
<!--相关链接-->                
                
                </td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="200" align="left" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/index_54.gif" width="200" height="21"></td>
          </tr>
          <tr>
            <td><table width="199" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/index_55.gif" width="150" height="23"></td>
                <td><a href="redirect.aspx?cid=24"><img src="images/index_56.gif" width="49" height="23" border="0"></a></td>
              </tr>
              <tr align="center">
                <td colspan="2" background="images/index_57.gif">
                
<!--站内公告列表-->        
<div style="width:165px; height:110px; overflow:hidden; padding-top:5px">
<marquee direction=up height="110" width="165" id=flashit onMouseOut=this.start() onMouseOver=this.stop() scrollamount=1 scrolldelay=40 align=center>        
<G:ListBox id="ListBoxzngg" runat="server">
<G:Template id="Templatezngg" runat="server">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1220_black">
    <tr valign="top">
        <td><span class="font1220_blue">·</span></td><td><a href="sub_news.aspx?cid=*&id=*">*</a></td>
    </tr>
    </table>
</G:Template>
</G:ListBox>
</marquee>
</div>
<!--站内公告列表-->  				
				
				</td>
                </tr>
              <tr>
                <td colspan="2"><img src="images/index_58.gif" width="199" height="10"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="5"> </td>
          </tr>
          <tr>
            <td><table width="199" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/index_59.gif" width="199" height="23"></td>
                </tr>
              <tr align="center">
                <td background="images/index_57.gif" style=" padding-top:7px; "><table width="187" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><a href="redirect.aspx?cid=56"><img src="images/index_60.gif" width="187" height="32" border="0"></a></td>
                  </tr>
                  <tr>
                    <td height="7"> </td>
                  </tr>
                  <tr>
                    <td><a href="redirect.aspx?cid=57"><img src="images/index_61.gif" width="187" height="32" border="0"></a></td>
                  </tr>
                  <tr>
                    <td height="7"> </td>
                  </tr>
                  <tr>
                    <td><a href="redirect.aspx?cid=58"><img src="images/index_62.gif" width="187" height="32" border="0"></a></td>
                  </tr>
                  <tr>
                    <td height="7"> </td>
                  </tr>
                  <tr>
                    <td><a href="redirect.aspx?cid=55"><img src="images/index_63.gif" width="187" height="32" border="0"></a></td>
                  </tr>
                  <tr>
                    <td height="7"> </td>
                  </tr>
                  <tr>
                    <td><a href="redirect.aspx?cid=54"><img src="images/index_64.gif" width="187" height="32" border="0"></a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><img src="images/index_58.gif" width="199" height="10"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="5"> </td>
          </tr>
          <tr>
            <td><table width="199" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><a href="redirect.aspx?cid=50"><img src="images/index_66.gif" width="199" height="23" border="0"></a></td>
              </tr>
              <tr align="center">
                <td background="images/index_57.gif" style=" padding-top:7px; "><table width="184" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img src="images/index_67.gif" width="184" height="18"></td>
                  </tr>
                  <tr>
                    <td align="center" background="images/index_68.gif">
					<div style="width:166px; height:89px; overflow:hidden">
					<img src="images/index_69.gif" width="166" height="89">
					</div>
					</td>
                  </tr>
                  <tr>
                    <td><img src="images/index_70.gif" width="184" height="24"></td>
                  </tr>
                  <tr>
                    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="left" valign="top"><img src="images/index_71.gif" width="4" height="7"></td>
                        <td><a href="redirect.aspx?cid=50"><img src="images/index_73.gif" width="52" height="53" border="0"></a></td>
                        <td>&nbsp;</td>
                        <td><a href="redirect.aspx?cid=51"><img src="images/index_74.gif" width="53" height="53" border="0"></a></td>
                        <td>&nbsp;</td>
                        <td><img src="images/index_75.gif" width="51" height="53"></td>
                        <td align="right" valign="top"><img src="images/index_72.gif" width="7" height="7"></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><img src="images/index_58.gif" width="199" height="10"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="5"> </td>
          </tr>
          <tr>
            <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="21%"><img src="images/index_77.gif" width="42" height="39"></td>
                <td width="74%" align="center" background="images/index_78.gif" class="font1220_black">您是第 <font color="#ff0000"><G:SiteCount id="SiteCount1" SiteCode="1" runat="server"></G:SiteCount></font> 位客人</td>
                <td width="5%"><img src="images/index_79.gif" width="11" height="39"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td background="images/index_02.gif">&nbsp;</td>
  </tr>
  <tr>
    <td background="images/index_01.gif">&nbsp;</td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="41%"><img src="images/bottom_01.jpg" width="320" height="88"></td>
        <td width="59%" valign="bottom" background="images/bottom_02.jpg" style="padding-bottom:10px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="85%" class="font1220_black">技术支持：<a href="http://www.yuhesys.com">上海雨和信息技术有限公司技术支持</a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td background="images/index_02.gif">&nbsp;</td>
  </tr>
</table>
<G:FloatLogo runat="server"></G:FloatLogo>
</form>
</body>
</html>
