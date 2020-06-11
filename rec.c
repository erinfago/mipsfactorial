#include <stdio.h>


int fact (int n)
{

	//base case
	if(n < 1)
    	return 1;

    //recursive case - call one less
 	else
		return n*fact(n-1);

}

int main()
{
	//set n = 6
	int n = 6;
	//store result of fact function
 	int result = fact(n);

 	//print as integer the result
 	printf("%d \n", result);

}
