
public class Prime {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

        // Simple program to identify the first n prime numbers
		// A prime number is a number that is only divisable by 1 or itself
		// See http://en.wikipedia.org/wiki/Prime_number for more information
		// A factor is any number that equally divides another another number
		// initially we are only interested in the first 20 numbers
		int n = 20;
		
		int[] factorArray = new int[20];
		String factorStr = "";
		int factIdx = 0;

		// start the loop from 2
		for (int number = 2; number<=20;number++)
		{
			//reset factorArray????????these can be deleted
			for(int index = 0;index<20; index++)
			{
				factorArray[index] = 0;
			}
			factIdx = 0;
			factorStr = "";
		    // simple flag to toggle between prime and composite
			boolean isPrime = true;
			
			// what are the factors of the variable number?
			for (int factor = 2;factor <number; factor++)
			{
				/*
				* test if a particular number / factor combination
				results in a remainder if the number is equally divided
				by a factor higher than 1 then it must be a composite
				number */
				if(number % factor == 0)
				{
					isPrime = false;
					//System.out.println(" factor is "+factor);
					
					factorArray[factIdx] = factor;
					factIdx++;
					
					factorStr += factor + ",";
					//4
					//break;
				}
			} // end inner factor loop
			if(isPrime)
			{
				System.out.println(number+" is prime.");
			}
			else
			{
				System.out.println(number+" is composite.");
				factorStr = factorStr.substring(0,factorStr.length() - 1);

				System.out.println(" The factors include [" + factorStr + "]");
			}
			
		} // end outer number loop
	} // end main method
} // end class
		
		
		