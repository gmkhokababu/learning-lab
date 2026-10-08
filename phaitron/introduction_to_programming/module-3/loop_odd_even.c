//Author: Abu Hossain
//Create: 07/10/2026 03:45 AM Colombo Sri Lanka

#include <stdio.h>

int main(){
    int n;
    scanf("%d",&n);

    for(int i=1;i<=n;i++){
        if(i%2==0){
            printf("%d is an Even Number\n",i);
        }else{
            printf("%d is an Odd Number\n",i);
        }
    }
    return 0;
}