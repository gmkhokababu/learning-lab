//Author: Abu Hossain
//Create: 05/11/2026 10:41 PM Colombo Sri Lanka
//Last Edit: 05/11/2026 10:41 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);

    for(int i=1; i<=n; i++)
    {
        for(int j=0;j<n-i;j++)
        {
            printf(" ");
        }
        for(int j=i;j>=1;j--)
        {
            printf("%d",j);
        }
        printf("\n");
    }
    
    
    return 0;
}