<%@ Page Language="c#" %>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<!--#include file="../insql.aspx"-->
<script runat="server" language="C#">
	string clist = "|";		//用来标志直系上级
	int _l = 0;				//表示迭代到的层数
	int lmost = 1;			//控制树显示的层数，超过就停止迭代
	DataTable cdt;			//作为全局的，让各个函数调用
	private void Page_Load(object sender, System.EventArgs e)
	{
		string cid = GetQueryString("cid","0");
		if(cid != "0"){
			string rid = GetTopChannel(cid);//获取最上的一级栏目
			//Response.Write(clist);
			if(rid != ""){
				string classtype = "sub_leftmu01";
				DataRow[] drs = GetChannels().Select("ChannelUpperCode='"+rid+"' And ChannelState=0","channelindex ASC");
				Response.Write("<ul>");
				foreach(DataRow dr in drs)
				{
					switch(dr["ChannelCode"].ToString())
					{
					case "52":
						Response.Write("");
						break;
					case "63":
						Response.Write("");
						break;
					default:
						if(dr["ChannelCode"].ToString() == cid)	
							Response.Write("<li><a href=\"redirect.aspx?cid="+dr["ChannelCode"].ToString()+"\" class=\"dq\">"+dr["ChannelName"].ToString()+"</a></li>");						
						else
							Response.Write("<li><a href=\"redirect.aspx?cid="+dr["ChannelCode"].ToString()+"\">"+dr["ChannelName"].ToString()+"</a></li>");
						break;
					}					
					//如果是直系上级，就向下挖
					if(clist.IndexOf("|"+dr["ChannelCode"].ToString()+"|") != -1){
						WriteSubTree(cid,dr["ChannelCode"].ToString());
					}	
				}
				Response.Write("</ul>");
			}
		}
	}
	private void WriteSubTree(string cid,string scid){
			DataRow[] idrs = GetChannels().Select("ChannelUpperCode='"+scid+"' And ChannelState=0","channelindex ASC");
			if(idrs.Length > 0){
				Response.Write("");
				foreach(DataRow idr in idrs){
					switch(idr["ChannelCode"].ToString())
					{	
					    /**/
						case "68":
							Response.Write("");
						break;		
							
						case "69":
							Response.Write("");
						break;	
						
						
					default:	
						if(idr["ChannelCode"].ToString() == cid)	
						
							Response.Write("<dl><dt><a href=\"redirect.aspx?cid="+idr["ChannelCode"].ToString()+"\">"+idr["ChannelName"].ToString()+"</a></dt></dl>");
						else
							Response.Write("<dl><dd><a href=\"redirect.aspx?cid="+idr["ChannelCode"].ToString()+"\">"+idr["ChannelName"].ToString()+"</a></dd></dl>");
						break;
					}
					if(clist.IndexOf("|"+idr["ChannelCode"].ToString()+"|") != -1 ){
					WriteSubTree(cid,idr["ChannelCode"].ToString());
					}
				}
				Response.Write("");
			}
		
	}
	//获取一个本站点的所有栏目集合，在其他函数中作为查询的对象（用DataTable.Select方法），不用每次都查数据库了
	private DataTable GetChannels(){
		if(cdt == null){
			SqlDB DB = new SqlDB();
			DB.SqlString = "SELECT * FROM gcms_Channel WHERE SiteCode<>'0'";
			cdt = DB.GetDataTable();
		}
		return cdt;
	}
	//获取本栏目上溯的最上的一级栏目，好自上而下展开，顺便获取所有直系上级（clist），以保证以后只打开直系上级
	private string GetTopChannel(string cid){
		return GetUpChannel(cid);
	}
	//通过迭代往上找，找到ChannelLevel=1后停止
	private string GetUpChannel(string cid)
	{
		DataRow[] drs = GetChannels().Select("ChannelCode='"+cid+"'");
		if(drs.Length>0)
		{
			clist += cid+"|";
			if(drs[0]["ChannelLevel"].ToString() == "1")
				return cid;
			else
				return GetUpChannel(drs[0]["ChannelUpperCode"].ToString());
		}
		else
			return "";
	}
	//判断某字符串为数字
	private bool CheckInt(string str)
	{		
		try{
			Convert.ToInt32(str);
			return true;

		}catch{
			return false;
		}
		
	}
</script>
