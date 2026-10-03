
package com.java;


public class Q26SumMultyArray {
    public static void main(String[] args){
        int x[][]={{1,2,3},{4,5,6}};
        int sum=0;
        for(int j=0;j<x.length;j++){
            int p[]=x[j];
            for(int i=0;i<p.length;i++){
                sum=sum+p[i];
            }
        }
        System.out.println(sum);
    }
}
