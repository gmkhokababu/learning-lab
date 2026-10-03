
package com.exam;


public class Test {
    public static void main(String[] args) {
        A a1 = new A();
        B b1 = new B();
        
        A a2 = new A(10, "Dhaka");
        
        System.out.println(a1.x);
        System.out.println(b1.y);
        System.out.println(b1.p);
        System.out.println(b1.q);
        System.out.println(a2.x);
        System.out.println(a2.y);
        
        System.out.println(b1);
    }
    
}
