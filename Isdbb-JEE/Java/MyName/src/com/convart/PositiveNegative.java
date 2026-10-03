
package com.convart;
import java.util.Scanner;

public class PositiveNegative {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println(" Input Number");
        double x=a.nextDouble();
        if(x>0){
            System.out.println(x+" is positive");
        }else if(x<0){
            System.out.println(x+" is negative");
        }else{
            System.out.println(x+" is nutral");
        }
    }
}
