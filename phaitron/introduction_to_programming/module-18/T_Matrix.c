//https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/T

//Author: Abu Hossain
//Create: 12/11/2026 05:56 AM Colombo Sri Lanka
//Last Edit: 12/11/2026 05:56 AM Colombo Sri Lanka

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int r;
    scanf("%d",&r);
    int arr[r][r];

    for(int i=0;i<r;i++)
    {
        for(int j=0;j<r;j++)
        {
            scanf("%d",&arr[i][j]);
        }
    }
    

    long long int primary_sum=0;
    long long int secondry_sum=0;
    long long int abs_dif;
    for(int i=0;i<r;i++)
    {
        for(int j=0;j<r;j++)
        {
            if(i==j)
            {
                primary_sum += arr[i][j];
            }
            if(i+j==r-1)
            {
                secondry_sum += arr[i][j];
            }
        }
        // printf("\n");
    }
    abs_dif=abs(primary_sum-secondry_sum);
    printf("%lld",abs_dif);
    
    
    return 0;
}