package OOP2;
import java.util.Arrays;
import java.util.Set;
import java.util.HashSet;
import java.util.SortedSet;
import java.util.TreeSet;



public class TestHashSet {
    public static void main(String[] args) {
//        Set<String> set = new HashSet<>();
          SortedSet set = new TreeSet();
        set.add("London");
        set.add("Paris");
        set.add("New York");
        set.add("San Fancisco");
        set.add("Beijing");
        
        Object[] a = set.toArray();
       
                
        System.out.println(Arrays.toString(a));
        
        for (int i = 0; i < a.length; i++) {
            System.out.println(a[i]);
        }
        
        
        SortedSet<Integer> set2 = new TreeSet<>();
        set2.add(2);
        set2.add(3);
        set2.add(5);
        set2.add(1);
        set2.add(9);
        
        System.out.println(set2);
    }
}
