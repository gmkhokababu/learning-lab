//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/C

//Author: Abu Hossain
//Create: 12/10/2026 08:46 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{

    int n;
    scanf("%d",&n);
    int even=0;
    int odd=0;
    int pos=0;
    int neg=0;
    for(int i=1;i<=n;i++)
    {
        int x;
        scanf("%d",&x);
        if(x%2==0)
        {
            even++;
            if(x<0)
            {
                neg++;
            }
            else if(x>0)
            {
                pos++;
            }
        }
        else
        {
            odd++;
            if(x<0)
            {
                neg++;
            }
            else if(x>0)
            {
                pos++;
            }
        }
    }

    printf("Even: %d\nOdd: %d\nPositive: %d\nNegative: %d\n",even,odd,pos,neg);


    return 0;
}