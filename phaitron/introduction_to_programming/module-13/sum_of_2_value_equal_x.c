


//Author: Abu Hossain
//Create: 01/11/2026 09:32 AM Colombo Sri Lanka
//Last Edit: 01/11/2026 09:32 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int a[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&a[i]);
    }
    int x;
    scanf("%d",&x);
    for(int i=0;i<n-1;i++)
    {
        for(int j=i+1;j<n;j++)
        {
            if(a[i]+a[j]==x)
            {
                printf("Yes");
                return 0;
            }
        }
    }
    printf("No");
    
    return 0;
}