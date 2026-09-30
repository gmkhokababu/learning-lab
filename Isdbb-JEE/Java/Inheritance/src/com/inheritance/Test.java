
package com.inheritance;


public class Test {
    
    public static void main(String[] args){
        A a1=new A();
        A a2=new A(10,"Abu Hossain");
        B b1=new B();
        B b2=new B(15,20);
        
        System.out.println(a1.x);
        System.out.println(a2.x);
        System.out.println(b2.x);
    }
}
