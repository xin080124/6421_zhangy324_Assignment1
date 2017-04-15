function toggle(targetid){

    if(targetid == "all")
    {
        var showItems = new Array('hotel1','hotel2','bb1','motel1');
    }
    else if(targetid == "hotels")
    {
    	var showItems = new Array('hotel1','hotel2');
        var hideItems = new Array('bb1','bb2','motel1');
    }
    else if(targetid == "motels")
    {
        var showItems = new Array('motel1');//if there is no 'bb2',this won't work
        var hideItems = new Array('hotel1','hotel2','bb1','bb2','bb3');	
    }
    else
    {
    	var showItems = new Array('bb1','bb2');//if there is no 'bb2',this won't work
        var hideItems = new Array('hotel1','hotel2','motel1');	
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
