<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<script runat="server" language="C#">
	string dtable;		//更改和插入所指向的表
	string filter;		//更改和插入的WHERE子句
	string[] flds;		//字段名
	string[] mflds;		//必填字段名
	string[] vflds;
	string types;		//字符串，一位代表一列，0代表值为字符，1代表数字
	private string id;
	private string cid;
	private string sid;
	private string lid;
	private DataTable cdt;
	private string FilePath = ConfigurationSettings.AppSettings["FILEPATH"];
	System.DateTime T = System.DateTime.Today;
	
	private DataTable GetChannels()
	{
		if (cdt == null)
		{
			SqlDB db = new SqlDB();
			db.SqlString = "select * from gcms_channel where channelstate=0 order by channelindex";
			cdt = db.GetDataTable();
		}
		return cdt;
	}
	
	//读取状态
	private string GetLowstRight(string CidStr)
		{
			SqlDB db = new SqlDB();
			db.SqlString = "SELECT ChannelAdmin FROM gcms_Channel WHERE ChannelCode='"+CidStr+"'";
			DataTable dt = db.GetDataTable();
			if(dt.Rows.Count>0)
			{
				db.SqlString = "SELECT * FROM gcms_RightItem WHERE RightCode='"+dt.Rows[0][0].ToString()+"' ORDER BY RightItemPosition";
				dt = db.GetDataTable();
				if(dt.Rows.Count>0)
					return dt.Rows[0]["RightItemCode"].ToString();
				else
					return "-1";
			}else
				return "-1";
		}
	
	/*private string GetChannelName(string iChannelCode)
	{
		DataRow[] drs = GetChannels().Select("channelcode="+iChannelCode.ToString());
		if (drs.Length>0)
		{
			return drs[0]["ChannelName"].ToString().Insert(1," ").Insert(3," ").Insert(6," ");
		}
		else
		{
			return "";
		}
	}*/
	private string GetChannelName(string iChannelCode)
	{
		DataRow[] drs = GetChannels().Select("channelcode="+iChannelCode.ToString());
		if (drs.Length>0)
		{
			return drs[0]["ChannelName"].ToString();
		}
		else
		{
			return "";
		}
	}
	
	private string GetChannelDataTableName(string iChannelCode)
	{
		DataRow[] drs = GetChannels().Select("channelcode="+iChannelCode.ToString());
		if (drs.Length>0)
		{
			return drs[0]["datatablename"].ToString();
		}
		else
		{
			return "";
		}
	}
	
	private int GetArticleCount(string iChannelCode)
	{
		SqlDB db = new SqlDB();
		db.SqlString = "select CHCode from "+GetChannelDataTableName(iChannelCode)+" where CHState=0";
		return db.GetDataTable().Rows.Count;
	}
	
	private string GetArticleCount2(string iChannelCode, string iArticleCode)
	{
		SqlDB db = new SqlDB();
		db.SqlString = "select COUNT(RLogCode) from gcms_ReadLog where ChannelCode=" + iChannelCode + " AND ArticleCode=" + iArticleCode;
		return db.GetDataTable().Rows[0][0].ToString();
	}
	
	private DataTable GetPicList(int nc,string cid)
	{
		DataTable dt,idt;
		SqlDB db = new SqlDB();
		if (nc!=0)
			db.SqlString = "select top "+nc.ToString()+" CHTopic as imgstr,"+cid+",chcode,CHTopic,fld_"+cid+"_10 from "+GetChannelDataTableName(cid)+" where CHState=0 order by chputdate desc";
		else
			db.SqlString = "select  CHTopic as imgstr,"+cid+",chcode,CHTopic,fld_"+cid+"_10 from "+GetChannelDataTableName(cid)+" where CHState=0 order by chputdate desc";
		dt = db.GetDataTable();
		foreach(DataRow dr in dt.Rows)
		{
			string[] imgs = dr["fld_"+cid+"_10"].ToString().Split(';');
			if(imgs.Length>0 && imgs[0].Trim().Length>0)
			{
				db.SqlString = "select * from gcms_Attachments where AttachmentsCode="+imgs[0];				
				idt = db.GetDataTable();
				if(idt.Rows.Count>0)
				{
					if(Convert.ToInt32(idt.Rows[0]["AttachmentsType"])==1)						
						dr["imgstr"] = idt.Rows[0]["AttachmentsName"].ToString()+idt.Rows[0]["AttachmentsExtName"].ToString();	
					else
						dr["imgstr"] = idt.Rows[0]["AttachmentsName"].ToString();			
				}			
			}		
		}			
		return dt;		
	}
	
	private DataTable GetPicList2(int nc,string cid)
	{
		DataTable dt,idt;
		SqlDB db = new SqlDB();
		db.SqlString = "select  CHTopic,cast(datepart(year,chputdate) as varchar(50))+'-'+cast(datepart(month,chputdate) as varchar(50))+'-'+cast(datepart(day,chputdate) as varchar(50)) as chputdate,fld_"+cid+"_10 as imgstr,fld_"+cid+"_10 from "+GetChannelDataTableName(cid)+" where CHcode="+id;
		dt = db.GetDataTable();
		foreach(DataRow dr in dt.Rows)
		{
			string[] imgs = dr["fld_"+cid+"_10"].ToString().Split(';');
			if(imgs.Length>0 && imgs[0].Trim().Length>0)
			{
				db.SqlString = "select * from gcms_Attachments where AttachmentsCode="+imgs[0];				
				idt = db.GetDataTable();
				if(idt.Rows.Count>0)
				{
					if(Convert.ToInt32(idt.Rows[0]["AttachmentsType"])==1)						
						dr["imgstr"] = idt.Rows[0]["AttachmentsName"].ToString()+idt.Rows[0]["AttachmentsExtName"].ToString();	
					else
						dr["imgstr"] = idt.Rows[0]["AttachmentsName"].ToString();			
				}			
			}		
		}			
		return dt;		
	}
	
	private DataTable GetPicList3(int nc,string cid)
	{
		DataTable dt,idt;
		SqlDB db = new SqlDB();
		db.SqlString = "select top 1 fld_"+cid+"_10 as imgstr,fld_"+cid+"_10 from "+GetChannelDataTableName(cid)+" where chstate=0 order by chputdate desc";
		dt = db.GetDataTable();
		foreach(DataRow dr in dt.Rows)
		{
			string[] imgs = dr["fld_"+cid+"_10"].ToString().Split(';');
			if(imgs.Length>0 && imgs[0].Trim().Length>0)
			{
				db.SqlString = "select * from gcms_Attachments where AttachmentsCode="+imgs[0];			
				idt = db.GetDataTable();
				if(idt.Rows.Count>0)
				{
					if(Convert.ToInt32(idt.Rows[0]["AttachmentsType"])==0)						
						dr["imgstr"] = "/gcms/common/getfile.aspx?file="+idt.Rows[0]["AttachmentsName"].ToString();	
					else
						dr["imgstr"] = idt.Rows[0]["AttachmentsName"].ToString();			
				}			
			}		
		}			
		return dt;		
	}
	
	private DataTable GetDataSql(int nc,string cid)
	{
		SqlDB db = new SqlDB();
		DataTable dt,dtt;
		DataTable ndt = new DataTable();
		ndt.Columns.Add("chid");
		ndt.Columns.Add("chcode");
		ndt.Columns.Add("chtopic");
		ndt.Columns.Add(new DataColumn("CHPutDate",typeof(DateTime)));
		db.SqlString = "Select * from Gcms_Channel Where ChannelUpperCode="+cid+" and ChannelState=0 order by ChannelIndex Asc";
		dt = db.GetDataTable();
		foreach(DataRow idr in dt.Rows){
			db.SqlString = "select top "+nc.ToString()+" "+idr["ChannelCode"].ToString()+",Chcode,Chtopic,CHPutDate from  "+GetChannelDataTableName(idr["channelcode"].ToString())+" where CHState=1 order by CHPutDate Desc";
			dtt = db.GetDataTable();
			foreach(DataRow iddr in dtt.Rows){
				ndt.Rows.Add(iddr.ItemArray);
			}
		}
		DataRow[] idrs = ndt.Select("","CHPutDate desc");
			DataTable idt2 = new DataTable();						
			idt2.Columns.Add("chid");
			idt2.Columns.Add("chcode");
			idt2.Columns.Add("chtopic");		
			idt2.Columns.Add("CHPutDate");
			foreach(DataRow dr in idrs){
				idt2.Rows.Add(dr.ItemArray);
			}
		return idt2;
	}
	//去单引号、分号
	private string ChStr(string rawstr){
		return rawstr.Trim().Replace("\'","").Replace(";","");
	}
	
	private void SetFilter(ListControl _lc,string vstr)
{
	foreach(ListItem _li in _lc.Items)
	{
		if(_li.Value == vstr)
		{
			_li.Selected = true;
		}
		else
		{
			_li.Selected = false;
		}
	}
}
	
//读取排序字段；
private string ChSortField(string cid){
			SqlDB db = new SqlDB();
			DataTable dt,dtt;					
			db.SqlString = "select * from Gcms_Field where ChannelCode="+cid+" ";
			dt=db.GetDataTable();
			string FieldSort="";	
			foreach(DataRow dr in dt.Rows){				
				if(dr["FieldLinagable"].ToString().ToLower()=="true") {
					if(dr["FieldRulable"].ToString().ToLower()=="true")
						FieldSort  += dr["FieldName"].ToString()+" Desc,";
					else
						FieldSort  += dr["FieldName"].ToString()+" Asc,";
				}
			}
			if (FieldSort=="") FieldSort=" chputdate desc,";
	return FieldSort.ToString().Trim(',');
}
//读关健字字段；
private int GetField(string cid,string fldstr){
			SqlDB db = new SqlDB();
			DataTable dt,dtt;					
			db.SqlString = "select * from Gcms_Field where ChannelCode="+cid+" and FieldName='"+fldstr+"'";			
	return db.GetDataTable().Rows.Count;
}

//上传附件
	public string UploadFile(HtmlInputFile file){
			if (file.PostedFile.FileName.Trim().Length != 0)
			{
				try
				{
					System.Web.HttpPostedFile oFile = file.PostedFile ;
					System.DateTime N = System.DateTime.Now;
					System.Random R = new Random();
					string AttachmentsName,AttachmentsExt;
					AttachmentsName = N.Year.ToString()+N.Month.ToString()+N.Day.ToString()+N.Hour.ToString()+N.Minute.ToString()+N.Second.ToString()+R.Next();
					AttachmentsExt = System.IO.Path.GetExtension(oFile.FileName);
					string sFileURL  = System.Configuration.ConfigurationSettings.AppSettings["ATT_DIRECTORY"] + AttachmentsName + AttachmentsExt;
					string sFilePath = Server.MapPath(sFileURL) ;
					oFile.SaveAs(sFilePath);					
					SqlDB db = new SqlDB();
					db.SqlString = "Insert into gcms_Attachments(AttachmentsType,AttachmentsName,AttachmentsExtName,AttachmentsDesc,AttachmentsUploadDate) ";
					db.SqlString += "values(1,'"+AttachmentsName+"','"+AttachmentsExt.ToLower()+"','"+AttachmentsName+"','"+System.DateTime.Today+"');SELECT @@IDENTITY AS 'AttachmentsCode'";
					DataTable dt = db.GetDataTable();
					if(dt.Rows.Count>0){
						return dt.Rows[0][0].ToString()+";";
					}else{
						return "";
					}
				}
				catch{
					return "";
				}
			}else{
				return "";
			}
        }
        
  	
	private string GetTopChannel(string cid,string levelid){
		return GetUpChannel(cid,levelid);
	}
	//通过迭代往上找，找到ChannelLevel=2后停止
	private string GetUpChannel(string cid,string levelid)
	{
		DataRow[] drs = GetChannels().Select("ChannelCode='"+cid+"'");
		if(drs.Length>0)
		{			
			if(drs[0]["ChannelLevel"].ToString() == levelid)
				return cid;
			else
				return GetUpChannel(drs[0]["ChannelUpperCode"].ToString(),levelid);
		}
		else
			return "";
	}

//读取文章图片
private DataTable GetPicPath(string cid,int rowcount)	//rowcount=0 返回所有行
{
	DataTable dt,idt;
	SqlDB db = new SqlDB();	
	if (rowcount > 0)
	{
		db.SqlString = "select top "+rowcount+" "+cid+",chcode,'' as imgstr,"+cid+",chcode,chtopic,chcontent from "+GetChannelDataTableName(cid)+" where CHState=1 order by "+ChSortField(cid)+"";
	}
	else
	{
		db.SqlString = "select "+cid+",chcode,'' as imgstr,"+cid+",chcode,chtopic,chcontent from "+GetChannelDataTableName(cid)+" where CHState=1 order by "+ChSortField(cid)+"";
	}
	dt = db.GetDataTable();
	foreach(DataRow dr in dt.Rows)
	{
		string tempStr = dr["chcontent"].ToString();
		if (tempStr.IndexOf("_nail")<0)
		{
			if(tempStr.IndexOf("UserImages")>0)
			{
				int i = tempStr.IndexOf("UserImages");
				int j=tempStr.IndexOf(".",i);
				dr["chcontent"]=tempStr.Insert(j,"_nail");
			}
			else if(tempStr.IndexOf("getfile.aspx")>0)
			{
				int i = tempStr.IndexOf("src");
				int j=tempStr.IndexOf("width",i);
				dr["chcontent"]=tempStr.Insert(j-2,"_nail");
			}
		}

	}
	return dt;
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
	
//读取排序字段；
	private string GetSortField(string cid){
				SqlDB db = new SqlDB();
				DataTable dt,dtt;					
				db.SqlString = "select * from Gcms_Field where ChannelCode="+cid+" and FieldLinagable=1 ";
				dt=db.GetDataTable();
				string FieldSort="";	
				foreach(DataRow dr in dt.Rows){	
					if(dr["FieldRulable"].ToString().ToLower()=="true")
						FieldSort  += dr["FieldName"].ToString()+" Desc,";
					else
						FieldSort  += dr["FieldName"].ToString()+" Asc,";
					
				}
				if (FieldSort=="") FieldSort=" chputdate desc,";
		return " order by "+FieldSort.ToString().Trim(',');
	}

	private string GetXXGKStrByID(string cid){
	    string str="";
        switch(cid)
		{
		    case "994":
		        str="建设项目环境影响评价受理信息公示";
		        break;
		    case "995":
		        str="建设项目环境影响评价拟审批公示";
		        break;
		    case "996":
		        str="建设项目环境影响评价审批决定公告";
		        break;
		    case "997":
		        str="建设项目竣工环境保护验收受理信息公示";
		        break;
		    case "998":
		        str="建设项目竣工环境保护验收拟审批公示";
		        break;
		    case "999":
		        str="建设项目竣工环境保护验收审批决定公告";
		        break;
		}
	    return str;
	}
	private DataTable GetExactTable(string cid){
	    string wherestr = "";
	    string selectstr = "";
	    switch(cid)
		{
		    case "994":
		        wherestr=" and GONGSHITYPE = '环评受理情况' ";
		        selectstr = "SUBJECT,ADDRESS,BUILDERUNIT,APPLYITEM,HPUNIT,convert(varchar(10),GONGSHIBEGINDATE,120) as begindate,convert(varchar(10),GONGSHIENDDATE,120) as enddate,case when getdate()>GONGSHIENDDATE then '已失效' else '公示中' end as gkstatus,ATTACH_1";
		        break;
		    case "995":
		        wherestr=" and GONGSHITYPE = '拟作出审批意见情况' ";
		        selectstr = "SUBJECT,ADDRESS,BUILDERUNIT,HPUNIT,convert(varchar(10),GONGSHIBEGINDATE,120) as begindate,convert(varchar(10),GONGSHIENDDATE,120) as enddate,PRJPROFILE,PRJCS,CANYUQINGKUANG,ATTACH_3,SHENPIJD,YUANYIN,case when getdate()>GONGSHIENDDATE then '已失效' else '公示中' end as gkstatus";
		        break;
		    case "996":
		        wherestr=" and GONGSHITYPE = '环评项目公告' ";
		        selectstr = "SUBJECT,ADDRESS,BUILDERUNIT,HPUNIT,PIWENNAME,PIWNENO,convert(varchar(10),PIWENDATE,120) as PIWENDATE,ATTACH_4,convert(varchar(10),GONGSHIBEGINDATE,120) as begindate,convert(varchar(10),GONGSHIENDDATE,120) as enddate";
		        break;
		    case "997":
		        wherestr=" and GONGSHITYPE = '验收受理情况' ";
		        selectstr = "SUBJECT,ADDRESS,BUILDERUNIT,HPCHECKACCEPTUNIT,convert(varchar(10),GONGSHIBEGINDATE,120) as begindate,convert(varchar(10),GONGSHIENDDATE,120) as enddate,case when getdate()>GONGSHIENDDATE then '已失效' else '公示中' end as gkstatus,ATTACH_1";
		        break;
		    case "998":
		        wherestr=" and GONGSHITYPE = '拟作出审批意见情况' ";
		        selectstr = "SUBJECT,ADDRESS,BUILDERUNIT,HPCHECKACCEPTUNIT,convert(varchar(10),GONGSHIBEGINDATE,120) as begindate,convert(varchar(10),GONGSHIENDDATE,120) as enddate,CANYUQINGKUANG,SHENPIJD,YUANYIN,case when getdate()>GONGSHIENDDATE then '已失效' else '公示中' end as gkstatus,ATTACH_2";
		        break;
		    case "999":
		        wherestr=" and GONGSHITYPE = '验收项目公告' ";
		        selectstr = "SUBJECT,ADDRESS,BUILDERUNIT,HPCHECKACCEPTUNIT,PIWENNAME,PIWNENO,PIWENDATE,ATTACH_4,convert(varchar(10),GONGSHIBEGINDATE,120) as begindate,convert(varchar(10),GONGSHIENDDATE,120) as enddate";
		        break;
		}
        SqlDB db = new SqlDB();
        db.SqlString = string.Format("select {0} from sync_xxgk where 1=1 {1};",selectstr,wherestr);
        return db.GetDataTable();
	}
	private string GetAttachmentPath(string filename)
	{
	    string file="-";
	    if(!string.IsNullOrEmpty(filename))
        {
            file=string.Format("{0}/{1}", FilePath, filename);
        }
        return file;
	}
	private string GetDataTabeContent(string cid){
	    StringBuilder sb = new StringBuilder();
        DataTable dt = GetExactTable(cid);
        if (dt.Rows.Count>0)
        {
            foreach(DataRow dr in dt.Rows)
            {
                sb.Append("<tr class=\"bg_01\">");
                if(cid=="994")
                {

                    sb.Append(string.Format("<td class=\"txt_02\"><a target=\"_blank\" href=\"{8}\">{0}</a></td><td class=\"txt_02\">{1}</td><td class=\"txt_02\">{2}</td><td class=\"txt_02\">{3}</td><td class=\"txt_02\">{4}</td><td class=\"txt_02\">{5}~{6}</td><td class=\"txt_02\">{7}</td>",
                    dr["SUBJECT"].ToString(), dr["ADDRESS"].ToString(), dr["BUILDERUNIT"].ToString(), dr["APPLYITEM"].ToString(), dr["HPUNIT"].ToString(), dr["begindate"].ToString(), dr["enddate"].ToString(), dr["gkstatus"].ToString(), GetAttachmentPath(dr["ATTACH_1"].ToString())));
                }
                else if (cid=="995")
                {
                    sb.Append(string.Format("<td class=\"txt_02\">{0}</td><td class=\"txt_02\">{1}</td><td class=\"txt_02\">{2}</td><td class=\"txt_02\">{3}</td><td class=\"txt_02\">{4}~{5}</td><td class=\"txt_02\">{6}</td><td class=\"txt_02\">{7}</td><td class=\"txt_02\"><a target=\"_blank\" href=\"{12}\">点击查看</a></td><td class=\"txt_02\">{8}</td><td class=\"txt_02\">{9}</td><td class=\"txt_02\">{10}&nbsp;</td><td class=\"txt_02\">{11}</td>",
                    dr["SUBJECT"].ToString(), dr["ADDRESS"].ToString(), dr["BUILDERUNIT"].ToString(),dr["HPUNIT"].ToString(), dr["begindate"].ToString(),dr["enddate"].ToString(),dr["PRJPROFILE"].ToString(),dr["PRJCS"].ToString(),dr["CANYUQINGKUANG"].ToString(),dr["SHENPIJD"].ToString(),dr["YUANYIN"].ToString(),dr["gkstatus"].ToString(), GetAttachmentPath(dr["ATTACH_3"].ToString())));
                }
                else if (cid=="996")
                {
                    sb.Append(string.Format("<td class=\"txt_02\">{0}</td><td class=\"txt_02\">{1}</td><td class=\"txt_02\">{2}</td><td class=\"txt_02\">{3}</td><td class=\"txt_02\">{4}</td><td class=\"txt_02\">{5}</td><td class=\"txt_02\">{6}</td><td class=\"txt_02\"><a target=\"_blank\" href=\"{9}\">点击查看</a></td><td class=\"txt_02\">{7}~{8}</td>",
                    dr["SUBJECT"].ToString(), dr["ADDRESS"].ToString(), dr["BUILDERUNIT"].ToString(),dr["HPUNIT"].ToString(),dr["PIWENNAME"].ToString(), dr["PIWNENO"].ToString(), dr["PIWENDATE"].ToString(),dr["begindate"].ToString(),dr["enddate"].ToString(), GetAttachmentPath(dr["ATTACH_4"].ToString())));
                }
                else if (cid=="997")
                {
                    sb.Append(string.Format("<td class=\"txt_02\"><a target=\"_blank\" href=\"{7}\">{0}</a></td><td class=\"txt_02\">{1}</td><td class=\"txt_02\">{2}</td><td class=\"txt_02\">{3}</td><td class=\"txt_02\">{4}~{5}</td><td class=\"txt_02\">{6}</td>",
                        dr["SUBJECT"].ToString(), dr["ADDRESS"].ToString(), dr["BUILDERUNIT"].ToString(),dr["HPCHECKACCEPTUNIT"].ToString(),dr["begindate"].ToString(),dr["enddate"].ToString(),dr["gkstatus"].ToString(), GetAttachmentPath(dr["ATTACH_1"].ToString())));
                }
                else if (cid=="998")
                {
                    sb.Append(string.Format("<td class=\"txt_02\">{0}</td><td class=\"txt_02\">{1}</td><td class=\"txt_02\">{2}</td><td class=\"txt_02\">{3}</td><td class=\"txt_02\">{4}~{5}</td><td class=\"txt_02\">{6}&nbsp;</td><td class=\"txt_02\"><a target=\"_blank\" href=\"{10}\">点击查看</a></td><td class=\"txt_02\">{7}&nbsp;</td><td class=\"txt_02\">{8}&nbsp;</td><td class=\"txt_02\">{9}</td>",
                    dr["SUBJECT"].ToString(), dr["ADDRESS"].ToString(), dr["BUILDERUNIT"].ToString(),dr["HPCHECKACCEPTUNIT"].ToString(),dr["begindate"].ToString(),dr["enddate"].ToString(),dr["CANYUQINGKUANG"].ToString(),dr["SHENPIJD"].ToString(),dr["YUANYIN"].ToString(),dr["gkstatus"].ToString(), GetAttachmentPath(dr["ATTACH_2"].ToString())));
                }
                else if (cid=="999")
                {
                    sb.Append(string.Format("<td class=\"txt_02\">{0}</td><td class=\"txt_02\">{1}</td><td class=\"txt_02\">{2}</td><td class=\"txt_02\">{3}</td><td class=\"txt_02\">{4}</td><td class=\"txt_02\">{5}</td><td class=\"txt_02\">{6}</td><td class=\"txt_02\"><a target=\"_blank\" href=\"{9}\">点击查看</a></td><td class=\"txt_02\">{7}~{8}</td>",
                    dr["SUBJECT"].ToString(), dr["ADDRESS"].ToString(), dr["BUILDERUNIT"].ToString(),dr["HPCHECKACCEPTUNIT"].ToString(),dr["PIWENNAME"].ToString(),dr["PIWNENO"].ToString(),dr["PIWENDATE"].ToString(),dr["begindate"].ToString(),dr["enddate"].ToString(), GetAttachmentPath(dr["ATTACH_4"].ToString())));
                }
                sb.Append("</tr>");
            }
        }


	    return sb.ToString();
	}
	private string GetDataTableHeaderStr(string cid)
	{
	     string str="";
        switch(cid)
		{
		    case "994":
		        str="<td width=\"144\" class=\"txt_01\">项目名称</td><td width=\"130\" class=\"txt_01\">建设地点</td><td width=\"70\" class=\"txt_01\">建设单位</td><td class=\"txt_01\">环评形式</td><td width=\"82\" class=\"txt_01\">环境影响评价机构</td><td width=\"88\" class=\"txt_01\">公示时间</td><td width=\"66\" class=\"txt_01\">公示状态</td>";
		        break;
		    case "995":
		        str="<td width=\"40\" class=\"txt_01\">项目名称</td><td width=\"63\" class=\"txt_01\">建设地点</td><td width=\"26\" class=\"txt_01\">建设单位</td><td width=\"35\" class=\"txt_01\">环境影响评价机构</td><td class=\"txt_01\">公示时间</td><td width=\"93\" class=\"txt_01\">建设项目概况</td><td width=\"51\" class=\"txt_01\">主要环境影响及预防或者减轻不良环境影响的对策和措施</td><td width=\"75\" class=\"txt_01\">公众参与情况</td><td width=\"51\" class=\"txt_01\">建设单位或地方政府所作出的相关环境保护措施承诺文件</td><td width=\"24\" class=\"txt_01\">拟作出的审批决定</td><td width=\"24\" class=\"txt_01\">拟不予批准的原因</td><td width=\"32\" class=\"txt_01\">公示状态</td>";
		        break;
		    case "996":
		        str="<td class=\"txt_01\">项目名称</td><td class=\"txt_01\">建设地点</td><td class=\"txt_01\">建设单位</td><td class=\"txt_01\">环境影响评价机构</td><td class=\"txt_01\">批文名称</td><td class=\"txt_01\">批文号码</td><td class=\"txt_01\">批文时间</td><td class=\"txt_01\">批文内容</td><td class=\"txt_01\">公告时间</td>";
		        break;
		    case "997":
		        str="<td width=\"144\" class=\"txt_01\">项目名称</td><td width=\"130\" class=\"txt_01\">建设地点</td><td width=\"70\" class=\"txt_01\">建设单位</td><td width=\"82\" class=\"txt_01\">验收监测（调查）单位</td><td width=\"88\" class=\"txt_01\">公示时间</td><td width=\"66\" class=\"txt_01\">公示状态</td>";
		        break;
		    case "998":
		        str="<td width=\"144\" class=\"txt_01\">项目名称</td><td width=\"130\" class=\"txt_01\">建设地点</td><td width=\"70\" class=\"txt_01\">建设单位</td><td width=\"82\" class=\"txt_01\">验收监测（调查）单位</td><td width=\"43\" class=\"txt_01\">公示时间</td><td width=\"44\" class=\"txt_01\">环保措施落实情况</td><td width=\"88\" class=\"txt_01\">公众参与情况</td><td width=\"88\" class=\"txt_01\">拟做出的审批决定</td><td width=\"88\" class=\"txt_01\">拟验收不合格原因</td><td width=\"66\" class=\"txt_01\">公示状态</td>";
		        break;
		    case "999":
		        str="<td width=\"144\" class=\"txt_01\">项目名称</td><td width=\"130\" class=\"txt_01\">建设地点</td><td width=\"70\" class=\"txt_01\">建设单位</td><td width=\"82\" class=\"txt_01\">验收监测（调查）单位</td><td width=\"43\" class=\"txt_01\">批文名称</td><td width=\"44\" class=\"txt_01\">批文号码</td><td width=\"88\" class=\"txt_01\">批文时间</td><td width=\"88\" class=\"txt_01\">批文内容</td><td width=\"88\" class=\"txt_01\">公告日期</td>";
		        break;
		}
	    return str;
	}

</script>
