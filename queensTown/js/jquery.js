$(function() 
{ 
    var iCountOfImage = 9; //totally 9 images
    var iPreIndex = 0; // last position 
    $(".ppt-container ul.button-list li span").click
    (
        function() //click() param1
        { 
            var iIndex = $(this).attr("data-index"); 
            if(iIndex == iPreIndex) 
            { 
                return; // click the current image，no change
            } 

            $(".ppt-container .image-list li[data-index="+ iIndex +"]").fadeIn(1500); 
            $(".ppt-container .image-list li[data-index="+ iPreIndex +"]").fadeOut(1500); 
            iPreIndex = iIndex; 
            $(".ppt-container .button-list span").removeClass("selected"); 
            $(this).addClass("selected"); 
        }
    ); //define onClick action

    //setInterval is called and defined at the same time,haha~
    setInterval(
        //use function as a function pointer,function() is the first parameter, and it is defined and referenced at the same place.
        function() //parameter 1 of setInterval
        { 
            var iNextIndex = (iPreIndex + 1) % iCountOfImage; 
            $(".ppt-container ul.button-list li span[data-index="+ iNextIndex +"]").click(); 
        }, 

        5000 //parameter 2 of setInterval
        ); //5000 means,trigger one click event every 5000ms, thus implement auto play
}
);
