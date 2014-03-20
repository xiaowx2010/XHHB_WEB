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
			int years = Convert.ToInt32(GetQueryString("years","1900"));
			int yues = Convert.ToInt32(GetQueryString("yues","1"));	
			int days = Convert.ToInt32(GetQueryString("days","1"));	
			
			System.DateTime timers = new DateTime(years,yues,days);
			if (!IsPostBack)
			{
				System.Web.UI.WebControls.ListItem li;			
				int thisyear = System.DateTime.Today.Year;
				for(int i=System.DateTime.Today.Year-5;i<=System.DateTime.Today.Year;i++){
					li=new System.Web.UI.WebControls.ListItem(i.ToString(),i.ToString());				
					if(timers.Year == i){li.Selected=true;}
					searchyears.Items.Add(li);
				}
				for(int i=1;i<13;i++){
					searchmonths.Items.Add(i.ToString());
					if(timers.Month == i){searchmonths.SelectedIndex=i-1;}
				}
				for(int i=1;i<32;i++){
					searchdays.Items.Add(i.ToString());
					if(timers.Day == i){searchdays.SelectedIndex=i-1;}
				}	
				
			}   
		
			cid="62";
			Contentzlrb.SqlStr="select fld_"+cid+"_10,fld_"+cid+"_15,fld_"+cid+"_12,fld_"+cid+"_16,fld_"+cid+"_14,fld_"+cid+"_17,fld_"+cid+"_18,fld_"+cid+"_19,chputdate,cast(datepart(year,chdate) as varchar(50)) as year,cast(datepart(month,chdate) as varchar(50)) as month,cast(datepart(day,chdate) as varchar(50)) as day from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
			
			if(!IsPostBack)
			{
				SqlDB db=new SqlDB();
				db.SqlString=Contentzlrb.SqlStr;
				DataTable dt=db.GetDataTable();
				if(dt.Rows.Count>0)
				{	
					string year=dt.Rows[0]["year"].ToString();
					string month=dt.Rows[0]["month"].ToString();
					string day=dt.Rows[0]["day"].ToString();
					searchyears.Value=year;
					searchmonths.Value=month;
					searchdays.Value=day;
				}
			}
		}
		
	private void Go_Submit(object sender,System.Web.UI.ImageClickEventArgs e)
		{
			if(searchyears.Value == "" ){searchyears.SelectedIndex = 0;}
			int ty = Convert.ToInt32(searchyears.Value);
			int tm = Convert.ToInt32(searchmonths.Value);
			int td = Convert.ToInt32(searchdays.Value);	
			System.DateTime timers = new DateTime(ty,tm,td);
		
			Contentzlrb.SqlStr="select fld_"+cid+"_10,fld_"+cid+"_15,fld_"+cid+"_12,fld_"+cid+"_16,fld_"+cid+"_14,fld_"+cid+"_17,fld_"+cid+"_18,fld_"+cid+"_19,chdate from "+GetChannelDataTableName(cid)+" where chstate=0 and datepart(year,chdate)='"+searchyears.Value+"' and datepart(month,chdate)='"+searchmonths.Value+"' and datepart(day,chdate)='"+searchdays.Value+"'";
		//	Response.Write(Contentzlrb.SqlStr);
		
		}
	</script>


<body topmargin="0" leftmargin="0" class="page_bgline">
 <form id="FormXuHui" runat="server">
<table width="820"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="20" background="images/index_01.gif">&nbsp;</td>
    <td width="780">
	    <!--#include file="head.aspx"-->
	</td>
    <td width="20" background="images/index_02.gif">&nbsp;</td>
  </tr>
  <tr>
    <td background="images/index_01.gif">&nbsp;</td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr valign="top">
        <td width="190" bgcolor="#BEE6A7" class="left_bottombg"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/sub_hbdt_01.gif" width="190" height="24"></td>
          </tr>
          <tr>
            <td align="center"><table width="169" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/sub_hbdt_02.gif" width="169" height="48"></td>
              </tr>
              <tr>
                <td align="center" background="images/sub_hbdt_03.gif"><table width="133" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img src="images/sub-kqzlrb.gif" width="133" height="23"></td>
                  </tr>        
                  
                 
                  
                 <tr>
                    <td align="center" valign="bottom" style="padding-top:10px; "><img src="images/sub-kqzlrb1.gif" width="129" height="146"></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td><img src="images/sub_hbdt_04.gif" width="169" height="11"></td>
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
                <td align="center" valign="top" background="images/sub_hbdt_23.gif">
				<div style="width:526px;overflow:hidden; padding-top:5px">				  
				  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" align="left" class="font1220B_green"><img src="images/sub_hbkj_03.gif" width="19" height="19" align="absmiddle">&nbsp;空气质量日报</td>
                      </tr>
                    <tr bgcolor="#E5E5E5">
                      <td height="3"></td>
                    </tr>
                    <tr>
                      <td><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#D4D4D4" style="margin-top:20px; margin-bottom:36px; ">
                        <tr align="center" bgcolor="#FFFFFF" >
                          <td colspan="16" class="font1225_black" style="padding-top:10px; "><table width="511" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" >
                            <tr align="center" valign="middle" bgcolor="#EAEAEA">
                              <td>
                                    <!--空气质量日报-->                    
<G:ListBox id="Contentzlrb" rows="1" alert="没有您需要查找的内容！" style="width:150px; height:155px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatezlrb" runat="server">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr align="left" class="font1220_gray">
        <td>指标</td>
        <td>API</td>
        <td>等级</td>
    </tr>
    <tr align="left" class="font1220_gray">
        <td>可吸入颗粒物</td>
        <td>*</td>
        <td>*</td>
    </tr>
    <tr align="left" class="font1220_gray">
        <td>二氧化硫</td>
        <td>*</td>
        <td>*</td>
    </tr>
    <tr align="left" class="font1220_gray">
        <td>二氧化氮</td>
        <td>*</td>
        <td>*</td>
    </tr>
    <tr align="left">
        <td height="10" colspan="3"> </td>
        </tr>
    <tr align="left" class="font1220_black">
        <td colspan="3"><span class="font1220_black">今日主要污染物：*.</span></td>
        </tr>
    <tr align="left" class="font1220_black">
        <td colspan="3"><span class="font1220_black">总体评价：*.</span></td>
        </tr>
    </table>
</G:Template>
</G:ListBox>	
							  </td>
                             
                            </tr>
                       
                          </table>
						  <table width="511" border="0" cellspacing="0" cellpadding="0" style="margin-top:17px; margin-bottom:17px; ">
  <tr>
    <td width="190" align="center">空气质量报告查询:(日期查询)</td>
    <td width="90" align="left" valign="middle"><select id="searchyears" name="select" style="height:18px; " runat="server">
		</select>年
   </td>
    <td width="70" align="left"><select id="searchmonths" name="select" style="height:18px; " runat="server">
    </select>
      月
 </td>
      <td width="70">
		<select id="searchdays" name="select" style="height:18px; " runat="server">
		</select>日
	</td>
    <td width="92" align="left">
	 <input id="rbcxbt" name="rbcxbt" type="image" src="images/sub-kqzlrb2.gif" width="45" height="18" border="0" onserverclick="Go_Submit" runat="server">
	</td>
  </tr>
</table>

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
  <tr>
    <td background="images/index_01.gif">&nbsp;</td>
    <td>
	     <!--#include file="foot.aspx"-->
	</td>
    <td background="images/index_02.gif">&nbsp;</td>
  </tr>
</table></form>
</body>
</html>
