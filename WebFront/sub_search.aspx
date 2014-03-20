<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<HTML>
	<HEAD>
		<G:HtmlHead id="HeadXuHui" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<!--#include file="func.aspx"-->
	<!--#include file="../insql.aspx"-->
	<script language="c#" runat="server">
		private void Page_Load(object sender,System.EventArgs e)
		{
			cid = GetQueryString("cid","0");
			string keytitle =GetQueryString("keytitle","");
			string keybody =GetQueryString("keybody","");
			int years = Convert.ToInt32(GetQueryString("years","1900"));
			int yues = Convert.ToInt32(GetQueryString("yues","1"));	
			int days = Convert.ToInt32(GetQueryString("days","1"));	
			int yeare = Convert.ToInt32(GetQueryString("yeare",System.DateTime.Today.Year.ToString()));
			int yuee = Convert.ToInt32(GetQueryString("yuee",System.DateTime.Today.Month.ToString()));	
			int daye = Convert.ToInt32(GetQueryString("daye",System.DateTime.Today.Day.ToString()));
			
			System.DateTime timers = new DateTime(years,yues,days);
			System.DateTime timere= new DateTime(yeare,yuee,daye);
			if (keytitle.Trim().Length>0 ){
				ListBoxSearch.TKeyWord=keytitle;
				ListBoxSearch.KeyWord=keybody;			
				ListBoxSearch.HighLightClass="red";			
				ListBoxSearch.SqlStr = "WriteTable @cateid='"+cid+"',@sitecode=1,@timers='"+GetTryDate(timers.ToString())+"',@timere='"+GetTryDate(timere.ToString())+"';";			
							
			}		
			if(keytitle=="" && keybody=="") alert.InnerText="请输入关键字！";			
				HeadXuHui.ChannelCode=cid;
				TraceUpXuHui.ChannelCode=cid;						
				
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
				for(int i=thisyear-5;i<=thisyear;i++){
					li=new System.Web.UI.WebControls.ListItem(i.ToString(),i.ToString());
					
					if(timere.Year == i){li.Selected=true;}
					searchyeare.Items.Add(li);
				}
				for(int i=1;i<13;i++){
					searchmonthe.Items.Add(i.ToString());
					if(timere.Month == i){searchmonthe.SelectedIndex=i-1;}
				}
				for(int i=1;i<32;i++){
					searchdaye.Items.Add(i.ToString());
					if(timere.Day == i){searchdaye.SelectedIndex=i-1;}
				}
				BindChannelAll();
				searchchannel.Value = cid;
				
			}  
		}
		
		private void BindChannelAll(){
			ListItem _li0 = new ListItem("--整站检索--","1");
			searchchannel.Items.Add(_li0);
			SqlDB db = new SqlDB();
			db.SqlString = "select channelcode,channelname from gcms_channel where channellevel=1 and sitecode=1 and channelstate=0 and channelcode<>52 ";
			foreach(DataRow dr in db.GetDataTable().Rows){
				ListItem _li = new ListItem(dr[1].ToString(),dr[0].ToString());
				searchchannel.Items.Add(_li);
			}
		}  
		//检索
		private void Go_LeftSearch(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			if(searchyears.Value == "" ){searchyears.SelectedIndex = 0;}
			int ty = Convert.ToInt32(searchyears.Value);
			int tm = Convert.ToInt32(searchmonths.Value);
			int td = Convert.ToInt32(searchdays.Value);	
			System.DateTime timers = new DateTime(ty,tm,td);
			int tye = Convert.ToInt32(searchyeare.Value);
			int tme = Convert.ToInt32(searchmonthe.Value);
			int tde = Convert.ToInt32(searchdaye.Value);
			
			System.DateTime timere = new DateTime(tye,tme,tde);
			if (DateTime.Compare(timers,timere)>0){
				alertsearch.InnerText="您所选择的日期范围不正确！";
			}else{
				Response.Redirect("sub_search.aspx?keytitle="+searchkeytitle.Value.Trim()+"&keybody="+searchkeybody.Value+"&cid="+searchchannel.Value+"&years="+timers.Year+"&yues="+timers.Month+"&days="+timers.Day+"&yeare="+timere.Year+"&yuee="+timere.Month+"&daye="+timere.Day+"");
			}  
		}
		private string GetTryDate(string datestr)
{
	if(datestr.Length>0) 
	{
		try 
		{ 
			Convert.ToDateTime(datestr); 
		} 
		catch
		{ 
			datestr=""; 
		} 
	} 
	return datestr; 
}
   
		
		
	</script>

<body>
<form id="FormXuHui" runat="server">
<!--#include file="head.aspx"-->
<div class="wrap_980">
 <div class="main box pt10">
  <div class="main sub_L">
   <div class="main nk">
    <div class="main box sub_lmys_001">
	 <dl>
	  <dt>站内检索</dt>
	  <dd></dd>
	 </dl>
	</div>
	<div class="main box search_bt">
	 检索结果：共有 <span id="realcount" name="realcount"></span> 条记录满足条件
	 <div id="alert" runat="server" class="font12_red" align="center"></div>
	</div>
	<div class="main box search_lb">
	 <ul>
	  <li>
	  <G:ListBoxS id="ListBoxSearch" rows="6" alert="" showchars="100" contentfield="chcontent" runat="server">
	  <G:Template id="TemplateSearch" type="repeat" runat="server">
	   
	    <dl>
		 <dt><a href="sub_news.aspx?cid=*&id=*">*</a></dt>
		 <dd>*</dd>
		</dl>
	   
	  </G:Template>
	  <G:NavStyle5 id="NavStyle1" prevtext="上一页" nexttext="下一页" class="fy" runat="server"></G:NavStyle5>
	  </G:ListBoxS>
	  </li>
	 </ul>
	</div>
   </div>
  </div>
  <div class="side sub_R">
   <div class="main box right_search_topbg"></div>
   <div id="alertsearch" runat=server class="font12_red"></div>
   <div class="main intro_gjjs_nr">
	 <dl><dt>正文检索：</dt><dd><input id="searchkeybody" name="textfield" type="text" class="input_01" runat="server"></dd></dl>
	 
	 <dl><dt>标题检索：</dt><dd><input id="searchkeytitle" name="textfield" type="text" class="input_01" runat="server"></dd></dl>
	 <dl><dt></dt><dd><select id="searchchannel" name="select" class="select_01" runat="server"></select></dd></dl>
	 <dl><dt>发表日期：</dt><dd></dd></dl>
	 <dl><dd><span>从</span></dd><dd><select id="searchyears" name="select" class="select_02" runat="server"></select></dd><dd>年</dd><dd><select id="searchmonths" name="select" class="select_03" runat="server"></select></dd><dd>月</dd><dd><select id="searchdays" name="select" class="select_03" runat="server"></select></dd><dd>日</dd></dl>

	 <dl><dd><span>到</span></dd><dd><select id="searchyeare" name="select" class="select_02" runat="server"></select></dd><dd>年</dd><dd><select id="searchmonthe" name="select" class="select_03" runat="server"></select></dd><dd>月</dd><dd><select id="searchdaye" name="select" class="select_03" runat="server"></select></dd><dd>日</dd></dl>
     <dl><dt></dt><dd><input id="gosearch" name="imageField" type="image" src="images/sub_qwjs.gif" class="input_02" onserverclick="Go_LeftSearch" runat="server"></dd></dl>
	</div>
   <div class="main box Right_links">
    <ul>
	 <li><a href="sub_news.aspx?cid=63&id=4" target="_blank"><img src="images/de_M_018.jpg"></a></li>
	 <li><a href="/webfront/intro_hudong_02.aspx" target="_blank"><img src="images/de_M_019.jpg"></a></li>
	</ul>
   </div>
  </div>
 </div>
 <div class="clear"></div>
</div>
<!--#include file="foot.aspx"-->
</form>
</body>
</html>
