package question4;

import java.io.Serializable;

public class Person implements Serializable{
    private String name;
    private int id;
    private String gender;

    public Person(){
        
    }
    
    public Person(String name, int id, String gender) {
        this.name = name;
        this.id = id;
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "Person{" + "name=" + name + ", id=" + id + ", gender=" + gender + '}';
    }
    
    
    
}
