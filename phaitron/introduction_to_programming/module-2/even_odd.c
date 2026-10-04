//Take a number from user and check if its a even number or odd number.


//Author: Abu Hossain
//Create: 05/10/2026 03:12 AM Colombo Sri Lanka

#include <stdio.h>

int main(){
    int num;
    scanf("%d",&num);
    if(num%2==0){
        printf("%d is an even number!",num);
    }else{
        printf("%d is an odd number!",num);
    }
}