//Author: Abu Hossain
//Create: 28/10/2026 03:15 PM Colombo Sri Lanka
//Last Edit: 28/10/2026 03:15 PM Colombo Sri Lanka

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
    int s;
    scanf("%d",&s);
    int b[s];
    for(int i=0;i<s;i++)
    {
        scanf("%d",&b[i]);
        // printf("%d ",b[i]);
    }
    // printf("\n");
    
    int f=n+s;
    int c[s];
    for(int i=0;i<n;i++)
    {
        c[i]=a[i];
        // printf("%d ",c[i]);
    }
    // printf("\n");
    for(int i=0;i<s;i++)
    {
        c[i+n]=b[i];
        // printf("%d %d",c[i],i);
    }
    printf("\n");
    for(int i=0;i<f;i++)
    {
        printf("%d ",c[i]);
    }

    
    return 0;
}