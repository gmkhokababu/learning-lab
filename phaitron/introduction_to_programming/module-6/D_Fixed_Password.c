//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/D


//Author: Abu Hossain
//Create: 12/10/2026 07:54 PM Colombo Sri Lanka

#include <stdio.h>
#include <stdbool.h>

int main()
{

    int password=1999;
    int pass;


    while(scanf("%d",&pass) != EOF)
    {
        
        if(pass==password)
        {
            printf("Correct");
            break;
        }
        else
        {
            printf("Wrong\n");
        }
    }

    return 0;
}