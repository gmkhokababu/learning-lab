//
//Author : Abu Hossain
//Create : 10/04/2026 10:35 PM Sri Lanka
//Last Edit: 10/04/2026 10:35 PM Sri Lanka

#include <stdio.h>

int main(){

    int num_1 = 2;
    int num_2 = 5;
    int sum;
    int sub;
    int mul;
    int div;
    scanf("%d %d\n",&num_1, &num_2);

    sum=num_1+num_2;
    sub=num_1-num_2;
    mul=num_1*num_2;
    div=num_1/num_2;
    printf("Number 1: %d\nNumber 2: %d\nSummision: %d\nSubtraction: %d\nMultiplication: %d\nDivision: %d",num_1,num_2,sum,sub,mul,div);

    return 0;
}