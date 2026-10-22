// https://www.hackerrank.com/challenges/pointer-in-c/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 23/10/2026 03:01 AM Colombo Sri Lanka
//Last Edit: 23/10/2026 03:01 AM Colombo Sri Lanka

#include <stdio.h>

void update(int *a,int *b) {
      
    int x=*a+*b;
    int y=*a-*b;
    if(y<0)
    {
        y *=-1;
    }
    *a=x;
    *b=y;
      
}

int main()
{
    int a, b;
    int *pa = &a, *pb = &b;
    
    scanf("%d %d", &a, &b);
    update(pa, pb);
    printf("%d\n%d", a, b);

    
    
    return 0;
}