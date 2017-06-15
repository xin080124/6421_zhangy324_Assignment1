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
'{ "id":"3	","title":"Divergent","category":"Fiction and Poetry","desc":"A debut novel that will leave you breathless.","popularity":"high","onsale":"high","price":"18.85"},'+
'{ "id":"4","title":"Web Design with HTML, CSS, JavaScript and jQuery Set","category":"Careers","desc":"A two-book set for web designers and front-end developers","popularity":"high","onsale":"high","price":"81.92"},'+
'{ "id":"5","title":"Learning Web Design","category":"Careers","desc":"Everything you need to know to create professional web sites is right here","popularity":"high","onsale":"high","price":"53.2"},'+
'{ "id":"6","title":"The Real Book of Real Estate ","category":"Investing","desc":"written by experts who practice what they teach and who will teach you to thrive, not merely survive, during turbulent economic times","popularity":"high","onsale":"high","price":"25.38"},'+
'{ "id":"7","title":"You Can be a Stock Market Genius","category":"Investing","desc":"A comprehensive and practical guide to the stock market from a successful fund manager--filled","popularity":"high","onsale":"high","price":"20.88"},'+
'{ "id":"8","title":"Rich Dad Poor Dad","category":"Investing","desc":"the #1 Personal Finance book of all time... translated into dozens of languages and sold around the world","popularity":"high","onsale":"high","price":"11.46"},'+
'{ "id":"9","title":"150 Cupcake and Muffin Recipes","category":"Cooking and Food","desc":"This collection of 150 recipes gives you easy step-by-step instructions to make amazing cupcakes and muffins","popularity":"high","onsale":"high","price":"10.47"},'+
'{ "id":"10","title":"150 Student Recipes","category":"Cooking and Food","desc":"This collection of 150 recipes gives you easy step-by-step instructions to make an amazing dish","popularity":"high","onsale":"high","price":"10.31"},'+
'{ "id":"11","title":"Yoga Anatomy","category":"Sports","desc":"This is the ultimate reference for yoga practitioners, instructors and enthusiasts alike! ","popularity":"high","onsale":"high","price":"22.37"},'+
'{ "id":"12","title":"The Floret Farm\'s Cut Flower Garden","category":"Gardening","desc":"a book on how to grow, harvest, and arrange gorgeous blooms year-round","popularity":"high","onsale":"high","price":"33.47"},'+
'{ "id":"13","title":"Power Foods for the Brain","category":"Nutrition","desc":"gathered the most up-to-date research and created a groundbreaking program that can strengthen your memory and protect your brain\'s health","popularity":"high","onsale":"high","price":"18.58"},'+
'{ "id":"14","title":"Dr. Seuss - Yellow Back Book","category":"Education","desc":"In this classic Seussian tale, the good doctor primes his readers against all the little mishaps and misadventures that can befall even the best of us - from bang-ups and hang-ups to lurches and slumps - encouraging us to take life in our stride!","popularity":"high","onsale":"high","price":"11.64"},'+
'{ "id":"15","title":"English Decoration","category":"Interior Design","desc":"The book begins with an essay on the English style in decoration and ends with a style directory","popularity":"high","onsale":"high","price":"46.55"},'+
'{ "id":"16","title":"William Yeoward at Home","category":"Interior Design","desc":"Elegant Living in Town and Country","popularity":"high","onsale":"high","price":"40.45"},'+
'{ "id":"17","title":"The Barefoot Investor ","category":"This book will show you how to create an entire financial plan that is so simple you can sketch it on the back of a serviette","desc":"Business","popularity":"high","onsale":"high","price":"24.64"},'+
'{ "id":"18","title":"Reminiscences of a Stock Operator","category":"A must-read classic for all investors, whether brand-new or experienced","desc":"Business","popularity":"high","onsale":"high","price":"24.64"},'+
'{ "id":"19","title":"The Complete Sherlock Holmes","category":"The eccentric detective Sherlock Holmes with the aid of Dr. Watson investigates strange and baffling mysteries.","desc":"novel","popularity":"low","onsale":"low","price":"23.09"},'+
'{ "id":"20","title":"Steve Jobs: The Exclusive Biography","category":"Biography","desc":"The Book of Jobs, Isaacson provides an extraordinary account of Jobs\' professional and personal life","popularity":"high","onsale":"high","price":"31.35"},'+
']}';

var obj = eval ("(" + txt + ")");

document.getElementById("id").innerHTML=obj.sites[0].id 
document.getElementById("title").innerHTML=obj.sites[0].title
document.getElementById("category").innerHTML=obj.sites[0].category

if (popularity=="high")
{
	for(id=1;id<=20;id++)
}
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
