//Author: Abu Hossain
//Create: 08/11/2026 09:00 AM Colombo Sri Lanka
//Last Edit: 08/11/2026 09:00 AM Colombo Sri Lanka

#include <stdio.h>

void print(int i)
{
    if(i==6)
    {
        return;
    }
    printf("%d\n",i);
    print(i+1);
}

int main()
{
    print(1);
    
    
    return 0;
}