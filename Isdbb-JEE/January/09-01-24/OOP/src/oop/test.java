package oop;

public class test {

    public static void main(String[] args) {
        Student s1 = new Student(101, "Rahim", 57, "Male", "Dhaka");
        Student s2 = new Student(102, "Korim", 55, "Male", "Tangail");
        Student s3 = new Student(103, "Jodu", 56, "Male", "Barisal");
        Student s4 = new Student(104, "Modhu", 52, "Female", "Khulna");
        Student s5 = new Student(105, "Khadu", 53, "Male", "Sylhet");

        System.out.println("Id \t" + "Name" + "\tGender");
        System.out.println("--- \t" + "----\t" + "----");
        System.out.println(s1.id + "\t" + s1.name + "\t" + s1.gender);
        System.out.println(s2.id + "\t" + s2.name + "\t" + s2.gender);
        System.out.println(s3.id + "\t" + s3.name + "\t" + s3.gender);
        System.out.println(s4.id + "\t" + s4.name + "\t" + s4.gender);
        System.out.println(s5.id + "\t" + s5.name + "\t" + s5.gender);

    }
}
