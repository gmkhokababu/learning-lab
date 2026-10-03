
package q1_details;

public class Student {
    int id;
    String email;
    int round;
    String address;

    public String showAddress(){
        return "My address is : " + address;
    }
    
    public Student(){
        
    }
    public Student(int id, String email, int round, String address){
        this.id = id;
        this.email = email;
        this.round = round;
        this.address = address;
    }
}
