//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/X

//Author: Abu Hossain
//Create: 23/10/2026 12:19 AM Colombo Sri Lanka
//Last Edit: 23/10/2026 12:19 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int s1,e1,s2,e2;
    scanf("%d %d %d %d",&s1,&e1,&s2,&e2);

    if(s1<=s2 && e1>=s2)
    {
        printf("%d ",s2);
    }
    else if(s1>=s2 && s1<=e2)
    {
        printf("%d ",s1);
    }

    if(e1>=s2 && e1<=e2)
    {
        printf("%d",e1);
        return 0;
    }
    else if(e2>=s1 && e2<=e1)
    {
        printf("%d",e2);
        return 0;
    }

    printf("-1");
    
    return 0;
}