package pakna;

public class Student extends Pakna implements Human{
    int id;
    String name;
    
    @Override
    public void exampleMethod(){
        System.out.println("You are a pakna");
        
    }
    @Override
    void searchThePakna(){
        System.out.println("Search of pakna");
    }
    
}
