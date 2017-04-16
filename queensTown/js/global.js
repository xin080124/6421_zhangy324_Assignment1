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
