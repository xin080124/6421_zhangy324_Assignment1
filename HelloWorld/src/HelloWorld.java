
public class HelloWorld {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//question 1
		System.out.println("Hello World: ");
		
		//question 2
		//String ques2Str = "Hello World:"+ args[0];
		//System.out.println(ques2Str);
		
		//question 3
		
		/*
		int x = 6; 
		int y = 9;
		*/
		//int x = 5; 
		//int y = 2;
		
		//int t = 0;
		
		/*
		if (x > y)
		{
		    int t = x;  //??????????  or t=y
		    y = x;
		    x = t;
		    System.out.println("x = "+x+" and y= "+y);
		}
		else 
		{
		    System.out.println("Have a nice day!");
		}
		*/
		
		//question 7
		
		/*
		double[] x = { 0.3, 0.6, 0.1 }; 
		double[] y = { 0.5, 0.1, 0.4 }; 
		int N = x.length;
		double sum = 0.0;
		for (int i = 0; i < N; i++) {
		sum = sum + x[i]*y[i];
		System.out.println("i = "+i+" and sum= "+sum);
		}
		*/
		
		//???????matrix
		/*
		java.util.Random random=new java.util.Random();
		int result=random.nextInt(10);
		
		int[][] a = new int[3][3];
		int[][] b = new int[3][3];
		int[][] c = new int[3][3];
		for(int row =0;row<3;row++)
		{
			for(int column = 0;column<3; column++)
			{
				a[row][column] = random.nextInt(10);
				b[row][column] = random.nextInt(10);
				//System.out.println("a["+ row +"]["+column + "]: " + a[row][column]);
				//System.out.println("b["+ row +"]["+column + "]: " + b[row][column]);
			
				c[row][column] = a[row][column] + b[row][column];
			}
		}
		
		
		
		printMatrix(a, "a");
		printMatrix(b, "b");
		printMatrix(c, "c");
	
	*/
	}
	
	public static void printMatrix(int[][] matrix, String matrixName)
	{
		System.out.println("-----matrix "+matrixName+"-----");
		String rowStr = "";
		for(int row =0;row<3;row++)
		{
			rowStr = "";
			for(int column = 0;column<3; column++)
			{
				rowStr += " "+matrix[row][column];
				
			}
			System.out.println(rowStr);
		}
	}

}
