// https://atcoder.jp/contests/abc149/tasks/abc149_b

//Author: Abu Hossain
//Create: 18/10/2026 09:20 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    long long int a,b,c;
    scanf("%lld %lld %lld",&a,&b,&c);

   if(a+b<=c)
   {
    a=0;
    b=0;
   }
   else if(a<c)
   {
    c-=a;
    a=0;
    if(b>=c)
    {
        b-=c;
    }
    else
    {
        b=0;
    }
   }
   else 
   {
    a-=0;
   }
   

    printf("%lld %lld",a,b);
    
    
    return 0;
}