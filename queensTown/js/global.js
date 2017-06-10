function showItems(){
    var txt = '{ "sites" : [' +
'{ "name":"菜鸟教程" , "url":"www.runoob.com" },' +
'{ "name":"google" , "url":"www.google.com" },' +
'{ "name":"微博" , "url":"www.weibo.com" } ]}';

var obj = eval ("(" + txt + ")");

document.getElementById("name").innerHTML=obj.sites[1].name 
document.getElementById("url").innerHTML=obj.sites[0].url 

}


function showBookItems(){
    var txt = '{ "sites" : [' +
'{ "id":"1" , "title":"Harry potter", "category":"novel", "desc":"story of wizard and his friends","popularity":"high","onsale":"high","price":"50" },'+
'{ "id":"2" , "title":"Cambridge IELTS 11", "category":"Education", "desc":"Authentic Examination Papers","popularity":"middle","onsale":"high","price":"33.99" },'+
'{ "id":"3" , "title":"", "category":"", "desc":"","popularity":"","onsale":"","price":"" },'+
'{ "id":"4" , "title":"", "category":"", "desc":"","popularity":"","onsale":"","price":"" },'+
'{ "id":"5" , "title":"", "category":"", "desc":"","popularity":"","onsale":"","price":"" },'+
'{ "id":"" , "title":"", "category":"", "desc":"","popularity":"","onsale":"","price":"" },'+
'{ "id":"" , "title":"", "category":"", "desc":"","popularity":"","onsale":"","price":"" },'+
 ]}';

var obj = eval ("(" + txt + ")");

document.getElementById("id").innerHTML=obj.sites[0].id 
document.getElementById("title").innerHTML=obj.sites[0].title
document.getElementById("category").innerHTML=obj.sites[0].category
}

function toggle(targetid){

    if(targetid == "all")
    {
        var showItems = new Array('hotel1','hotel2','hotel3','bb1','bb2','bb3','motel1','motel2','lodge1','lodge2');
    }
    else if(targetid == "hotels")
    {
    	var showItems = new Array('hotel1','hotel2','hotel3');
        var hideItems = new Array('bb1','bb2','bb3','motel1','motel2','lodge1','lodge2');
    }
    else if(targetid == "motels")
    {
        var showItems = new Array('motel1','motel2');//if there is no 'bb2',this won't work
        var hideItems = new Array('hotel1','hotel2','hotel3','bb1','bb2','bb3','lodge1','lodge2');	
    }
    else if(targetid == "lodges")
    {
        var showItems = new Array('lodge1','lodge2' );//if there is no 'bb2',this won't work
        var hideItems = new Array('hotel1','hotel2','hotel3','bb1','bb2','bb3','motel1','motel2');  
    }
    else
    {
    	var showItems = new Array('bb1','bb2','bb3');//if there is no 'bb2',this won't work
        var hideItems = new Array('hotel1','hotel2','hotel3','motel1','motel2','lodge1','lodge2');	
    }

    for(var key of showItems){
	    if (document.getElementById){
	        target=document.getElementById(key);
	        target.style.display="block";
	    }	
    }
    
    for(var key of hideItems)
    if (document.getElementById){
        target=document.getElementById(key);
        target.style.display="none";
    }

}
function checkSubmit()
{
    if(false == nameCheck())
    {
        alert("the name should include at least 3 letters");
        return;
    }
    else if(false == SurnameCheck())
    {
        alert("the surname should include at least 5 letters");
        return;    
    }
    else if(false == EmailCheck())
    {
        alert("incorrect email");
        return;    
    }
    else if(false == agreeBoxCheck())
    {
        alert("please agree with the term of service ");
    }
    else 
    {
        alert("submit success");
    }    

 }

function nameCheck()
{
    var values = document.getElementById("name").value.length;
    
    if(values<3)
    {
        return false;
    }
    else
    {
        return true;    
    }
    return true;
 }

 function SurnameCheck()
{
    var values = document.getElementById("surname").value.length;
    if(values<5)
    {
        //alert("the name should include more than 2 letters");
        return false;
    }
    else
    {
        //alert("ok");
        return true;    
    }
    return true;
 }

 function agreeBoxCheck()
{
    if(document.getElementById("checkboxID").checked)
    {
         return true;
    }
    else
    {
         return false;
    }
    
}

function show()
{
    var values = document.getElementById("age").value;
    if(values<0||values>120||values=="")
    {
    alert("xxxx");
    return;
    }else
    {
    alert("xxxx");
    }
 }
function EmailCheck() 
{ 
    var email = document.getElementById("email").value; 
   
    if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) 
    { 
       
        document.getElementById("email").focus(); 
        return false; 
    } 
    return true; 
} 
