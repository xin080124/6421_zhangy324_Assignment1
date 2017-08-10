public class exceptions {
	public static void main(String Args[]) {
		
		int N = 0;
		if (Args.length > 0) { 
			try {
			N = Integer.parseInt(Args[0]);
		    }
		    catch(NumberFormatException e) {
		      System.out.println(
		      "Must enter integer as first argument."); 
		      return;
		    }
		}
		else {
	    	System.out.println("Must enter an argument."); 
		    return;
		}
		
		int[] array = new int[3];
		
		try {
			for (int i = 0; i < N; ++i) {
				array[i] = i;
			}
		}
		
		catch(ArrayIndexOutOfBoundsException e){
			System.out.println("Array index Out of Bounds.");
				return;
			}
		
		for(int i : array)
		System.out.println(i);
		}
			
}
