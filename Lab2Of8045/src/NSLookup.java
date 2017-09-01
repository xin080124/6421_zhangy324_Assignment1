import java.net.*;

public class NSLookup {

    public static void main (String args[]) {
	 
    	//question 1
    	
    	try{
		    /*InetAddress[] addresses = InetAddress.getAllByName(
		                             "www.whitehouse.gov");
		    */
    		InetAddress[] addresses = InetAddress.getAllByName(args[0]);
		    /*for (int i = 0; i < addresses.length; i++) 
		    {
		      System.out.println(i);
		      System.out.println(addresses[i]);
		    }
		    */
	    }
	    catch (UnknownHostException e) 
	    {
	        System.out.println("Could not find www.whitehouse.gov");
	    }
	  }
}
