
package com.students;


public class Students {
    int id;
    String name;
    int round;
    String gender;
    String Division;
    String District;
    double  gpa;
    double expence;

    public Students() {
    }

    public Students(int id, String name, int round, String gender, String Division, String District, double gpa, double expence) {
        this.id = id;
        this.name = name;
        this.round = round;
        this.gender = gender;
        this.Division = Division;
        this.District = District;
        this.gpa = gpa;
        this.expence = expence;
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

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String District) {
        this.District = District;
    }

    public double getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    public double getExpence() {
        return expence;
    }

    public void setExpence(double expence) {
        this.expence = expence;
    }

    @Override
    public String toString() {
        return "Students{" + "id=" + id + ", name=" + name + ", round=" + round + ", gender=" + gender + ", Division=" + Division + ", District=" + District + ", gpa=" + gpa + ", expence=" + expence + '}';
    }

    

    
    
}
