var popright = 0;
var fgap = 100;
var flstep = 3;
var ftstep = 2;
var swinglist = new Array();
var floatlist = new Array();
window.onscroll = Swing;
window.onresizeend = Swing;
window.onload = Float;

function outer_all(_code,_width,_height,_intpop)
{
	var pop = window.open("pop_float.aspx?code="+_code,"FloatPop"+_code,"height="+_height+",width="+_width+",status=no,toolbar=no,menubar=no,location=no,resizable=no,directories=no,top=0,left=" + _intpop,"");
	pop.focus();
}
function outer_boder(_code,_width,_height)
{
	var pop = window.open("pop_float.aspx?code="+_code,"FloatPop"+_code,"height="+_height+",width="+_width+",status=no,toolbar=no,menubar=no,location=no,resizable=no,directories=no,top=0,left="+popright,"");
	popright += _width+10;
	pop.focus();
}
function outer_moor(_code,_width,_height)
{
	var pop = window.open("pop_float.aspx?code="+_code,"FloatPop"+_code,"height="+_height+",width="+_width+",status=no,toolbar=no,menubar=no,location=no,resizable=no,directories=no,top=0,left="+popright,"");
	popright += _width+10;
	pop.focus();
}
function inner_all(obj,_code,_width,_height,_top,_left)
{
	obj.style.position = "absolute";
	obj.fcount = 0;
	obj.style.pixelLeft = document.body.clientWidth*Math.random();
	obj.style.pixelTop = document.body.clientHeight*Math.random();
	obj.onmouseover = function(){obj.stop = true;};
	obj.onmouseout = function(){obj.stop = false;};
	floatlist.push(obj);
}
function inner_border(obj,_title,_width,_height,_top,_left)
{
	obj.stop = _top;
	obj.sleft = _left;
	obj.style.position = "absolute";
	obj.style.top = obj.stop;
	HSwing(obj,obj.sleft);
	swinglist.push(obj);
}
function inner_moor(obj,_code,_width,_height,_top,_left)
{
	obj.style.position = "absolute";
	obj.fcount = 0;
	obj.style.pixelLeft = document.body.clientWidth*Math.random();
	obj.style.pixelTop = document.body.clientHeight*Math.random();
	floatlist.push(obj);
}
function Swing()
{
	if(swinglist.length>0){
		for(var i=0;i<swinglist.length;i++){
			swinglist[i].style.top = window.document.body.scrollTop + swinglist[i].stop;
			HSwing(swinglist[i],swinglist[i].sleft);
		}
	}
}
function HSwing(obj,_left){
	if(_left<0){
		obj.style.left = window.document.body.clientWidth - obj.offsetWidth;
	}else{
		obj.style.left = _left;
	}
}
function Float()
{
	if(floatlist.length>0){
		for(var i=0;i<floatlist.length;i++){
			if(floatlist[i].fcount>fgap){
				floatlist[i].lstp = (Math.random()>0.5)?1:-1;
				floatlist[i].tstp = (Math.random()>0.5)?1:-1;
				floatlist[i].fcount = 0;
			}
			if(floatlist[i].lstp != null && !floatlist[i].stop){
				var _l = floatlist[i].style.pixelLeft+floatlist[i].lstp*flstep;
				var _t = floatlist[i].style.pixelTop+floatlist[i].tstp*ftstep;
				if(_l<document.body.scrollLeft){_l = document.body.scrollLeft;floatlist[i].lstp = -floatlist[i].lstp;}
				if(_t<document.body.scrollTop){_t = document.body.scrollTop;floatlist[i].tstp = -floatlist[i].tstp;}
				if(_l>(document.body.scrollLeft+document.body.clientWidth-floatlist[i].offsetWidth)){_l = document.body.scrollLeft+document.body.clientWidth-floatlist[i].offsetWidth;floatlist[i].lstp = -floatlist[i].lstp;}
				if(_t>(document.body.scrollTop+document.body.clientHeight-floatlist[i].offsetHeight)){_t = document.body.scrollTop+document.body.clientHeight-floatlist[i].offsetHeight;floatlist[i].tstp = -floatlist[i].tstp;}
				floatlist[i].style.pixelLeft  = _l;
				floatlist[i].style.pixelTop  = _t;
			}
			floatlist[i].fcount ++;
		}
	}
	document.recalc();
	window.setTimeout(Float, 20);
}

