
package com.java;

import java.util.Scanner;
public class Factorial {
    public static void main(String[] args){
        Scanner a= new Scanner(System.in);
        int sum=1;
        System.out.println("Input Number");
        int x=a.nextInt();
        int i;
        if(x<=1){
            System.out.println("The factorial of "+x+" is "+sum);
        }else{
            for(i=1;i<=x;i++){
                sum=sum*i;
            }
            System.out.println("The factorial of "+x+" is "+sum);
        }
        
    }
}
