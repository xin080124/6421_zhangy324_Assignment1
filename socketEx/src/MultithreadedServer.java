
import java.io.IOException;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class MultithreadedServer {

	public static void main(String[] args)
    {
        ServerSocket server = null;
        try
        {
            server = new ServerSocket(5003);
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
        
        while(true)
        {
            try
            {
            	System.out.println ("Multithreaded Server waiting for clients on port " + server.getLocalPort()+"...");
				final Socket socket = server.accept();
                System.out.println ("\nServer just accepted a client: " + socket.toString());
                
				Thread serverThread = new Thread() {
					public void run() {
						try {
				            InputStream is = socket.getInputStream();
				            StringBuffer mesg = new StringBuffer();
				            while(true) {
				                int data = is.read();
				                if(data == -1)
				                    break;
				                else
				                    mesg.append((char)data);
				            }
				            System.out.println("***** "+this.getName()+" *****");
				            System.out.println ("Message recieved from clinet is: "+ mesg);
						}
						catch(IOException e) { }
					}
				};

				serverThread.start();
                
            }
            catch(IOException e)
            {
                e.printStackTrace();
            }
        }
    }

	
	
}
