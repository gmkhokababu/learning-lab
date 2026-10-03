
package com.java;
import java.util.Scanner;
import java.util.Arrays;

public class Q27Fibonacci1 {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input fibonacci length");
        int x=a.nextInt();
        int arr[]=new int[x];
        int index=-1;
        int y=0;
        int z=1;
        int sum=0;
        if(x==1){
            index++;
            arr[index]=y;
        }
        if(x==2){
            index++;
            arr[index]=y;
            index++;
            arr[index]=z;
        }
        if(x>2){
            index++;
            arr[index]=y;
            index++;
            arr[index]=z;
            for(int i=3; i<=x; i++){
                index++;
                sum=y+z;
                y=z;
                z=sum;
                arr[index]=sum;
            }
        }
        System.out.println(Arrays.toString(arr));
    }
}
