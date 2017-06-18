   //document.getElementById("d_book_t1").innerHTML = "1111111111111111111111";
//document.getElementById("gallery1").src = "images/gallery3.jpg";


var indexArr = new Array(20);   
var popularArr = new Array(20);

var indexSale = new Array(20);
var onSaleArr = new Array(20);

//initArrays();

function initArrays()	
{
  for (i = 0; i <20; i++) 
  {
    indexArr[i] = String(i);
    popularArr[i] = String(2);

    indexSale[i] = String(i);
    onSaleArr[i] = String(3);
  }
}

function setPopularArrays(x)
{
  //document.write("setPopularArrays")
  for (i = 0; i <20; i++) 
  {
     var popStr = x[i].getElementsByTagName("popularity")[0].childNodes[0].nodeValue;
     if(popStr == "high")
     {
          popularArr[i] = String(2);
     }
     else
     {
         popularArr[i] = String(0);
     }
  }
}

function setSaleArrays(x)
{
  //document.write("setPopularArrays")
  for (i = 0; i <19; i++) 
  {
     var popStr = x[i].getElementsByTagName("onsale")[0].childNodes[0].nodeValue;
     
	 if(popStr == "high")
     {
          onSaleArr[i] = String(5);
     }
     else
     {
         onSaleArr[i] = String(0);
     }
	 
  }
}


function sortByPopular(i, j)
{
  //alert(arr[j] - arr[i]);
    //return (arr[j] - arr[i]);
    return (popularArr[j] - popularArr[i]);
    //return (j-i);
}

function sortBySale(i, j)
{
  return (onSaleArr[j] - onSaleArr[i]);
}


function loadDoc() {

    //document.getElementById("d_book_t").innerHTML = "hehe";
    //alert("loadDoc");
	
  var xhttp = new XMLHttpRequest();
  //xhttp.setRequestHeader("Cache-Control","no-cache");
  //xhttp.setRequestHeader("If-Modified-Since","0");
  
  
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      myFunction(this);
    }
  };
  //xhttp.open("GET", "books1652.xml"?t=0.1234567890123456, true);
  xhttp.open("GET","books1652.xml?t=" + Math.random(),true);

  xhttp.send();

  }

function myFunction(xml) {
  var i;
  var xmlDoc = xml.responseXML;
  var x = xmlDoc.getElementsByTagName("book");

  //alert("myFunction");
  
//use x get popularity
setPopularArrays(x);
setSaleArrays(x);
indexArr.sort(sortByPopular);
indexSale.sort(sortBySale);
   for (i = 0; i <6; i++) { 
     var string_i = String(parseInt(indexArr[i])+1); 
     var string_sale_i = String(parseInt(indexSale[i])+1); 

     var string_debug = String(indexArr[i]); 
     var string_sale_debug = String(indexSale[i]); 
     
     var poularImage = "images/gallery"+string_i+".jpg";
     var onSaleImage = "images/gallery"+string_sale_i+".jpg";

	 
     if(i == 4)
     {
		 //alert("i=0");
        document.getElementById("d_book_t1").innerHTML = "indexSale[4] = "+string_sale_debug;
        document.getElementById("d_book_t2").innerHTML = onSaleImage;
 
        document.getElementById("d_book_t7").innerHTML = string_sale_debug;
        
     }
/*
    if(i == 1)
     {
        document.getElementById("d_book_t3").innerHTML = string_debug;
        document.getElementById("d_book_t4").innerHTML = poularImage;
 
 document.getElementById("d_book_t8").innerHTML = string_sale_debug;
     }
     if(i == 2)
     {
        document.getElementById("d_book_t5").innerHTML = string_debug;
        document.getElementById("d_book_t6").innerHTML = poularImage;
 
     }
	 */
       //   //alert(string_i);
    //document.getElementById("popular1").src = poularImage;
    document.getElementById("popular"+String(i+1)).src = poularImage;
    document.getElementById("onSale"+String(i+1)).src = onSaleImage;
      //document.getElementById("d_book_t"+string_i).innerHTML = string_i;
    //document.getElementById("popular"+String(i+1)).alt = poularImage;
    //document.getElementById("gallery1").src = "images/gallery2.jpg";
  // //document.getElementById("d_book_t").innerHTML += "hehe";
  // document.getElementById("d_book_desc").innerHTML += x[i].getElementsByTagName("desc")[0].childNodes[0].nodeValue;
  
   }
}

function sortNumber(a, b)
{
return b - a;
}

var arr = new Array(6)
arr[0] = "10"
arr[1] = "5"
arr[2] = "40"
arr[3] = "25"
arr[4] = "1000"
arr[5] = "1"

 //document.write(arr.sort(sortNumber))
 //loadDoc();
 //printRes();
function printRes()
{
 //alert("mad");
document.write(popularArr + "<br />")
document.write(onSaleArr + "<br />")

 document.write(indexArr.sort(sortByPopular)+ "<br />");
document.write(indexSale.sort(sortBySale));
 
}
