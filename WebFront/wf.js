
function __doOpenArticle(aim)
{
	//var aim = "pop.aspx?cid="+channelid+"&id="+articleid;
	var dleft = 100,dtop = 0;//window.screenTop + 100,window.screenLeft + ;
	pop = open(aim,"OpenDetail","height=600,width=600,status=no,toolbar=no,menubar=no,location=no,resizable=no,directories=no,top="+dtop+",left="+dleft+"","");
	pop.focus();
}

function __doOpenArticle3(aim)
{
	//var aim = "pop.aspx?cid="+channelid+"&id="+articleid;
	var dleft = 100,dtop = 0;//window.screenTop + 100,window.screenLeft + ;
	pop = open(aim,"OpenDetail","height=500,width=500,status=no,toolbar=no,menubar=no,location=no,resizable=no,directories=no,top="+dtop+",left="+dleft+"","");
	pop.focus();
}

function __doOpenArticle2(aim)
{
	//var aim = "pop.aspx?cid="+channelid+"&id="+articleid;
	var dleft = 100,dtop = 0;//window.screenTop + 100,window.screenLeft + ;
	pop = open(aim,"OpenDetail","height=600,width=600,status=no,toolbar=no,menubar=no,location=no,resizable=no,directories=no,top="+dtop+",left="+dleft+"","");
	pop.focus();
}

function showallcount(c){
	document.all("realcount").innerHTML = "&nbsp;"+c+"&nbsp;";	
}

function ReplaceDemo(con,n){
if(n>1){ 
		document.all(con).innerHTML=document.all(con).innerHTML.replace(/font size=\d/ig,function($0){return "font style='line-height:150%' size="+(parseInt($0.substr(10))*n).toString();});                   // ·µ»ØÌæ»»ºóµÄ×Ö·û´®¡£
	}
}