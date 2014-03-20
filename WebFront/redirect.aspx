<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<!--#include file="func.aspx"-->
<!--#include file="../insql.aspx"-->
<script runat="server" language="C#">
	private void Page_Load(object sender, System.EventArgs e)
	{
		cid = GetQueryString("cid","0");
		id = GetQueryString("id","0");
		switch(cid)
		{
			case "0":
				Response.Redirect("default.aspx");
				break;
			case "2":
				Response.Redirect("intro_jigoushezhi.aspx?cid="+cid);
				break;
			case "3":
				Response.Redirect("sub_xxgk_jsxmspcx.aspx?cid=57");
				break;
			/*
			case "5":
				Response.Redirect("sub_zcfg.aspx?cid=25");
				break;
			*/
			case "5":
				Response.Redirect("intro_zcfg.aspx?cid="+cid);
				break;
			case "7":
				Response.Redirect("intro_huanbaokeji.aspx?cid="+cid);
				break;
				
			case "25":
			case "26":
			case "76":
			case "77":
				Response.Redirect("sub_zcfg.aspx?cid="+cid);
				break;
				
			case "30":
			case "31":
			case "32":
			case "33":
				Response.Redirect("sub_wuranfangzhi.aspx?cid="+cid);
				break;
			
			case "34":
				Response.Redirect("sub_wuranfangzhi.aspx?cid=35");
				break;
				
			case "45":
			case "73":
			case "74":
				Response.Redirect("sub_lsxc.aspx?cid="+cid);
				break;
				
			case "47":
				Response.Redirect("sub_lsxc.aspx?cid=74");
				break;
								
			case "48":
			case "49":
			case "78":
				Response.Redirect("sub_3nxdjh.aspx?cid="+cid);
				break;
			
			case "50":
				Response.Redirect("sub_piclist.aspx?cid="+cid);
				break;
				
			case "57":
				Response.Redirect("sub_xxgk_jsxmspcx.aspx?cid="+cid);
				break;
				
			case "58":
				Response.Redirect("sub_yejianshigong.aspx?cid="+cid);
				break;
				
			case "63":
				Response.Redirect("/webfront/sub_news.aspx?cid=63&id=4");
				break;
			
			case "68":
				Response.Redirect("http://www.sepb.gov.cn/hb/zaosheng/search_login.jsp");
				break;
				
			case "70":
				Response.Redirect("sub_shiping.aspx?cid="+cid);
				break;
			case "999":
			    Response.Redirect("sub_hjyxpj.aspx?cid=999&stype=hpsl");
			    break;
			default:				
				Response.Redirect("sub_newslist.aspx?cid="+cid);				
				break; 
		}
	}
</script>
