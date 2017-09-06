import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import org.omg.CORBA.portable.InputStream;

public class MyServer4 {

	public static void main(String[] args) {
		//SomeThread thread = new SomeThread ();

		System.out.println(" in MyThread4 ");
		
		 ServerSocket server = null;
	        try
	        {
	            server = new ServerSocket(5000);
	        }
	        catch(IOException e)
	        {
	            e.printStackTrace();
	        }

		
		while(true)
		{
		    try
		    {
		        Socket socket = server.accept();
		        MyThread4 thread = new MyThread4();
				thread.start();
				
		        /*
		        InputStream is = socket.getInputStream();
		        StringBuffer mesg = new StringBuffer();
		        while(true)
		        {
		            int data = is.read();
		            
		            if(data == -1)
		            {
		                break;
		            }
		            else
		            {
		                mesg.append((char)data);
		            }
		        }
		        System.out.println(mesg);
		        */
		    }
		    catch(IOException e)
		    {
		        e.printStackTrace();
		    }
		}


	}

}
