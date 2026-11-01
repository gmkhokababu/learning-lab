//QS: You will have given a integer number n you have to print asterisk pattern
// sample input
// 4
// sample output
// *
// **
// ***
// ****


//Author: Abu Hossain
//Create: 01/11/2026 06:18 AM Colombo Sri Lanka
//Last Edit: 01/11/2026 06:18 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);

    for(int i=0;i<n;i++)
    {
        for(int j=0;j<=i;j++)
        {
            printf("*");
        }
        printf("\n");
    }
    
    
    return 0;
}