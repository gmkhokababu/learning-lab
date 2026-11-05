// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/T

// Author: Abu Hossain
// Create: 05/11/2026 08:55 AM Colombo Sri Lanka
// Last Edit: 05/11/2026 08:55 AM Colombo Sri Lanka

#include <stdio.h>

void sort(int a, int b, int c)
{
    int temp;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            if (a > b)
            {
                temp = a;
                a = b;
                b = temp;
            }
            if(b>c)
            {
                temp=b;
                b=c;
                c=temp;
            }
            if(a>c)
            {
                temp=a;
                a=c;
                c=temp;
            }
        }
    }
    printf("%d\n%d\n%d\n",a,b,c);
}

int main()
{
    int a,b,c;
    scanf("%d %d %d",&a,&b,&c);
    sort(a,b,c);
    printf("\n%d\n%d\n%d",a,b,c);

    return 0;
}