//https://codeforces.com/problemset/problem/1866/A

//Author: Abu Hossain
//Create: 12/10/2026 10:51 PM Colombo Sri Lanka

#include <stdio.h>
#include <limits.h>

int main()
{
    
    int n;
    scanf("%d",&n);
    int min=INT_MAX;
    
    for(int i=1; i<=n; i++)
    {
        int x;
        scanf("%d",&x);
        if(x<0)
        {
            x*=-1;
        }
        if(min>x)
        {
            min=x;
        }
    }

    printf("%d",min);
    
    return 0;
}