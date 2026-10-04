//
//Author : Abu Hossain
//Create : 10/04/2026 10:35 PM Sri Lanka
//Last Edit: 10/04/2026 10:35 PM Sri Lanka

#include <stdio.h>

int main(){

    int num_1;
    float num_2;
    int sum;
    int sub;
    int mul;
    float div;
    scanf("%d %f\n",&num_1, &num_2);

    sum=num_1+num_2;
    sub=num_1-num_2;
    mul=num_1*num_2;
    div=num_1/num_2;
    printf("Number 1: %d\nNumber 2: %f\nSummision: %d\nSubtraction: %d\nMultiplication: %d\nDivision: %.2f",num_1,num_2,sum,sub,mul,div);

    return 0;
}