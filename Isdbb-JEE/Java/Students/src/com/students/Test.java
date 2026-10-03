
package com.students;


public class Test {
    
    public static void main(String[] args){
        Students s1=new Students(100, "Abu Hossain", 57,"Male","Khulna", "Jashore", 3.88, 5000);
        Students s2=new Students(101, "Farzana Hooque", 57,"Female","Khulna", "Jashore", 3.88, 5000);
        Students s3=new Students(102, "Jahir Raihan", 57,"Male","Khulna", "Jashore", 3.88, 5000);
        Students s4=new Students(103, "Abdul Aziz", 57,"Male","Khulna", "Jashore", 3.88, 5000);
        Students s5=new Students(104, "Shamim Usman", 57,"Male","Khulna", "Jashore", 3.88, 5000);
    
        System.out.println(" ID"+" "+"  Name");
        System.out.println("----"+" "+"--------");
        System.out.println(s1.id+"  "+s1.name);
        System.out.println(s2.id+"  "+s2.name);
        System.out.println(s3.id+"  "+s3.name);
        System.out.println(s4.id+"  "+s4.name);
        System.out.println(s5.id+"  "+s5.name);
        
    }
            
}
