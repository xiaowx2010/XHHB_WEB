<script language="c#" runat="server">
//����
		private string GetDate(){
			System.DateTime T = System.DateTime.Now;
			return T.Year.ToString()+"��"+T.Month.ToString()+"��"+T.Day.ToString()+"��"+"&nbsp;&nbsp;����"+ToCNDOW(T.DayOfWeek.ToString())+"";
		}
		private string ToCNDOW(string endow)
		{
			switch(endow)
			{
				case "Monday":
					return "һ";
					break;
				case "Tuesday":
					return "��";
					break;
				case "Wednesday":
					return "��";
					break;
				case "Thursday":
					return "��";
					break;
				case "Friday":
					return "��";
					break;
				case "Saturday":
					return "��";
					break;
				case "Sunday":
					return "��";
					break;
				default:
					return "";
					break;
			}
		}
</script>

<%=GetDate()%>