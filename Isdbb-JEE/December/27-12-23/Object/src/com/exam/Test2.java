package com.exam;

public class Test2 {

    public static void main(String[] args) {
        Student s1 = new Student(101, "Rahim", 57, "Male", "Dhaka");
        Student s2 = new Student(102, "Korim", 55, "Male", "Tangail");
        Student s3 = new Student(103, "Jodu", 56, "Male", "Barisal");
        Student s4 = new Student(104, "Modhu", 52, "Female", "Khulna");
        Student s5 = new Student(105, "Khadu", 53, "Male", "Sylhet");

        System.out.println("Id");
        System.out.println("---");
        System.out.println(s1.id);
        System.out.println(s2.id);
        System.out.println(s3.id);
        System.out.println(s4.id);
        System.out.println(s5.id);

    }
}
