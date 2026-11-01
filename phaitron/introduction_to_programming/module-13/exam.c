//Author: Abu Hossain
//Create: 01/11/2026 Colombo Sri Lanka
//Last Edit: 01/11/2026 Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int num=1;
    for(int i=1;i<=3;i++)
    {
        for(int j=1;j<=i;j++)
        {
            // count++;
            printf("%d ",num++);
        }
        printf("\n");
    }
    // printf("%d",count);
    
    return 0;
}