// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/C

//Author: Abu Hossain
//Create: 15/10/2026 01:44 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }

    for(int i=0;i<n;i++)
    {
        if(arr[i]<0)
        {
            printf("%d ",2);
        }
        else if (arr[i]>0)
        {
            printf("%d ",1);
        }
        else
        {
            printf("%d ",arr[i]);
        }
        
    }
    
    
    return 0;
}