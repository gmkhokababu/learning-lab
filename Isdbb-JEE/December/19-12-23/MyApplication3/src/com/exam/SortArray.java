
package com.exam;

import java.util.Arrays;


public class SortArray {
    public static void main(String[] args){
        int number[] = {5,2,3,9,4,1,8};
        int temp = 0;   
        
        for(int j = 0; j < number.length; j++){
            for(int i = 0; i < number.length-1; i++){
             if(number[i] > number[i+1]){
                    temp = number[i];
                    number[i] = number[i+1];
                    number[i+1] = temp;
                }
        }
        }
        
        
//        System.out.println(Arrays.toString(number));
        for(int i = 0; i <= number.length-1; i++){
            System.out.println(number[i]);
            
        }
        
        
        
        
    }
}
