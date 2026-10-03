
package com.java;
import java.util.Scanner;

public class Work1 {
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("Input number");
        int p=sc.nextInt();
        System.out.println("Input number");
        int q=sc.nextInt();
        System.out.println("Input number");
        int r=sc.nextInt();
        int result=add(p,q,r);
        System.out.println("The Sumission of your Input is "+result);
    }
    public static int add(int a,int b,int c){
        int sum=a+b+c;
        return sum;
    }
}
