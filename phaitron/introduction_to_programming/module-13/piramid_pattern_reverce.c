// Output
// *******
//  *****
//   ***
//    *

//Author: Abu Hossain
//Create: 01/11/2026 08:08 AM Colombo Sri Lanka
//Last Edit: 01/11/2026 08:08 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int star=n*2-1;
    int space;
    for(int i=0;i<n;i++)  //line
    {
        for(int j=0;j<i;j++) //for space
        {
            printf(" ");
        }
        for (int k=0;k<star;k++)  //for star
        {
            printf("*");
        }
        printf("\n");
        star-=2;
    }
    
    
    return 0;
}