//Author: Abu Hossain
//Create:  Colombo Sri Lanka
//Last Edit:  Colombo Sri Lanka

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

    int reach=arr[0];

    for(int i=1;i<n;i++)
    {
        if(arr[i]<=reach)
        {
            break;
        }
        else
        {
            reach=arr[i];
        }
    }
    printf("%d",reach);
    
    return 0;
}