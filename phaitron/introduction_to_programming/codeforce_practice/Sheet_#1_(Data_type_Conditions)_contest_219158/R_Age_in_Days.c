//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/R

//Author: Abu Hossain
//Create: 22/10/2026 03:41 AM Colombo Sri Lanka
//Last Edit: 22/10/2026 03:41 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int year=n/365;
    int days=n%365;
    int month=days/30;
    days=days%30;
    printf("%d years\n%d months\n%d days",year,month,days);
    
    
    return 0;
}