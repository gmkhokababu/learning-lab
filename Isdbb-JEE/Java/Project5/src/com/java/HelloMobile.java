
package com.java;
import java.util.Scanner;

public class HelloMobile {
    
    Scanner sc=new Scanner(System.in);
    
    public static void main(String[] args){
        System.out.println("A");
        m1();
        System.out.println("B");
        m2();
        int x=m3();
        System.out.println(x);
        String y=m4();
        System.out.println(y);
        int z=sum();
        System.out.println("Summission is "+z);
        int a=sub();
        System.out.println("Subtrac is "+a);
        int b=div();
        System.out.println("Division is "+b);
        int c=mul();
        System.out.println("Multiplication is "+c);
        int sq=sq(5,3);
        System.out.println("Squere is "+sq);
        
    }
    public static void m1(){
        System.out.println("Hello");
    }
    public static void m2(){
        System.out.println("Mobile");
    }
    public static int m3(){
        
        return 10;
    }
    public static String m4(){
        return "Bangladesh";
    }
    public static int sum(){
        int a=3;
        int b=5;
        int c=a+b;
        return c;
    }
    public static int sub(){
        int a=8;
        int b=3;
        int c=a-b;
        return c;
    }
    public static int div(){
        int a=8;
        int b=4;
        int c=a/b;
        return c;
    }
    public static int mul(){
        int a=8;
        int b=4;
        int c=a*b;
        return c;
    }
    public static int sq(int y,int x){
        int a=y*y;
        int b=x*x;
        return a+b;
    }
}
