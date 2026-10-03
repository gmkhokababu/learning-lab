
package com.exam;

public class Student {
    int id;
    String name;
    int round;
    String gender;
    String Division;

    public Student() {
    }

    public Student(int id, String name, int round, String gender, String Division) {
        this.id = id;
        this.name = name;
        this.round = round;
        this.gender = gender;
        this.Division = Division;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRound() {
        return round;
    }

    public void setRound(int round) {
        this.round = round;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDivision() {
        return Division;
    }

    public void setDivision(String Division) {
        this.Division = Division;
    }

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name=" + name + ", round=" + round + ", gender=" + gender + ", Division=" + Division + '}';
    }
    
    
}
