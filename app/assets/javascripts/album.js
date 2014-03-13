
window.onload=function(){
var imageList2=document.getElementsByClassName('item');
var imageList=new Array();
imageList.push("");
for(var i=0; i<imageList2.length;i++){
	var temp=imageList2[i];
	if(temp.height!=4576)
	imageList.push(temp);
}

for(var i=1; i<imageList.length;i++){
	imageList[i].style.height="394px";
}
var container = document.getElementById('container');
var html=[];
this.listNum=0;

while(this.listNum+1<imageList.length){
	var flag=imageList.length-this.listNum-1;
	if(flag<9){
		switch(flag){
			case 8: container.innerHTML+=renderhtml_III(this.listNum,html,imageList);
	                container.innerHTML+=renderhtml_II(this.listNum,html,imageList);
	                container.innerHTML+=renderhtml_III(this.listNum,html,imageList);
	                break;
	        case 7: container.innerHTML+=renderhtml_II(this.listNum,html,imageList);
                    container.innerHTML+=renderhtml(this.listNum,html,imageList);
                    break;
            case 6: container.innerHTML+=renderhtml(this.listNum,html,imageList);
                    container.innerHTML+=renderhtml(this.listNum,html,imageList);
                    break;
            case 5: container.innerHTML+=renderhtml_III(this.listNum,html,imageList);
                    container.innerHTML+=renderhtml(this.listNum,html,imageList);
                    break;
            case 4: container.innerHTML+=renderhtml_II(this.listNum,html,imageList);
                    break;
            case 3: container.innerHTML+=renderhtml(this.listNum,html,imageList);
                    break;
            case 2: container.innerHTML+=renderhtml_III(this.listNum,html,imageList);
                    break;
		}
	}
 else{
	container.innerHTML+=renderhtml(this.listNum,html,imageList);
	container.innerHTML+=renderhtml_II(this.listNum,html,imageList);
    container.innerHTML+=renderhtml_III(this.listNum,html,imageList);
}
 }
function renderhtml(listNum,html,imageList){
inserthtml= html+"<div style='width:100%;height:429px'><div class='p1'><figure>"+
imageList[this.listNum+1].outerHTML+"</figure></div><div class='p2'><figure>"+
imageList[this.listNum+2].outerHTML+"</figure></div><div class='p1'><figure>"+
imageList[this.listNum+3].outerHTML+"</figure></div></div>";
this.listNum=listNum+3;
return inserthtml;
}

function renderhtml_II(listNum,html,imageList){
imageList[this.listNum+1].style.height='187px';
imageList[this.listNum+2].style.height='187px';
inserthtml= html+"<div style='width:100%;height:429px'><div class='p1'><div class='p3'><figure>"+
imageList[this.listNum+1].outerHTML+"</figure></div><div class='p3'><figure>"+
imageList[this.listNum+2].outerHTML+"</figure></div></figure></div><div class='p2'><figure>"+
imageList[this.listNum+3].outerHTML+"</figure></div><div class='p1'><figure>"+
imageList[this.listNum+4].outerHTML+"</figure></div></div>";
this.listNum=listNum+4;
return inserthtml;
}
function renderhtml_III(listNum,html,imageList){
inserthtml= html+"<div style='width:100%;height:429px'><div class='p2'><figure>"+
imageList[listNum+1].outerHTML+"</figure></div><div class='p2'><figure>"+
imageList[listNum+2].outerHTML+"</figure></div></div>";
this.listNum=listNum+2;
return inserthtml;
}


  
};







