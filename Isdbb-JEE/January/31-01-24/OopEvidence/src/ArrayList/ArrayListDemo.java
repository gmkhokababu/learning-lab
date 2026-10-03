package ArrayList;
import java.util.ArrayList;

public class ArrayListDemo {
    public static void main(String[] args) {
        ArrayList<String> fruits = new ArrayList<String>();
        
        fruits.add("Banana");
        fruits.add("Apple");
        fruits.add("Orange");
        fruits.add("Lici");
        
        for (String s : fruits) {
            System.out.println(s);
        }
        
//        System.out.println(fruits);
        
        
    }
}
