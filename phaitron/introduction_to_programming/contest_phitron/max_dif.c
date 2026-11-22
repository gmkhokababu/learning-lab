//Author: Abu Hossain
//Create:  Colombo Sri Lanka
//Last Edit:  Colombo Sri Lanka

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main()
{
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }

    int max=INT_MIN;

    for(int i=0;i<n-1;i++)
    {
        for(int j=n-1;j>i;j--)
        {
            int dif=arr[j]-arr[i];
            if(dif>max)
            {
                max=dif;
            }
        }
        
        
    }
    printf("%d",max);
    
    
    return 0;
}