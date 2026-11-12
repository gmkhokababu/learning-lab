//https://codeforces.com/group/MWSDmqGsZm/contest/329103/problem/F

//Author: Abu Hossain
//Create: 12/11/2026 10:15 AM Colombo Sri Lanka
//Last Edit: 12/11/2026 10:15 AM Colombo Sri Lanka

#include <stdio.h>
#include <stdbool.h>

int main()
{
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }

    int loop=n/2;
    int left=0;
    int right=n-1;
    for(int i=0;i<=loop;i++)
    {
        if(left<=right)
        {
            printf("%d ",arr[left]);
        }
        if(right>left)
        {
            printf("%d ",arr[right]);
        }
        left++;
        right--;
        
    }
    
    
    return 0;
}