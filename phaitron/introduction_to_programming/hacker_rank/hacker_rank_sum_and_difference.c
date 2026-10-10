// hacker rank problem link: https://www.hackerrank.com/challenges/sum-numbers-c/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 08/10/2026 11:21 PM Colombo Sri Lanka

#include <stdio.h>
int main(){
    int a;
    int b;
    float c;
    float d;
    scanf("%d %d\n%f %f",&a,&b,&c,&d);
    int int_sum=a+b;
    int int_dif=a-b;
    float sum=c+d;
    float dif=c-d;
    printf("%d %d\n%.1f %.1f",int_sum,int_dif,sum,dif);

    return 0;
}