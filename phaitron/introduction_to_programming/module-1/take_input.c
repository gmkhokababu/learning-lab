#include <stdio.h>

int main(){
    int num;
    float f;
    char c;
    scanf("%d %f %c\n",&num, &f, &c);
    printf("%d %.2f %c\n",num, f, c);

    return 0;
}