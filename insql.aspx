<%@ Import Namespace="System.Text" %>
<script runat="server" language="C#">
	
//验证URL参数 
private string GetQueryString(string key,string keyvalue) 
{ 
	string valuestr=(this.Request.QueryString[key] == null) ? keyvalue : this.Request.QueryString[key].Trim(); 
	bool isnum=false; 
	if (valuestr.Length > 0 && valuestr!=keyvalue)//不是默认值 
	{ 
		if (Char.IsNumber(valuestr[0])) 
		{ 
			try 
			{ 
				Convert.ToInt32(valuestr).ToString(); 
				isnum=true; 
			} 
			catch 
			{ 
				try 
				{ 
					Convert.ToDateTime(valuestr); 
					isnum=true; 
				}
				catch 
				{ 
					isnum=false; 
				} 
			} 
		}
		else 
		{ 
			 Regex rt = new Regex(@"script|iframe|\'|;| ", RegexOptions.IgnoreCase);
			 valuestr = rt.Replace(valuestr, "");
			 isnum=true; 
		} 
	} 
	valuestr=(valuestr.Length==0 || !isnum)?keyvalue:valuestr; 
	return valuestr; 
}
//验证URL参数 
private string GetQueryString(string key)
{
	string h_return="";
    if(this.Request.QueryString[key]==null)
    {
		h_return=null;
    }else
    {
		h_return=this.Request.QueryString[key];
		if(h_return.Length>0)
		{			
            Regex rt = new Regex(@"script|iframe|\'|;| ", RegexOptions.IgnoreCase);
			h_return = rt.Replace(h_return, "");
            
		}
    }
    return h_return;
}
</script>