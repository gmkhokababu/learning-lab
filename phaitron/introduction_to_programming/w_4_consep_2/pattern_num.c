//Author: Abu Hossain
//Create: 02/11/2026 10:29 PM Colombo Sri Lanka
//Last Edit: 02/11/2026 10:29 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);

    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=i;j++)
        {
            printf("%d",j);
        }
        printf("\n");
    }
    for (int i = 1; i < n; i++)
    {
        for(int j=1;j<=i;j++)
        {
            printf(" ");
        }
        for(int k=1;k<=n-i;k++)
        {
            printf("%d",k);
        }
        printf("\n");
    }
    
    
    
    return 0;
}