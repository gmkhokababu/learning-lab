
package com.access.modifier;


public class Test {
    public static void main(String[] args){
        X a=new X();
        Y b=new Y();
        int g=b.m1(50,2);
        System.out.println(a.name);
        System.out.println("This is parent result");
        System.out.println(a.id);
        System.out.println("This is child result");
        System.out.println(b.id);
        System.out.println("This is parent result");
        System.out.println(a.m1(20,15));
        System.out.println("This is child result");
        System.out.println(g);
        a.m2(20,4);
    }
   
}