// output:
//    *
//   ***
//  *****
// *******

//Author: Abu Hossain
//Create: 01/11/2026 07:33 AM Colombo Sri Lanka
//Last Edit: 01/11/2026 07:33 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n,star=1;
    scanf("%d",&n);
    int space=n-1;
    for(int i=1;i<=n;i++)   //line
    {
        for(int j=i;j<=space;j++)   //space
        {
            printf(" ");
        }
        for(int k=1;k<=star;k++)  //star print
        {
            printf("*");
        }
        printf("\n");
        star+=2;
    }
    
    
    return 0;
}