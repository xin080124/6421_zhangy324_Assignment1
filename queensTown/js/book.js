var myObj, x="", i;

//Storing data:
myObj =  [
{ "id":"1" , "title":"Harry potter", "category":"novel", "desc":"story of wizard and his friends","popularity":"1234","onsale":"high","price":"50" },
{ "id":"2" , "title":"Cambridge IELTS 11", "category":"Education", "desc":"Authentic Examination Papers","popularity":"234","onsale":"high","price":"33.99" },
{ "id":"3	","title":"Divergent","category":"Fiction and Poetry","desc":"A debut novel that will leave you breathless.","popularity":"324","onsale":"high","price":"18.85"},
{ "id":"4","title":"Web Design with HTML, CSS, JavaScript and jQuery Set","category":"Careers","desc":"A two-book set for web designers and front-end developers","popularity":"321","onsale":"high","price":"81.92"},
{ "id":"5","title":"Learning Web Design","category":"Careers","desc":"Everything you need to know to create professional web sites is right here","popularity":"233","onsale":"high","price":"53.2"},
{ "id":"6","title":"The Real Book of Real Estate ","category":"Investing","desc":"written by experts who practice what they teach and who will teach you to thrive, not merely survive, during turbulent economic times","popularity":"654","onsale":"high","price":"25.38"},
{ "id":"7","title":"You Can be a Stock Market Genius","category":"Investing","desc":"A comprehensive and practical guide to the stock market from a successful fund manager--filled","popularity":"345","onsale":"high","price":"20.88"},
{ "id":"8","title":"Rich Dad Poor Dad","category":"Investing","desc":"the #1 Personal Finance book of all time... translated into dozens of languages and sold around the world","popularity":"563","onsale":"high","price":"11.46"},
{ "id":"9","title":"150 Cupcake and Muffin Recipes","category":"Cooking and Food","desc":"This collection of 150 recipes gives you easy step-by-step instructions to make amazing cupcakes and muffins","popularity":"786","onsale":"high","price":"10.47"},
{ "id":"10","title":"150 Student Recipes","category":"Cooking and Food","desc":"This collection of 150 recipes gives you easy step-by-step instructions to make an amazing dish","popularity":"1272","onsale":"high","price":"10.31"},
{ "id":"11","title":"Yoga Anatomy","category":"Sports","desc":"This is the ultimate reference for yoga practitioners, instructors and enthusiasts alike! ","popularity":"1463","onsale":"high","price":"22.37"},
{ "id":"12","title":"The Floret Farm\'s Cut Flower Garden","category":"Gardening","desc":"a book on how to grow, harvest, and arrange gorgeous blooms year-round","popularity":"482","onsale":"high","price":"33.47"},
{ "id":"13","title":"Power Foods for the Brain","category":"Nutrition","desc":"gathered the most up-to-date research and created a groundbreaking program that can strengthen your memory and protect your brain\'s health","popularity":"842","onsale":"high","price":"18.58"},
 {"id":"14","title":"Dr. Seuss - Yellow Back Book","category":"Education","desc":"In this classic Seussian tale, the good doctor primes his readers against all the little mishaps and misadventures that can befall even the best of us - from bang-ups and hang-ups to lurches and slumps - encouraging us to take life in our stride!","popularity":"834","onsale":"high","price":"11.64"},
 { "id":"15","title":"English Decoration","category":"Interior Design","desc":"The book begins with an essay on the English style in decoration and ends with a style directory","popularity":"903","onsale":"high","price":"46.55"},
 { "id":"16","title":"William Yeoward at Home","category":"Interior Design","desc":"Elegant Living in Town and Country","popularity":"1843","onsale":"high","price":"40.45"},
 { "id":"17","title":"The Barefoot Investor ","category":"This book will show you how to create an entire financial plan that is so simple you can sketch it on the back of a serviette","desc":"Business","popularity":"560","onsale":"high","price":"24.64"},
 { "id":"18","title":"Reminiscences of a Stock Operator","category":"A must-read classic for all investors, whether brand-new or experienced","desc":"Business","popularity":"224","onsale":"high","price":"24.64"},
 { "id":"19","title":"The Complete Sherlock Holmes","category":"The eccentric detective Sherlock Holmes with the aid of Dr. Watson investigates strange and baffling mysteries.","desc":"novel","popularity":"43","onsale":"low","price":"23.09"},
 { "id":"20","title":"Steve Jobs: The Exclusive Biography","category":"Biography","desc":"The Book of Jobs, Isaacson provides an extraordinary account of Jobs\' professional and personal life","popularity":"84","onsale":"high","price":"31.35"},];

var asc = function(x,y)  
    {  
        return (x.popularity > y.popularity) ? 1 : -1  
    } 
myObj.sort(asc); //升序排序  

for (var i=0;i<5;i++) { 
var myJSON = myObj[i].title+myObj[i].desc;
document.write('<img src="images/book' + i + '.jpg">');
 
document.getElementById("demo").innerHTML += myJSON;
