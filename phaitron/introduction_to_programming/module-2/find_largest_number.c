//Problem: Write a C program that takes three integers as input from the user and finds the largest number among them using nested if-else conditions.

// Author: Abu Hossain
// Create: 05/10/2026 04:41 AM Colombo Sri Lanka

#include <stdio.h>

int main(){
    int a;
    int b;
    int c;
    int large;
    scanf("%d %d %d",&a,&b,&c);

    if(a>b){
        large=a;
        if(large<c){
            large=c;
        }
    }else if(a<b){
        large=b;
        if(large<c){
            large=c;
        }
    }

    printf("The large number is: %d",large);

    return 0;

}