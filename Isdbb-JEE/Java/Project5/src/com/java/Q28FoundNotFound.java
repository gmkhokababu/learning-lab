
package com.java;

import java.util.Arrays;
import java.util.Scanner;

public class Q28FoundNotFound {
    public static void main(String[] args){
        int x[]={3,5,8,9,15};
        Scanner a=new Scanner(System.in);
        System.out.println("Input Number");
        int y=a.nextInt();
        boolean temp=false;
        for(int i=0; i<x.length; i++){
            if(x[i]==y){
                temp=true;
                
            }
        }
        if(temp==true){
            System.out.println("Found");
        }else{
            System.out.println("Not Found");
        }
    }
}
