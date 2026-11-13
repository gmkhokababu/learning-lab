//https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/P

//Author: Abu Hossain
//Create: 13/11/2026 02:58 PM Colombo Sri Lanka
//Last Edit: 13/11/2026 02:58 PM Colombo Sri Lanka

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

    bool status=true;
    int operation=0;
    
    while(status)
    {
        for(int i=0;i<n;i++)
        {
            if(arr[i]%2==0)
            {
                arr[i] /= 2;
            }
            else
            {
                status=false;
                break;
            }
        }
        if(status)
        {
            operation++;
        }
    }

    printf("%d",operation);
    
    return 0;
}