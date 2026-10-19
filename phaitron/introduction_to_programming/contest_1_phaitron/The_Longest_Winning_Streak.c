//Author: Abu Hossain
//Create: 19/10/2026 09:11 PM Colombo Sri Lanka
//Last Edit: 19/10/2026 09:11 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n,a;
    scanf("%d",&n);
    int count=0;
    int result=0;
    for(int i=0;i<n;i++)
    {
        scanf("%d",&a);
        if(a==1)
        {
            count++;
            if(result<count)
            {
                result=count;
            }
        
        }
        else if (a==0)
        {
            if(result<count)
            {
                result=count;
            }

            count=0;
        }
        
    }
    
    printf("%d",result);
    
    return 0;
}