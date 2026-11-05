//Author: Abu Hossain
//Create: 04/11/2026 08:02 PM Colombo Sri Lanka
//Last Edit: 04/11/2026 08:02 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int x=10;

    int* ptr;
    ptr=&x;

    printf("%p\n",ptr);
    printf("%d\n",*ptr);
    
    
    return 0;
}