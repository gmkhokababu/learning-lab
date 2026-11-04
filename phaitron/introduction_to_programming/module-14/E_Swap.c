//https://codeforces.com/group/MWSDmqGsZm/contest/223205/problem/E

//Author: Abu Hossain
//Create: 04/11/2026 07:02 AM Colombo Sri Lanka
//Last Edit: 04/11/2026 07:02 AM Colombo Sri Lanka

#include <stdio.h>

void swap(int a, int b)
{
    int temp;
    temp=a;
    a=b;
    b=temp;

    printf("%d %d",a,b);

}

int main()
{
    int x,y;
    scanf("%d %d",&x,&y);
    swap(x,y);
    
    
    return 0;
}