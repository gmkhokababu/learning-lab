// output 
//    *
//   **
//  ***
// ****

//Author: Abu Hossain
//Create: 01/11/2026 06:48 AM Colombo Sri Lanka
//Last Edit: 01/11/2026 06:48 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    for(int i=0;i<n;i++)
    {
        for(int j=i;j<n-1;j++)
        {
            printf(" ");
        }
        for(int k=0;k<=i;k++)
        {
            printf("*");
        }
        printf("\n");
    }
    
    
    return 0;
}