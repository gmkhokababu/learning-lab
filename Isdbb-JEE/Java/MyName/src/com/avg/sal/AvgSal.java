
package com.avg.sal;
import java.util.Scanner;

public class AvgSal {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input Person Salary");
        double x=a.nextDouble();
        System.out.println("Input Person Salary");
        double y=a.nextDouble();
        System.out.println("Input Person Salary");
        double z=a.nextDouble();
        double sum=(x+y+z);
        double avg=sum/3;
        System.out.println("Average Salary is = "+avg);
    }
}
