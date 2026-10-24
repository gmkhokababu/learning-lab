//Author: Abu Hossain
//Create: 25/10/2026 01:32 AM Colombo Sri Lanka
//Last Edit: 25/10/2026 01:32 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int arr[n+1];
    for(int i=0; i<n;i++)
    {
        scanf("%d",&arr[i]);
    }
    int index,val;
    scanf("%d %d",&index,&val);
    for(int i=n;i>=0;i--)
    {
        if(i==index)
        {
            arr[i]=val;
            break;
        }
        else
        {
            arr[i]=arr[i-1];
        }
    }

    for(int i=0;i<=n;i++)
    {
        printf("%d ",arr[i]);
    }
    
    
    return 0;
}