
package com.java;

import java.util.Arrays;
public class Q24SumOddOfArray {
    public static void main(String[] args){
        int x[]={2,4,5,3,6,8,7,9};
        int sum=0;
        for(int i=0;i<x.length;i++){
            if(x[i]%2!=0){
                sum=sum+x[i];
            }
        }
        System.out.println("Summision of odd number is = "+sum);
    }
}
