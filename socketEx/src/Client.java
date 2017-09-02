

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;

public class Client {
	public static void main(String[] args)
    {
        try
        {
            Socket client = new Socket("localhost",5003);
            
            OutputStream os = client.getOutputStream();
            
            System.out.println ("Client writing stuff to Server...");
            os.write("Hello ISCG8045 this is our first network connection".getBytes());
            
            os.close();
            System.out.println ("\nClient closed the connection");
            
            client.close();
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }

	
}
