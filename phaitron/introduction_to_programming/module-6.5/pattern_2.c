//https://judge.phitron.io/topics/cm5z7wa3u0007p301xbzdqkuk/cm86d15s50092r001qeu2gb0t?language=c_103

//Author: Abu Hossain
//Create: 13/10/2026 05:55 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    
    int n;
    scanf("%d",&n);
    for(int i=n;i>0;i--)
    {
        for (int j=i;j>0;j--)
        {
            printf("%d ",j);
        }
        printf("\n");
    }
    
    return 0;
}