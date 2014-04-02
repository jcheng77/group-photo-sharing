
window.onload=function(){
var imageList=new Array();
var local=document.location.origin;
var imageList2=document.getElementsByClassName('item');
var container = document.getElementById('container');
var html=[];
this.listNum=0;
$.ajax({
        type : "get", 
        async:false,
        url : local, 
        dataType : "json",
        success : function(json){ 
            for(var i=0;i<json.length;i++){
                console.log(json);
                console.log(json[i]);
                 imageList.push(json[i]);
            }
        }
    });
var hrefInsert="<a href='"+local+"/albums/";
var divString="<div style='width:100%;height:429px;position:relative;'>";
var divP1String="<div class='p1'>";
var divP2String="<div class='p2'>";
var divP3String="<div class='p3'>";
imageList.unshift("");
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
            case 1: container.innerHTML+=renderhtml_IV(this.listNum,html,imageList);
                    break;
		}
	}
 else{
	container.innerHTML+=renderhtml(this.listNum,html,imageList);
	container.innerHTML+=renderhtml_II(this.listNum,html,imageList);
    container.innerHTML+=renderhtml_III(this.listNum,html,imageList);
}
 }
function renderhtml_IV(listNum,html,imageList){
inserthtml= html+divString+divP2String+
"<figure>"+hrefInsert+imageList[this.listNum+1].id+"/photos'>"+
  "<img class='image' src='"+imageList[listNum+1].cover_url+"'></a></figure>"+
  "<header><h1>"+imageList[this.listNum+1].title+"<h1></header></div></div>";
this.listNum=listNum+1;
return inserthtml;
}
function renderhtml(listNum,html,imageList){
inserthtml= html+divString+divP1String+
"<figure>"+hrefInsert+imageList[this.listNum+1].id+"/photos'>"+
   "<img class='image' src='"+imageList[this.listNum+1].cover_url+"'></a></figure>"+
   "<header><h1>"+imageList[this.listNum+1].title+"</h1></header></div>"+divP2String+
"<figure>"+hrefInsert+imageList[this.listNum+2].id+"/photos'>"+
   "<img class='image' src='"+imageList[this.listNum+2].cover_url+"'></a></figure>"+
   "<header><h1>"+imageList[this.listNum+2].title+"</h1></header></div>"+divP1String+
"<figure>"+hrefInsert+imageList[this.listNum+3].id+"/photos'>"+
   "<img class='image' src='"+imageList[this.listNum+3].cover_url+"'></a></figure>"+
   "<header><h1>"+imageList[this.listNum+3].title+"</h1></header></div></div>";
this.listNum=listNum+3;
return inserthtml;
}

function renderhtml_II(listNum,html,imageList){
/*imageList[this.listNum+1].style.height='187px';
imageList[this.listNum+2].style.height='187px';*/
inserthtml= html+divString+divP1String+divP3String+
"<figure>"+hrefInsert+imageList[this.listNum+1].id+"/photos'>"+
   "<img class='imageH' src='"+imageList[this.listNum+1].cover_url+"'></a></figure>"+
   "<header class='headerH'><h1>"+imageList[this.listNum+1].title+"</h1></header></div>"+divP3String+
"<figure>"+hrefInsert+imageList[this.listNum+2].id+"/photos'>"+
   "<img class='imageH' src='"+imageList[this.listNum+2].cover_url+"'></a></figure>"+
   "<header class='headerH'><h1>"+imageList[this.listNum+2].title+"</h1></header></div></figure></div>"+divP2String+
"<figure>"+hrefInsert+imageList[this.listNum+3].id+"/photos'>"+
   "<img class='image' src='"+imageList[this.listNum+3].cover_url+"'></a></figure>"+
   "<header><h1>"+imageList[this.listNum+3].title+"</h1></header></div>"+divP1String+
"<figure>"+hrefInsert+imageList[this.listNum+4].id+"/photos'>"+
  "<img class='image' src='"+imageList[this.listNum+4].cover_url+"'></a></figure>"+
  "<header><h1>"+imageList[this.listNum+4].title+"</h1></header></div></div>";
this.listNum=listNum+4;
return inserthtml;
}
function renderhtml_III(listNum,html,imageList){
inserthtml= html+divString+divP2String+
"<figure>"+hrefInsert+imageList[this.listNum+1].id+"/photos'>"+
   "<img class='image' src='"+imageList[listNum+1].cover_url+"'></a></figure>"+
   "<header><h1>"+imageList[this.listNum+1].title+"</h1></header></div>"+divP2String+
"<figure>"+hrefInsert+imageList[this.listNum+2].id+"/photos'>"+
   "<img class='image' src='"+imageList[listNum+2].cover_url+"'></a></figure>"+
   "<header><h1>"+imageList[this.listNum+2].title+"</h1></header></div></div>";this.listNum=listNum+2;
this.listNum=listNum+2;
return inserthtml;
}


  
};







