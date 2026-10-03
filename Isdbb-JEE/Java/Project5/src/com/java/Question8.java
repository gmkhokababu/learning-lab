
package com.java;

import java.util.Scanner;
public class Question8 {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input Product 1 value");
        double p1=a.nextDouble();
        System.out.println("Input Product 2 value");
        double p2=a.nextDouble();
        System.out.println("Input Product 3 value");
        double p3=a.nextDouble();
        System.out.println("Input Product 4 value");
        double p4=a.nextDouble();
        double total=p1+p2+p3+p4;
        double dis=0;
        double net=0;
        if(total>=5000){
           double disc=15;
           dis=(total*disc)/100;
           net=total-dis;
        }else if(total>=2000){
           double disc=10;
           dis=(total*disc)/100;
           net=total-dis;
        }else if(total>=1000){
           double disc=5;
           dis=(total*disc)/100;
           net=total-dis;
        }else if(total<1000){
           double disc=0;
           dis=(total*disc)/100;
           net=total-dis;
        }
        System.out.printf("Total Ammount = "+"%.2f \n",total);
        System.out.printf("Discount = "+"%.2f \n",dis);
        System.out.printf("Net Ammount = "+"%.2f \n",net);
        
    }
    
}
