//Author: Abu Hossain
//Create: 07/10/2026 03:53 AM Colombo Sri Lanka

#include <stdio.h>
int main(){
    int n;
    scanf("%d",&n);
    for(int i=1;i<=n;i++){
        if(i%2==0){
            printf("%d\n",i);
        }
    }
    return 0;
}