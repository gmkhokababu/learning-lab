//Question: Write a function named my_abs() that receives an integer value as parameter and returns the absolute value of that. Absolute value means if the value is negative it will be converted to positive value. Then print the value in the main function.

//Author: Abu Hossain
//Create: 05/11/2026 09:04 AM Colombo Sri Lanka
//Last Edit: 05/11/2026 09:04 AM Colombo Sri Lanka

#include <stdio.h>
#include <stdlib.h>

int my_abs(int x)
{
    int res=abs(x);
    return res;
}

int main()
{
    int n;
    scanf("%d",&n);

    int res=my_abs(n);
    printf("%d",res);
    
    
    return 0;
}