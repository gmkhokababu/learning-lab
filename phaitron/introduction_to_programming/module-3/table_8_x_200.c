//Write a c program to print 8’s time table to 200
// *
// *
// *
//Author: Abu Hossain
//Create: 07/10/2026 06:31 PM Colombo Sri Lanka

#include <stdio.h>
int main(){
    for(int i=1;i<=200;i++){
        int result=8*i;
        printf("8 x %d = %d\n",i,result);
    }
    return 0;
}