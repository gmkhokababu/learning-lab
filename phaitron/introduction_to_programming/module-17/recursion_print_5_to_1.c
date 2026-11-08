//Author: Abu Hossain
//Create: 08/11/2026 10:08 AM Colombo Sri Lanka
//Last Edit: 08/11/2026 10:08 AM Colombo Sri Lanka

#include <stdio.h>

void print(int i)
{
    if(i==0)
    {
        return;
    }
    printf("%d\n",i);
    print(i-1);
}

int main()
{
    print(5);
    
    
    return 0;
}