
package com.convart;
import java.util.Scanner;

public class LowestNumber {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input 1st Number");
        double x=a.nextDouble();
        System.out.println("Input 2nd Number");
        double y=a.nextDouble();
        System.out.println("Input 3rd Number");
        double z=a.nextDouble();
        if(x<y && x<z){
            System.out.println("The lowest number is "+x);
        }else if(y<x && y<z){
            System.out.println("The lowest number is "+y);
        }else {
            System.out.println("The lowest number is "+z);
        }
        
    }
}
