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

<form id="FormXuHui" runat="server">
<table width="175"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="3"><a href="http://www.semc.gov.cn/aqi/home/index.aspx" target="_blank"><img src="images/shs_001.jpg" border="0"></a></td>
    </tr>
              <tr>
                <td width="4" background="images/index_16.gif"> </td>
                <td width="168" background="images/index_17.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="center">
                    
<!--���������ձ�-->  
<!--                  
<G:ListBox id="Contentzlrb" rows="1" alert="û������Ҫ���ҵ����ݣ�" style="width:150px; height:155px; overflow:hidden; padding-top:5px" runat="server">
<G:Template id="Templatezlrb" runat="server">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr align="left" class="font1220_gray">
        <td>ָ��</td>
        <td>API</td>
        <td>�ȼ�</td>
    </tr>
    <tr align="left" class="font1220_gray">
        <td>�����������</td>
        <td>*</td>
        <td>*</td>
    </tr>
    <tr align="left" class="font1220_gray">
        <td>��������</td>
        <td>*</td>
        <td>*</td>
    </tr>
    <tr align="left" class="font1220_gray">
        <td>��������</td>
        <td>*</td>
        <td>*</td>
    </tr>
    <tr align="left">
        <td height="10" colspan="3"> </td>
        </tr>
    <tr align="left" class="font1220_black">
        <td colspan="3"><span class="font1220_black">������Ҫ��Ⱦ�*.</span></td>
        </tr>
    <tr align="left" class="font1220_black">
        <td colspan="3"><span class="font1220_black">�������ۣ�*.</span></td>
        </tr>
    </table>
</G:Template>
</G:ListBox>
-->
<!--���������ձ�-->					
					
					</td>
                  </tr>
                  <tr>
                    <td align="center"><img src="images/index_15.gif" width="121" height="22"></td>
                  </tr>
                  <tr>
                    <td align="center">
                    
<!--���������ձ���ѯ-->                    
<div style="width:158px; height:56px; overflow:hidden; padding-top:5px">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<tr>
    <td>
		<select id="searchyears" name="select" style="height:18px; " runat="server">
		</select>��
    </td>
    <td>
		<select id="searchmonths" name="select" style="height:18px; " runat="server">
		</select>��
    </td>
    <td>
		<select id="searchdays" name="select" style="height:18px; " runat="server">
		</select>��
	</td>
</tr>
<tr align="right" valign="bottom">
    <td height="25" colspan="3" style="padding-right:15px"><input id="rbcxbt" name="rbcxbt" type="image" src="images/index_19.gif" width="45" height="18" border="0" onserverclick="Go_Submit" runat="server"></td>
    </tr>
</table>
</div>
<!--���������ձ���ѯ-->					
					
					</td>
                  </tr>
                </table></td>
                <td width="3" bgcolor="#8FC85F"> </td>
              </tr>
              <tr>
                <td colspan="3" ><img src="images/index_18.gif" width="175" height="12"></td>
                </tr>
            </table>
            </form>