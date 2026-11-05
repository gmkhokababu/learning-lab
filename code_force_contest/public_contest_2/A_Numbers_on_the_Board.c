//https://codeforces.com/contest/2283/problem/A

//Author: Abu Hossain
//Create: 04/11/2026 8:44 PM Colombo Sri Lanka
//Last Edit: 04/11/2026 8:44 PM Colombo Sri Lanka

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main()
{
    int x;
    scanf("%d",&x);

    for(int i=0;i<x;i++){
        int l,r;
        int res;
        scanf("%d %d",&l,&r);
        
        if(l==r && l==0)
        {
            printf("%d\n",0);
        }
        else if(l<0 && r>0)
        {
            res=abs(l)-r;
            res=abs(res);
            if(res>1)
            {
                printf("%d\n",res-1);
            }
            else
            {
                printf("%d\n",0);
            }
        }
        else if(l==0 && r>0)
        {
            res=r-1;
            // res=res-1;
            printf("%d\n",res);
        }
        else if(l<0 && r==0)
        {
            res=abs(l)-1;
            printf("%d\n",res);
        }
        else
        {
            res=abs(l)-abs(r);
            res=abs(res);
            printf("%d\n",res);
        }
    }
   
    
    return 0;
}