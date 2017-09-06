import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class MyThread4 extends Thread{

	MyThread4() {
	  }
	
	public void run() {
	     // do something
		System.out.println("test java thread");
		
		ServerSocket server = null;
        
        try
        {
            server = new ServerSocket(5000);
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }

		
		Socket socket = server.accept();

		DataInputStream dis = new DataInputStream(socket.getInputStream());
		DataOutputStream dos = new DataOutputStream(socket.getOutputStream());

		String timeStr = refFormatNowDate();
		
        //only write for once
		try
		{
		    dos.writeUTF(timeStr);
		}
		catch(EOFException e)
		{
		}

		
	
	}
	
	public static String refFormatNowDate() 
	{
		Date nowTime = new Date(System.currentTimeMillis());
		SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd");
		String retStrFormatNowDate = sdFormatter.format(nowTime);
		return retStrFormatNowDate;
	}


	

}
