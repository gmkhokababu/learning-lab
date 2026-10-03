
package OOP2;
import java.util.Stack;


public class StackTest {
    public static void main(String[] args) {
        Stack<String> s = new Stack<>();
        s.add("Sazid");
        s.add("Mahmud");
        s.add("Sajib");
        s.add("Arif");
        s.add("Sumon");
        
//        System.out.println(s);

//        for (int i = 0; i < s.size(); i++) {
            System.out.print(s.peek()+" ");
            System.out.println();
//            System.out.print(s.pop()+" ");
            System.out.println(s.size());
            
            System.out.println(s);
            System.out.println(s.empty());
            System.out.println(s.search("Sumon"));
            
//        }
        
        
        
        
    }
}
