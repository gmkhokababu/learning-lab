//Question: Write a function named swap_it() which will receive addresses of two integer variables. That means you need to receive them as integer pointers in the function parameter. In the function you need to swap the values of each other, you know that you can access the values of them by using dereferencing. You don’t need to return anything. After the function calls print the values of those two variables in the main function and see if anything happens!



//Author: Abu Hossain
//Create: 05/11/2026 11:10 AM Colombo Sri Lanka
//Last Edit: 05/11/2026 11:10 AM Colombo Sri Lanka

#include <stdio.h>

void swap_it(int *x, int *y)
{
    int temp;
    temp=*x;
    *x=*y;
    *y=temp;
}

int main()
{
    int a,b;
    scanf("%d %d",&a,&b);

    swap_it(&a,&b);

    printf("%d %d",a,b);
    
    
    return 0;
}