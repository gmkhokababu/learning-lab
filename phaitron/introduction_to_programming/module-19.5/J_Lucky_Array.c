// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/J


//Author: Abu Hossain
//Create: 18/11/202603:46 PM Colombo Sri Lanka
//Last Edit: 18/11/202603:46 PM Colombo Sri Lanka

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
    int count=1;
    int min=arr[0];
    for(int i=1;i<n;i++)
    {
        if(min>arr[i])
        {
            count=1;
            min=arr[i];
        }
        else if(min==arr[i])
        {
            count++;
        }
    }
    if(count%2!=0)
    {
        printf("Lucky");
    }
    else
    {
        printf("Unlucky");
    }
    
    return 0;
}