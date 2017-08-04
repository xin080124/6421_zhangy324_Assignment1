
public class exceptions {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] array = new int[3];
		int N = 5;
		for(int i=0;i<N;++i){ 
			try{
				array[i] = i;
			}
			catch(ArrayIndexOutOfBoundsException e)
			{
				System.out.println(" N is out of bounds "); 
				return;
			}
		}

		System.out.println(array);
	}

}
