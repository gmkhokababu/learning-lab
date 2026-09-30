
package com.students;

import java.util.ArrayList;

public class BookOut {
    public static void main(String[] args){
        BookName b1=new BookName("HTML Basic", "John Doe", "Heracera", "Douglas", 1, 175, 2011);
        BookName b2=new BookName("CSS Basic", "John Dev", "Heracera", "David", 1, 175, 2011);
        BookName b3=new BookName("BootStrap Basic", "John Henry", "Heracera", "Daniel", 1, 175, 2011);
        BookName b4=new BookName("JavaScript Basic", "John Park", "Heracera", "Petar", 1, 175, 2011);
        BookName b5=new BookName("Java Basic", "Daniel Liang", "Heracera", "Samiul", 1, 175, 2011);
        BookName b6=new BookName("HTML Advance", "John Doe", "Heracera", "Douglas", 1, 175, 2011);
        BookName b7=new BookName("CSS Advance", "John Dev", "Heracera", "David", 1, 175, 2011);
        BookName b8=new BookName("BootStrap Advance", "John Henry", "Heracera", "Daniel", 1, 175, 2011);
        BookName b9=new BookName("JavaScript Advance", "John Park", "Heracera", "Petar", 1, 175, 2011);
        BookName b10=new BookName("Java Advance", "Daniel Liang", "Heracera", "Samiul", 1, 175, 2011);
        
        ArrayList<BookName> list1 = new ArrayList<>();
        list1.add(b1);
        list1.add(b2);
        list1.add(b3);
        list1.add(b4);
        list1.add(b5);
        list1.add(b6);
        list1.add(b7);
        list1.add(b8);
        list1.add(b9);
        list1.add(b10);
        
        /*System.out.println("Writer Name");
        System.out.println("______________");
        System.out.println(list1.get(0).writername);
        System.out.println(list1.get(1).writername);
        System.out.println(list1.get(2).writername);
        System.out.println(list1.get(3).writername);
        System.out.println(list1.get(4).writername);
        System.out.println(list1.get(5).writername);
        System.out.println(list1.get(6).writername);
        System.out.println(list1.get(7).writername);
        System.out.println(list1.get(8).writername);
        System.out.println(list1.get(9).writername);*/
        
        for(int i=0;i<list1.size();i++){
            System.out.println(list1.get(i).writername);
        }
        
        
        
    }
}
