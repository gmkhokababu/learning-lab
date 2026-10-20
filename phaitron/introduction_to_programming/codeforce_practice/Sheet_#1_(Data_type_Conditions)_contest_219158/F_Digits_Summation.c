//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/F

//Author: Abu Hossain
//Create: 21/10/2026 03:23 AM Colombo Sri Lanka
//Last Edit: 21/10/2026 03:23 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    long long int m,n;
    scanf("%lld %lld",&m,&n);
    int last =m%10;
    int last2=n%10;
    int sum=last+last2;
    printf("%d",sum);
    
    
    return 0;
}