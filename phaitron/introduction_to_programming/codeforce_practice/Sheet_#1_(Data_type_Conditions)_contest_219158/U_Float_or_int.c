// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/U

//Author: Abu Hossain
//Create: 22/10/2026 11:11 PM Colombo Sri Lanka
//Last Edit: 22/10/2026 11:11 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    float n;
    scanf("%f",&n);
    int in=n;
    if(in==n)
    {
        printf("int %d",in);
    }
    else
    {
        printf("float %d %.3f",in,n-in);
    }
    
    return 0;
}