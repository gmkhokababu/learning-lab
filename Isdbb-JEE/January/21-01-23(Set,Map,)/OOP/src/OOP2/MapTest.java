package OOP2;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MapTest {

    public static void main(String[] args) {
        Map<Integer, String> m1 = new HashMap<>();

        m1.put(10, "Rahim");
        m1.put(11, "Karim");
        m1.put(12, "Jodu");
        m1.put(13, "Modhu");
        m1.put(14, "Khadu");

        String s2 = m1.get(11);
//        System.out.println(s2);
        
        for (int i = 10; i < 15; i++) {
//            System.out.println(m1.get(i));
        }
        
        
        Map<String, String> m2 = new HashMap<>();
        m2.put("person1", "Rahim");
        m2.put("person2", "Karim");
        m2.put("person3", "Jodu");
        m2.put("person4", "Modhu");
        m2.put("person5", "Khadu");
        
        
//      using set -----------------------
        Set<String> s1 = m2.keySet();
//        System.out.println(m2.get("person2"));
        for (String s : s1) {
//            System.out.println(m2.get(s));
        }
        
        
//        Using Array------------
        Collection mapCollection = m2.values();
        
        Object[] mapValues = mapCollection.toArray();
        
        for (int i = 0; i < mapValues.length; i++) {
            System.out.println(mapValues[i]);
        }


    }
}
