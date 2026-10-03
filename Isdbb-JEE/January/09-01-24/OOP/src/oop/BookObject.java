
package oop;
import java.util.ArrayList;


public class BookObject {
    public static void main(String[] args) {
        Book b1 = new Book("Java", "Liang", 742.6 , "Tenth");
        Book b2 = new Book("php", "Daniel", 555.6 , "Tenth");
        Book b3 = new Book("javascript", "Devid", 465.6 , "Tenth");
        Book b4 = new Book("HTML", "Betham", 215.6 , "Tenth");
        Book b5 = new Book("css", "Hall", 745.6 , "Tenth");
        Book b6 = new Book("bootstrap", "Peter", 471.6 , "Tenth");
        Book b7 = new Book("talwild", "Abul", 322.6 , "Tenth");
        Book b8 = new Book("photoshop", "Kabul", 502.6 , "Tenth");
        Book b9 = new Book("Illustrator", "Babul", 114.6 , "Tenth");
        Book b10 = new Book("animation", "Cabul", 214.6 , "Tenth");
        
        
        ArrayList<Book> list1 = new ArrayList<>();
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
        
//        System.out.println(list1.size());
        
        for(int i = 0; i <list1.size(); i++){
            System.out.println(list1.get(i).writter);
        }
        
//        System.out.println(list1.get(0).writter);
//        System.out.println(list1.get(1).writter);
//        System.out.println(list1.get(2).writter);
//        System.out.println(list1.get(3).writter);
//        System.out.println(list1.get(4).writter);
//        System.out.println(list1.get(5).writter);
//        System.out.println(list1.get(6).writter);
//        System.out.println(list1.get(7).writter);
//        System.out.println(list1.get(8).writter);
//        System.out.println(list1.get(9).writter);
//        
        
        
//        System.out.println("Writer");
//        System.out.println("-----");
//        System.out.println(b1.writter);
//        System.out.println(b1.writter);
//        System.out.println(b1.writter);
//        System.out.println(b2.writter);
//        System.out.println(b3.writter);
//        System.out.println(b4.writter);
//        System.out.println(b5.writter);
//        System.out.println(b6.writter);
//        System.out.println(b7.writter);
//        System.out.println(b8.writter);
//        System.out.println(b9.writter);
//        System.out.println(b10.writter);
        
        
        
        
    }    
}
