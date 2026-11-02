//Author: Abu Hossain
//Create: 02/11/2026 09:43 PM Colombo Sri Lanka
//Last Edit: 02/11/2026 09:43 PM Colombo Sri Lanka

#include <stdio.h>


void addNumber(int a, int b)
{
    int sum=a+b;
    printf("%d",sum);
}
int main()
{
    int x,y;
    scanf("%d %d",&x,&y);
    addNumber(x,y);
    
    
    return 0;
}