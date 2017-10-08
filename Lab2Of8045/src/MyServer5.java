import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class MyServer5 {

ServerSocket sSocket;
	
	public MyServer5()
	{
		// construct ServerSocket
		try {
			sSocket = new ServerSocket(5051);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		System.out.println("server for question5 is running...");
		MyServer5 server = new MyServer5();
		server.start();

	}

	public void start()
	{
	    while(true)
	    {
	    	try
		    {
		        Socket cSocket = sSocket.accept();
		        MultithreadedServer thread = new MultithreadedServer(cSocket);
				thread.start();
				
		    }
		    catch(IOException e)
		    {
		        e.printStackTrace();
		    }
	    	
	    }
	}


}
