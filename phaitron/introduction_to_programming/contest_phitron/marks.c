//Author: Abu Hossain
//Create:  Colombo Sri Lanka
//Last Edit:  Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n,m,k;
    scanf("%d %d %d",&n,&m,&k);
    int given_num=n-1;
    int arr[given_num];
    for(int i=0;i<given_num;i++)
    {
        scanf("%d",&arr[i]);
    }
    int total_num=n*k,sum=0;
    for(int i=0;i<given_num;i++)
    {
        sum += arr[i];
    }

    int dif=total_num-sum;

    if(dif<=0)
    {
        printf("%d",0);
    }
    else if(dif<=m)
    {
        printf("%d",dif);
    }
    else
    {
        printf("%d",-1);
    }

    
    
    return 0;
}