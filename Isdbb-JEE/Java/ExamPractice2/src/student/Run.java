package student;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.io.*;
import javax.swing.*;

public class Run {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        ArrayList<Student> sInfo = new ArrayList<>();

        String start = "yes";
        boolean go = start.matches("yes");
        while (go != false) {

            //Service type
            System.out.println("Which service do you want?");
            System.out.println("For Information type info.");
            System.out.println("For New student admission type admission.");
            String service = input.nextLine();

            boolean condition1 = service.matches("admission");
            boolean condition2 = service.matches("info");

            if (condition1 == true) {
                String rereg = "yes";
                boolean chk = rereg.matches("yes");
                //System.out.println(chk);
                while (chk == true) {

                    //input data
                    System.out.println("Input your id.");
                    int id = input.nextInt();

                    //-----------Directory Part-------------//
                    String location = "F:\\Study\\JEE\\Java\\Project\\StudentInfo";
                    File fileLocation = new File(location);
                    fileLocation.mkdir();
                    String sInfofileLocation = location + "\\" + id + ".txt";
                    File info = new File(sInfofileLocation);
                    //------------Dir add
                    try {

                        boolean infoFile = info.createNewFile();
                        while (infoFile != true) {
                            System.out.println("ID already Exist Input another");
                            id = input.nextInt();
                            sInfofileLocation = location + "\\" + id + ".txt";
                            info = new File(sInfofileLocation);
                            infoFile = info.createNewFile();

                        }

                    } catch (Exception e) {
                        System.out.println(e);
                    }
                    //------------End Directory Part-----------------//

                    System.out.println("Input your name.");
                    input.nextLine();
                    String name = input.nextLine();

                    System.out.println("Input your email.");
                    //input.nextLine();
                    String email = input.nextLine();

                    System.out.println("Input your address.");
                    String address = input.nextLine();

                    System.out.println("Input your round.");
                    int round = input.nextInt();

                    Student student = new Student(name, id, email, round, address);

                    sInfo.add(student);

                    //-------------Push Data------------------------
                    try {
                        FileOutputStream f1 = new FileOutputStream(info);
                        ObjectOutputStream pw = new ObjectOutputStream(f1);
                        //PrintWriter pw = new PrintWriter(dir.info);
                        pw.writeObject("ID: " + student.id + "\n" + "Name: " + student.name + "\n" + "Email: " + student.email + "\n" + "Address: " + student.address + "\n" + "Round: " + student.round);
                        pw.flush();
                        pw.close();
                    } catch (Exception e) {
                        System.out.println(e);
                    }

                    //Recheck User Demand
                    System.out.println("Do you want another registration?(yes/no)");
                    input.nextLine();
                    rereg = input.nextLine();
                    chk = rereg.matches("yes");
                }
            } //-----------------Info check section------------------------
            else if (condition2 == true) {
                boolean chk = true;
                while (chk != false) {
                    System.out.println("Input your id.");
                    int id = input.nextInt();

                    //-----------Directory Part-------------//
                    String location = "F:\\Study\\JEE\\Java\\Project\\StudentInfo";
                    File fileLocation = new File(location);
                    boolean sInfoDir = fileLocation.mkdir();
                    String sInfofileLocation = location + "\\" + id + ".txt";
                    File info = new File(sInfofileLocation);
                    //------------Dir add-----------------------

                    try {
                        FileInputStream f2 = new FileInputStream(info);
                        ObjectInputStream pw = new ObjectInputStream(f2);
                        String pi = (String) pw.readObject();
                        System.out.println(pi);
                        System.out.println("For search again type yes.");
                        System.out.println("For exit type no.");
                        input.nextLine();
                        String value = input.nextLine();
                        chk = value.matches("yes");
                    } catch (Exception e) {
                        System.out.println("Id not exist inpit valid id");
                        id = input.nextInt();
                    }
                    //------------End Directory Part-----------------//

                }
            }
            System.out.println("Do you want to get another service?(yes/no)");
            start = input.nextLine();
            go = start.matches("yes");

        }
    }

}
