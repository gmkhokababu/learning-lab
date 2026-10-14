// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/I

//Author: Abu Hossain
//Create: 14/10/2026 07:55 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",n);
    int temp=n;
    int reverse=0;
    while(temp!=0)
    {
        reverse=reverse*10+(temp%10);
        temp /=10;
    }

    if(n==reverse)
    {
        printf("%d\nYES",reverse);
    }
    else
    {
        printf("%d\nNO",reverse);
    }
    
    
    return 0;
}