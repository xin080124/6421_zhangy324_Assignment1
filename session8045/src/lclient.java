import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;

public class lclient {
	public static void main(String[] args)
    {
        try
        {

            Socket client = new Socket("localhost",5026);

            OutputStream os = client.getOutputStream();

            os.write("Hello ISCG8045 this is our first network connection".getBytes());
            os.close();

            client.close();

        }

        catch(IOException e)
        {
           e.printStackTrace();
        }
    }
}
