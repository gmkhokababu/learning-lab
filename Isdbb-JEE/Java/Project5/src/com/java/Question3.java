
package com.java;

import java.util.Scanner;
public class Question3 {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input Number 1");
        double x=a.nextDouble();
        System.out.println("Input Number 2");
        double y=a.nextDouble();
        double sum=x+y;
        double sub=x-y;
        double mul=x*y;
        double div=x/y;
        System.out.println("The summission of "+x+" and "+y+" is: "+sum);
        System.out.println("The subistraction of "+x+" and "+y+" is: "+sub);
        System.out.println("The multiplication of "+x+" and "+y+" is: "+mul);
        System.out.println("The division of "+x+" and "+y+" is: "+div);
        
    }
}
