<%@ Page Language="c#" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.ContentManagement.WebFront" Assembly="Guangye.ContentManagement.FrontModule" %>
<!--#include file="func.aspx"-->
<script runat=server language=C#>
int _ic;
		private void Page_Load(object sender, System.EventArgs e)
		{
			this.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
			Response.ContentEncoding = System.Text.Encoding.UTF8;
			string[] colorstr= new string[]{"FC1402","FC6002","FCBE02","95FC02","02FC78","02B2FC","0208FC","7E02FC","FC02ED","FC0289"};						
			string strSl="",vcode="";				
			if(Session["vcode"]!=null && Session["vcode"].ToString()!=""){
				id=Session["vcode"].ToString();
				SqlDB db=new SqlDB();
					db.SqlString="SELECT VoteName FROM gcms_Vote WHERE VoteCode="+ id +" ";
					if(db.GetDataTable().Rows.Count!=0){
						Response.Write("<graph bgcolor=\"FFFFFF\" xaxisname=\"Ñ¡Ïî\" yaxisname=\""+db.GetDataTable().Rows[0][0].ToString().Trim().Replace("\n","")+"\" caption=\""+db.GetDataTable().Rows[0][0].ToString().Trim().Replace("\n","")+"\" showgridbg=\"1\" numberSuffix=\"Æ±\">");
						db.SqlString= "select top 1 VoteItemCode from gcms_VoteItem where VoteCode=" + id + " ORDER BY VoteItemCount DESC";
						if(db.GetDataTable().Rows.Count!=0)
							vcode=db.GetDataTable().Rows[0][0].ToString();
						db.SqlString= "select VoteItemCount,VoteItemName,VoteItemCode from gcms_VoteItem where VoteCode=" + id + " ORDER BY EditDate DESC";
						DataTable dt=db.GetDataTable();					
						foreach(DataRow dr in dt.Rows){
							if(_ic>colorstr.Length)
								_ic=0;
							else
								_ic++;
							if(dr["VoteItemCode"].ToString()==vcode.ToString())
								strSl=" isSliced=\"1\"";
							else
								strSl="";			
							Response.Write("<set name=\""+dr["VoteItemName"].ToString()+"\" value=\""+dr["VoteItemCount"].ToString()+"\" color=\""+colorstr[_ic]+"\" link=\"\" "+strSl+"/>");
						}
						Response.Write("</graph>");						
					}
			}
			
		}	

</script>

