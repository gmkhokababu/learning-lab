
package student;


public class Student extends Teacher {
    int id;
    String email;
    int round;
    String address;
    public String showAddress(){
        return "Address: "+address;
    }
    

    public Student() {
    }

    public Student(String name, int id, String email, int round, String address) {
        this.name = name;
        this.id = id;
        this.email = email;
        this.round = round;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRound() {
        return round;
    }

    public void setRound(int round) {
        this.round = round;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
