//Author: Abu Hossain
//Create: 05/11/2026 07:55 AM Colombo Sri Lanka
//Last Edit: 05/11/2026 07:55 AM Colombo Sri Lanka

#include <stdio.h>

void m(int *p)
{
    int i=0;
    for(i=0;i<5;i++)
    {
        printf("%d ",p[i]);
    }
}
int main()
{
    
    int a[5]={6,5,3};
    m(a);
    
    return 0;
}