#include <stdio.h>
int main(){
    long long int money;
    scanf("%lld",&money);

    if(money>1000){
        printf("I will buy Punjabi\n");
        long long int rest=money-1000;
        if(rest>=500){
            printf("I will buy new shoes\n");
            printf("Alisa will buy new shoes");
        }
    }else{
        printf("Bad luck!");
    }

    return 0;
}