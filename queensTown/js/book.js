 <script type="text/javascript">
        var objectList = new Array();
        function Book(id,title,category,desc,popularity,onsale,price){
            this.id=id;
            this.title=title;
			this.category=category;
			this.desc=desc;
			this.popularity=popularity;
			this.onsale=onsale;
			this.price=price;
            }
        objectList.push(new Book(1,'Harry potter','novel', 'story of wizard and his friends',1234,'high',50));
        objectList.push(new Book(2,'Cambridge IELTS','Education','Authentic Examination Papers',234,'high',33.99));
        objectList.push(new Book(3,'Divergent','Fiction and Poetry','A debut novel that will leave you breathless.',324,'high',18.85));
        objectList.push(new Book(4,'Web Design with HTML, CSS, JavaScript and jQuery Set','Careers','A two-book set for web designers and front-end developers',321,'high',81.92));
		objectList.push(new Book(5,'Learning Web Design','Careers','Everything you need to know to create professional web sites is right here',2303,'high',53.2));
		objectList.push(new Book(6,'The Real Book of Real Estate','Investing','written by experts who practice what they teach and who will teach you to thrive','not merely survive',' during turbulent economic times',654,'high',25.38));
		objectList.push(new Book(7,'You Can be a Stock Market Genius','Investing','A comprehensive and practical guide to the stock market from a successful fund manager--filled',345,'high',20.88));
		objectList.push(new Book(8,'Rich Dad Poor Dad','Investing','the #1 Personal Finance book of all time... translated into dozens of languages and sold around the world',563,'high',11.46));
		objectList.push(new Book(9,'150 Cupcake and Muffin Recipes','Cooking and Food','This collection of 150 recipes gives you easy step-by-step instructions to make amazing cupcakes and muffins',786,'high',10.47));
		objectList.push(new Book(10,'150 Student Recipes','Cooking and Food','This collection of 150 recipes gives you easy step-by-step instructions to make an amazing dish',1272,'high',10.31));
		objectList.push(new Book(11,'Yoga Anatomy','Sports,This is the ultimate reference for yoga practitioners','instructors and enthusiasts alike!',1463,'high',22.37));
		objectList.push(new Book(12,'The Floret Farm\'s Cut Flower Garden','Gardening','a book on how to grow, harvest, and arrange gorgeous blooms year-round',482,'high',33.47));
		objectList.push(new Book(13,'Power Foods for the Brain','Nutrition','gathered the most up-to-date research and created a groundbreaking program that can strengthen your memory and protect your brain\'s health',842,'high',18.58));
		objectList.push(new Book(14,'Dr. Seuss - Yellow Back Book','Education','In this classic Seussian tale, the good doctor primes his readers against all the little mishaps and misadventures that can befall even the best of us - from bang-ups and hang-ups to lurches and slumps - encouraging us to take life in our stride!',834,'high',11.64));
		objectList.push(new Book(15,'English Decoration','Interior Design','The book begins with an essay on the English style in decoration and ends with a style directory',903,'high',46.55));
		objectList.push(new Book(16,'William Yeoward at Home','Interior Design','Elegant Living in Town and Country',1843,'high',40.45));
		objectList.push(new Book(17,'The Barefoot Investor','Business','This book will show you how to create an entire financial plan that is so simple you can sketch it on the back of a serviette',560,'high',14.64));
		objectList.push(new Book(18,'Reminiscences of a Stock Operator','Business','A must-read classic for all investors, whether brand-new or experienced',224,'high',24.64));
		objectList.push(new Book(19,'The Complete Sherlock Holmes','novel','The eccentric detective Sherlock Holmes with the aid of Dr. Watson investigates strange and baffling mysteries.',43,'low',23.09));
		objectList.push(new Book(20,'Steve Jobs   The Exclusive Biography','Biography','The Book of Jobs, Isaacson provides an extraordinary account of Jobs\' professional and personal life',84,'high',31.35));
        //按年龄从小到大排序
        objectList.sort(function(a,b){
            return b.popularity-a.popularity});
       // for(var i=0;i<objectList.length;i++){
         //   document.writeln('<br />name:'+objectList[i].title+' price:'+objectList[i].price);
			//}
		var book_1_title=objectList[0].title;
			document.getElementById("book_top1_title").innerHTML=book_1_title;
			var book_top1_picture="images/book"+objectList[0].id+".jpg";
			document.getElementById("book_top1_picture").src=book_top1_picture;
		var book_2_title=objectList[1].title;
			document.getElementById("book_top2_title").innerHTML=book_2_title;
			var book_top2_picture="images/book"+objectList[1].id+".jpg";
			document.getElementById("book_top2_picture").src=book_top2_picture;
		var book_3_title=objectList[2].title;
			document.getElementById("book_top3_title").innerHTML=book_3_title;
			var book_top3_picture="images/book"+objectList[2].id+".jpg";
			document.getElementById("book_top3_picture").src=book_top3_picture;
		var book_4_title=objectList[3].title;
			document.getElementById("book_top4_title").innerHTML=book_4_title;
			var book_top4_picture="images/book"+objectList[3].id+".jpg";
			document.getElementById("book_top4_picture").src=book_top4_picture;
		var book_5_title=objectList[4].title;
			document.getElementById("book_top5_title").innerHTML=book_5_title;
			var book_top5_picture="images/book"+objectList[4].id+".jpg";
			document.getElementById("book_top5_picture").src=book_top5_picture;
	for(var i=0;i<objectList.length;i++){
		while(objectList.onsale="high"){
		var book_onsale=objectList[i].title;
		document.getElementById("book_onsale").innerHTML=book_onsale;
		}
		}
    </script>