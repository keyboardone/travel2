window.onload=function(){
	Ndiv=document.getElementById("slider_nav");
	Nul=Ndiv.getElementsByTagName("ul")[0];
	Nli=Nul.getElementsByTagName("li");
	Cdiv=document.getElementById("slider_box");
	Cul=Cdiv.getElementsByTagName("ul")[0];
	Cli=Cul.getElementsByTagName("li");
	for(var i=0;i<Nli.length;i++){
		Nli[i].index=i;
		Nli[i].onmouseover=function(){
			for(var i=0;i<Nli.length;i++){
				Nli[i].className="";
				Cli[i].style.display="none";
			}
			this.className="act";
			Cli[this.index].style.display="block";
		}
	}
	
}
