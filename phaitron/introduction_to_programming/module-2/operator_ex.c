
//Write a C program that takes two integer inputs from the user and prints their sum, difference, product, quotient, and remainder.

//Author: Abu Hossain
//Create: 05/10/2026 04:05 AM Colombo Sri Lanka

#include <stdio.h>
int main(){
    int a;
    int b;
    scanf("%d %d",&a,&b);
    int sum=a+b;
    int dif=a-b;
    int prod=a*b;
    int quot=a/b;
    int rem=a%b;

    printf("Sum : %d\nDifference: %d\nProduct: %d\nQuotient: %d\nRemainder: %d",sum,dif,prod,quot,rem);

    return 0;
}