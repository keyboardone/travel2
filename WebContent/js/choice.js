window.onload=function(){
	oUl=document.getElementById("nav");
	aLi=oUl.getElementsByTagName("li");
	oDiv=document.getElementById("content");
	oD=oDiv.getElementsByClassName("commom_panel");
	for(var i=0;i<aLi.length;i++){
		aLi[i].index=i;
		aLi[i].onclick=function(){
			for(var i=0;i<aLi.length;i++){
				aLi[i].className="";
				oD[i].style.display="none";
			}
			this.className="active";
			oD[this.index].style.display="block";
		}
	}
}

