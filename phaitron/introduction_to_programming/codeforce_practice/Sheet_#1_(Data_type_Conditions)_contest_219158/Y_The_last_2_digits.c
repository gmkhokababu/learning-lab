//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/Y

//Author: Abu Hossain
//Create: 29/10/2026 05:38 PM Colombo Sri Lanka
//Last Edit: 29/10/2026 05:38 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b,c;
    long long int d,result;
    scanf("%d %d %d %lld",&a,&b,&c,&d);
    a=a%100;
    b=b%100;
    c=c%100;
    d=d%100;
    result=a*b*c*d;
    printf("%lld",result);
    int res=result%100;
    printf("%d",res);
    
    
    return 0;
}