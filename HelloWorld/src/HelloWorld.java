
import java.util.*;

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
		
		Scanner sin = new Scanner(System.in);
		System.out.println("Plese input N matrix:");
		int m= sin.nextInt();
		double [][] a= new double[m][m];
		double [][] b= new double[m][m];
		double [][] c= new double[m][m];
		sin.close();
	
		for(int i=0; i<m; i++)
			for (int j=0; j<m; j++) {
				a[i][j]=Math.round(Math.random()*10);
				b[i][j]=Math.round(Math.random()*10);
				c[i][j]=a[i][j]+b[i][j];
			}
		
		//print
		for(int i=0; i<m; i++) {
			for (int j=0; j<m; j++) {
				System.out.print(a[i][j]+" ");
			}
			System.out.println();
		}
		
		System.out.println("+");
		
		for(int i=0; i<m; i++) {
			for (int j=0; j<m; j++) {
				System.out.print(b[i][j]+" ");
			}
			System.out.println();
		}
		
		System.out.println("=");
		for(int i=0; i<m; i++) {
			for (int j=0; j<m; j++) {
				System.out.print(c[i][j]+" ");
			}
			System.out.println();
		}
	
	}
	
	

}
