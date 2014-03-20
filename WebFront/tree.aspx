<%@ Page Language="c#" %>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<!--#include file="../insql.aspx"-->
<script runat="server" language="C#">
	string clist = "|";		//������־ֱϵ�ϼ�
	int _l = 0;				//��ʾ�������Ĳ���
	int lmost = 1;			//��������ʾ�Ĳ�����������ֹͣ����
	DataTable cdt;			//��Ϊȫ�ֵģ��ø�����������
	private void Page_Load(object sender, System.EventArgs e)
	{
		string cid = GetQueryString("cid","0");
		if(cid != "0"){
			string rid = GetTopChannel(cid);//��ȡ���ϵ�һ����Ŀ
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
					//�����ֱϵ�ϼ�����������
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
	//��ȡһ����վ���������Ŀ���ϣ���������������Ϊ��ѯ�Ķ�����DataTable.Select������������ÿ�ζ������ݿ���
	private DataTable GetChannels(){
		if(cdt == null){
			SqlDB DB = new SqlDB();
			DB.SqlString = "SELECT * FROM gcms_Channel WHERE SiteCode<>'0'";
			cdt = DB.GetDataTable();
		}
		return cdt;
	}
	//��ȡ����Ŀ���ݵ����ϵ�һ����Ŀ�������϶���չ����˳���ȡ����ֱϵ�ϼ���clist�����Ա�֤�Ժ�ֻ��ֱϵ�ϼ�
	private string GetTopChannel(string cid){
		return GetUpChannel(cid);
	}
	//ͨ�����������ң��ҵ�ChannelLevel=1��ֹͣ
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
	//�ж�ĳ�ַ���Ϊ����
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
