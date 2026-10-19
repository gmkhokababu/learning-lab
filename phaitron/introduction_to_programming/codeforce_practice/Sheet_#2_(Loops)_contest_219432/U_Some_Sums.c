// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/U

//Author: Abu Hossain
//Create:  Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n,a,b;
    scanf("%d %d %d",&n,&a,&b);
    int sum=0;
    for(int i=1;i<=n;i++)
    {
        int temp=0;
        int test=i;
        while(test !=0)
        {
            temp += test%10;
            test /=10;
        }
        // printf("%d\n",temp);
        if(temp>=a && temp<=b)
        {
            sum +=i;
            // printf("sum\n");
        }
    }
    
    printf("%d",sum);
    
    return 0;
}