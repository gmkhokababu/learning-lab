
package com.java;
import java.util.Arrays;
public class ShortingArray {
    public static void main(String[] args){
        int x[]={5,3,8,6,4,1};
        int temp=0;
        int i;
        int j;
        for(j=0;j<x.length;j++){
            for(i=0;i<x.length-1;i++){
                if(x[i]>x[i+1]){
                    temp=x[i];
                    x[i]=x[i+1];
                    x[i+1]=temp;
                }
            }
        }
       
        System.out.println(Arrays.toString(x));
        for(int k=0;k<x.length;k++){
            System.out.println(x[k]);
        }
    }
}
