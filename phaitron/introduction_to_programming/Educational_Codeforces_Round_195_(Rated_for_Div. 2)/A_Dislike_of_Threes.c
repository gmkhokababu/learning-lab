//Author: Abu Hossain
//Create: 14/10/2026 11:23 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    
    int t;
    scanf("%d",&t);

    for(int i=1;i<=t;i++){
        int k;
        scanf("%d",&k);
        int count=1;
        int value=1;
        while(k!=count)
        {
            value++;
            if(value%3==0 || value%10==3){
                continue;
            }
            count++;
        }
        printf("%d\n",value);

    }
    
    return 0;
}