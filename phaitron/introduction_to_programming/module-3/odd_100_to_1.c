//Write a c program to print all odd number from 100 to 1
// *
// *
// *
//Author: Abu Hossain
//Create: 07/10/2026 06:52 PM Colombo Sri Lanka

#include <stdio.h>

int main(){
    for(int i=100;i>0;i--){
        if(i%2!=0){
            printf("%d\n",i);
        }
    }
}