<script language="c#" runat="server">
//日期
		private string GetDate(){
			System.DateTime T = System.DateTime.Now;
			return T.Year.ToString()+"年"+T.Month.ToString()+"月"+T.Day.ToString()+"日"+"&nbsp;&nbsp;星期"+ToCNDOW(T.DayOfWeek.ToString())+"";
		}
		private string ToCNDOW(string endow)
		{
			switch(endow)
			{
				case "Monday":
					return "一";
					break;
				case "Tuesday":
					return "二";
					break;
				case "Wednesday":
					return "三";
					break;
				case "Thursday":
					return "四";
					break;
				case "Friday":
					return "五";
					break;
				case "Saturday":
					return "六";
					break;
				case "Sunday":
					return "日";
					break;
				default:
					return "";
					break;
			}
		}
</script>

<%=GetDate()%>