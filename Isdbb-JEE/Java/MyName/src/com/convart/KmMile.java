
package com.convart;
import java.util.Scanner;

public class KmMile {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input Kilometer");
        double km=a.nextDouble();
        double mile=km*0.621371;
        System.out.println("Kilometer To Mile : "+mile);
        
    }
}
