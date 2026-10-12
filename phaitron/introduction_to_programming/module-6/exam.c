//Author: Abu Hossain
//Create:  Colombo Sri Lanka

#include <stdio.h>

int main()
{
    
    int i=-3;
    int count=0;
    while (i<0)
    {
        for(int j=0;j<5;j++)
        {
               printf("*");
               count++; 
        }
        i++;
    }

    printf("%d",count);
    
    return 0;
}