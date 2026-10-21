// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/Q

//Author: Abu Hossain
//Create: 22/10/2026 02:50 AM Colombo Sri Lanka
//Last Edit: 22/10/2026 02:50 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    float x,y;
    scanf("%f %f",&x,&y);
    if(x==0 && y==0)
    {
        printf("Origem");
    }
    else if(x==0)
    {
        printf("Eixo Y");
    }
    else if(y==0)
    {
        printf("Eixo X");
    }
    else if(x>0 && y>0)
    {
        printf("Q1");
    }
    else if(x>0 && y<0)
    {
        printf("Q4");
    }
    else if(x<0 && y<0)
    {
        printf("Q3");
    }
    else if(x<0 && y>0)
    {
        printf("Q2");
    }
    
    
    return 0;
}