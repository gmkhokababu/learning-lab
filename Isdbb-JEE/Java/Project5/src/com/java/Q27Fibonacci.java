
package com.java;

import java.util.Scanner;
import java.util.Arrays;
import java.util.ArrayList;
public class Q27Fibonacci {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        ArrayList x=new ArrayList();
        int y=0;
        int z=1;
        int sum=0;
        System.out.println("Input Seris length");
        int sl=a.nextInt();
        if(sl==1){
            x.add(y);
        }else if(sl==2){
            x.add(y);
            x.add(z);
        }else if(sl>2){
            x.add(y);
            x.add(z);
            for(int i=3; i<=sl; i++){
                sum=y+z;
                y=z;
                z=sum;
                x.add(sum);
                
                
            }
        }
        
        System.out.println(x);
    }
}
