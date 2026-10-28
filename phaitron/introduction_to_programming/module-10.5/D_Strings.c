//https://codeforces.com/group/MWSDmqGsZm/contest/219856/problem/D

//Author: Abu Hossain
//Create: 27/10/2026 05:18 PM Colombo Sri Lanka
//Last Edit: 27/10/2026 05:18 PM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    char a[100],b[100];
    scanf("%s %s",a,b);

    int len_a=strlen(a),len_b=strlen(b);
    printf("%d %d\n",len_a,len_b);

    for(int i=0;i<len_a;i++)
    {
        printf("%c",a[i]);
    }
    for(int i=0;i<len_b;i++)
    {
        printf("%c",b[i]);
    }
    printf("\n");
    int temp;
    temp=a[0];
    a[0]=b[0];
    b[0]=temp;

    for(int i=0;i<len_a;i++)
    {
        printf("%c",a[i]);
    }
    printf(" ");

    for(int i=0;i<len_b;i++)
    {
        printf("%c",b[i]);
    }

    
    
    return 0;
}