// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/H

//Author: Abu Hossain
//Create: 05/11/2026 12:24 PM Colombo Sri Lanka
//Last Edit: 05/11/2026 12:24 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i=0; i<n;i++)
    {
        scanf("%d",&arr[i]);
    }

    for(int i=0;i<n;i++)
    {
        int temp;
        for(int j=i+1;j<n;j++)
        {
            if(arr[i]>arr[j])
            {
                temp=arr[i];
                arr[i]=arr[j];
                arr[j]=temp;
            }
        }
    }

    for(int i=0; i<n;i++)
    {
        printf("%d ",arr[i]);
    }
    
    
    return 0;
}