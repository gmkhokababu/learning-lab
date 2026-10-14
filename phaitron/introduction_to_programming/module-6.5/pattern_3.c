// https://judge.phitron.io/topics/cm5z7wa3u0007p301xbzdqkuk/cm86d8btu009er001s04tfa7u?language=c_103

//Author: Abu Hossain
//Create: 13/10/2026 06:00 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    char ch='A';

    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=i;j++)
        {
            printf("%c",ch);
            printf(" ");
        }
        printf("\n");
        ch++;
    }
    
    
    return 0;
}