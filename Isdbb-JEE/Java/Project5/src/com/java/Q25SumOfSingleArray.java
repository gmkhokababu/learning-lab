
package com.java;

import java.util.Arrays;
public class Q25SumOfSingleArray {
    public static void main(String[] args){
        int x[]={2,3,4};
        int sum=0;
        for(int i=0;i<x.length;i++){
            sum=sum+x[i];
        }
        System.out.println("Sum of array is = "+sum);
    }
}
