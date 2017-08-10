
//package Labs;
import java.util.*;

//define a public class named Prime
public class Prime {
	// generic main method
	public static void main(String[] args) {
		// Simple program to identify the first n prime numbers
		// A prime number is a number that is only divisable by 1 or itself
		// See http://en.wikipedia.org/wiki/Prime_number for more information
		// A factor is any number that equally divides another another number
		// initially we are only interested in the first 20 numbers
		int n = 20;
		// start the loop from 2
		for (int number = 2; number <= 20; number++) {
			// simple flag to toggle between prime and composite
			boolean isPrime = true;

			ArrayList<Integer> factlist = new ArrayList<Integer>();
			
			// what are the factors of the variable number?
			for (int factor = 2; factor < number; factor++) {
				/*
				 * test if a particular number / factor combination results in a remainder if
				 * the number is equally divided by a factor higher than 1 then it must be a
				 * composite number
				 */
				if (number % factor == 0) {
					isPrime = false;
					factlist.add(factor);
					//break;
				}
			} // end inner factor loop
			if (isPrime) {
				System.out.println(number + " is prime.");
			} else {
			
			System.out.println(number + " is composite.");
			System.out.print("The factors include [");
			int i;
			for(i=0;i<factlist.size()-1;i++)
				System.out.print(factlist.get(i)+",");
			System.out.println(factlist.get(i)+"]");
			}
		} // end outer number loop
	} // end main method
} // end class
