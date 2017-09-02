import java.net.*;
import java.io.*;

public class lserver {

	public static void main(String[] args)
    {
        ServerSocket server = null;
        try
        {
            server = new ServerSocket(5026);
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
		    }
		    catch(IOException e)
		    {
		        e.printStackTrace();
		    }
		}

    }

	
}
