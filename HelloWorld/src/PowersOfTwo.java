
public class PowersOfTwo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
			// last power of two to print
			int N = Integer.parseInt(args[0]);
			int i = 0; // loop control counter
			int v = 1; // current power of two
			//while (i <= N) 
			for (i = 0; i <= N; i++)
			{
				System.out.println(i + " " + v);
				//i = i + 1;
				v = 2 * v;
			}
	}

}