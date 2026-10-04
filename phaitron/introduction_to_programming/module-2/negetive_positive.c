//Take a number from user and check if its a positive or negative number.

//Author: Abu Hossain
//Create: 05/10/2026 03:30 AM Colombo Sri Lanka


#include <stdio.h>

int main (){

    int num;
    scanf("%d",&num);

    if(num>0){
        printf("%d is a positive number!",num);
    }else if(num<0){
        printf("%d is a negetive number!",num);
    }else{
        printf("%d is a neutral number!",num);
    }


    return 0;
}