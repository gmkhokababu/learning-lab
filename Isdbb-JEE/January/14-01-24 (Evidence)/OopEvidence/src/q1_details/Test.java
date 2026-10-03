
package q1_details;
import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        Student student1 = new Student(101, "abc@gmail.com", 57, "Mirpur");
        Student student2 = new Student(102, "def@gmail.com", 56, "Gulshan");
        
        ArrayList<Student> list = new ArrayList<>();
        
        list.add(student1);
        list.add(student2);
        
        System.out.println(list.get(0).showAddress());
        System.out.println(list.get(1).showAddress());
    }
}
