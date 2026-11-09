//Author: Abu Hossain
//Create: 05/11/2026 11:01 PM Colombo Sri Lanka
//Last Edit: 05/11/2026 11:01 PM Colombo Sri Lanka

#include <stdio.h>

int count_before_one(int arr[], int x)
{
    int count=0;
    for(int i=0;i<x;i++)
    {
        if(arr[i]==1)
        {
            break;
        }
        else
        {
            count++;
        }
    }



    return count;
}

int main()
{
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }

    int count=count_before_one(arr,n);
    printf("%d",count);
    
    
    return 0;
}