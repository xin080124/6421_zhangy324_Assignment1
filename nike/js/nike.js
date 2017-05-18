// JavaScript Document
var length = 6;                //the total number of images
var current = 1;               //the current slide number

var slide_tray = new Array();  //an array to hold the uploaded images

function load_slide(place,file) {
   slide_tray[place] = new Image();
   slide_tray[place].src = file;
   }
   
//This loop is executed when the page is uploaded to initialise the image array
for (i=1; i<=length;  i++)
{
   var file_name = "images/slide" + i + ".jpg";	//Generate current iamge file name
   load_slide(i, file_name);
}


//Load previous image
function gobackward() {
  current = current - 1;
  if( current < 1 ) {
     current = length;
  }
  document.slide.src=slide_tray[current].src;  //update current image
  document.getElementById("PN").innerHTML = current;
}

//Load previous image
function goforward() {
  current = current + 1;
  if( current > 6 ) {
     current = 0;
  }
  document.slide.src=slide_tray[current].src;  //update current image
  document.getElementById("PN").innerHTML = current;
}

//Form validation
function validate_form(thisform)
{
	// document.getElementById("name").style.visibility = "hidden"; 
with (thisform)
{
if (validate_email(email, "The input email address is not valid!")==false)
  {email.focus(); return false;}
}
}

//Rotating bannars 
iNum = 1; 
// iNumRight = 1; 
function fading_rotating()
{
	iNum++;
	if (iNum == 6) {iNum=1;}
	document.getElementById("board").src= "images/nike-banner" + iNum +".jpg";	
	Spry.Effect.DoFade(document.getElementById("board"));
	setTimeout("fading_rotating()", 6000);
		
	// iNumRight++;
	// if (iNumRight == 4) {iNumRight=1;}
	// document.getElementById("right").src= "images/nike-banner" + iNum +".jpg";	
	// setTimeout("fading_rotating()", 3000);
}

//Rotating bannars 
// iNumRight = 1; 
// function right_rotating()
// {
	// iNumRight++;
	// if (iNumRight == 4) {iNumRight=1;}
	// document.getElementById("board").src= "images/nike-banner" + iNum +".jpg";	
	// setTimeout("fading_rotating()", 3000);
		
// }

//jQuery code
$(function() {

	var offsetX = 400;
	var offsetY = 60;
	
	$('a').hover(function(e) {
		var href = $(this).attr('href');
		$('<img id="largeImage" src="' + href + '" alt="big image" />')
		.css('top', e.pageY - offsetY)
		.css('left', e.pageX - offsetX)
		.appendTo('body');
	}, function() {
		$('#largeImage').remove();
	});
	
	$('a').mousemove(function(e) {
		$("#largeImage").css('top', e.pageY - offsetY).css('left', e.pageX - offsetX);
	});

});	

//Displays small images vertically
 function smallImages(imgNum)
 {
	 var strLinks="";
	 for (i=1; i<=imgNum; i++)
	 {
		strLinks +="<a href='images/large" + i + ".jpg'><img src='images/small" + i + ".jpg' alt='image'/></a><br/>"; 
	 }
	 document.write(strLinks);
 }
 
var slideIndex = 1;
showSlides(slideIndex);
 
 function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

//manual mode

function showSlides(n) {
	// document.getElementById("left").style.visibility = "hidden"; 
  var i;
  var slides = document.getElementsByClassName("mySlides");
  // var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  // for (i = 0; i < dots.length; i++) {
      // dots[i].className = dots[i].className.replace(" active", "");
  // }
  slides[slideIndex-1].style.display = "block"; 
  // dots[slideIndex-1].className += " active";
}
 