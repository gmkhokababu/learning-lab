
package com.access.modifier;


public class X {
   public int id=100;
   public String name="Abu Hossain";
    private int age=27;
    private String gender="Male";
 
     
    public int m1(int a,int b){
         a=8;
         b=12;
        int res=a+b;
        return res;
    }
    public void m2(int a,int b){
            a=8;
            b=12;
        int res=a-b;
        System.out.println(res);
    }

    public X() {
    }
    
}
