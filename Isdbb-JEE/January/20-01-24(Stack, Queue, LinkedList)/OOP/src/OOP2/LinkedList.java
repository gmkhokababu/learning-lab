
package OOP2;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;


public class LinkedList {
    public static void main(String[] args) {
        List<String> person = new ArrayList<>();
        
       person.add("Sazid");
       person.add("Mahmud");
       person.add("Arif");
       person.add("Sumon");
       person.add("Ema");
       person.add("Rahat");
       person.add("Sobuj");
       person.add("Neel");
       person.add("Sadi");
       person.add("Abu");
        
//       System.out.println(person);
    ListIterator<String> listIterator = person.listIterator();
    
    while(listIterator.hasNext()){
        System.out.print(listIterator.next()+" ");
    }
        
    }
}
