
package com.java;

public class Test {
   public static void main(String[] args){
  
  int a = 5;
  a +=0;
  
 
  
  switch(a){
   
    case 5: System.out.print("5");break;
    case 10: System.out.print("10");
             System.out.println(((a%2 ==0) ? "-even-" : "-odd-"));  
             break;

    default: System.out.print("0");
    
  }
  
}
    
}
