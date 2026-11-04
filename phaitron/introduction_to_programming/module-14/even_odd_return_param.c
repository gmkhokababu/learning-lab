//Author: Abu Hossain
//Create: 03/11/2026 11:50 AM Colombo Sri Lanka
//Last Edit: 03/11/2026 11:50 AM Colombo Sri Lanka

#include <stdio.h>
#include <stdbool.h>

bool even_odd(int x)
{
    if(x%2==0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

int main()
{
    int x;
    scanf("%d",&x);

    if(even_odd(x))
    {
        printf("EVEN");
    }
    else
    {
        printf("ODD");
    }
    
    
    return 0;
}