//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/H

//Author: Abu Hossain
//Create: 21/10/2026 07:25 PM Colombo Sri Lanka
//Last Edit: 21/10/2026 07:25 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b;
    scanf("%d %d",&a,&b);
    // double result=(double)a/b;
    // int r=a/b,f=a/b,c=a/b;
    // printf("floor %d / %d = %d\n",a,b,f);

    // if(result>c)
    // {
    //     c +=1;
    //     printf("ceil %d / %d = %d\n",a,b,c);
    // }
    // else
    // {
    //     printf("ceil %d / %d = %d\n",a,b,c);
    // }


    // if(result-r>=0.5)
    // {
    //     r +=1;
    //     printf("round %d / %d = %d\n",a,b,r);
    // }
    // else
    // {
    //     printf("round %d / %d = %d",a,b,r);
    // }
    int result=a/b,mod=a%b;

    printf("floor %d / %d = %d\n",a,b,result);
    if(mod!=0)
    {
        printf("ceil %d / %d = %d\n",a,b,result+1);
        
    }
    else
    {
        printf("ceil %d / %d = %d\n",a,b,result);
    }
    if(mod*2>=b)
    {
        printf("round %d / %d = %d\n",a,b,result+1);
        
    }
    else
    {
        printf("round %d / %d = %d\n",a,b,result);
    }
    
    
    return 0;
}