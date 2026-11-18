
// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/Z


//Author: Abu Hossain
//Create: 17/11/2026 11:49 AM Colombo Sri Lanka
//Last Edit: 17/11/2026 11:49 AM Colombo Sri Lanka

#include <stdio.h>
#include <stdlib.h>

#include <math.h>

int main()
{

    long long int a,b,c,d;
    scanf("%lld %lld %lld %lld",&a,&b,&c,&d);

    // if(a log(b));

    // double a,b,c,d;
    // scanf("%lf %lf %lf %lf",&a,&b,&c,&d);

    
    
    if(pow(a,b)>pow(c,d))
    {
        printf("YES");
    }
    else
    {
        printf("NO");
    }

    
    
    return 0;
}