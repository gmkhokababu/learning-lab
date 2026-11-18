//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/Y

//Author: Abu Hossain
//Create: 29/10/2026 05:38 PM Colombo Sri Lanka
//Last Edit: 17/11/2026 08:50 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int ;
    long long int a,b,c,d,result,ab,cd;
    scanf("%lld %lld %lld %lld",&a,&b,&c,&d);

    ab=(a*b)%100;
    cd=(c*d)%100;

    result=(ab*cd)%100;
   
    printf("%02lld",result);
    
    
    return 0;
}