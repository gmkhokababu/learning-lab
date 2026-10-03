
package com.java;
import java.util.Scanner;
public class PrimeNumber {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        int sum=0;
        System.out.println("Input Number");
        int x=a.nextInt();
        int i;
        for(i=1;i<=x;i++){
            if(x%i==0){
                sum++;
            }
        }
        if(sum==2){
            System.out.println("Prime Number");
        }else{
            System.out.println("Not Prime Number");
        }
    }
}
