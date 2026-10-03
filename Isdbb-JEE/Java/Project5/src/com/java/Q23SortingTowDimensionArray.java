
package com.java;
import java.util.Arrays;
public class Q23SortingTowDimensionArray {
    public static void main(String[] args){
        int x[][]={{3,5,8,4,6,2},{5,1,8,6,7,9}};
        int temp=0;
        for(int k=0;k<x.length;k++){
            int p[]=x[k];
            for(int j=0;j<p.length;j++){
                for(int i=0;i<p.length-1;i++){
                    if(p[i]>p[i+1]){
                        temp=p[i];
                        p[i]=p[i+1];
                        p[i+1]=temp;
                    }
                }
            }
            System.out.println(Arrays.toString(p));
        }
    }
}
