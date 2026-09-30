
package com.java;

import java.util.Scanner;
public class SumUntil1 {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        int sum=0;
        System.out.println("Input Number");
        int x=a.nextInt();
        while(x!=-1){
            sum=sum+x;
            System.out.println("Input Number");
            x=a.nextInt();
        }
        System.out.println("Sum of input number is: "+sum);
    }
}
