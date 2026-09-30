package com.java;

import java.io.*;

public class PrintWrite {

    public static void main(String[] args) {
        try {
            String location = "F:\\Study\\JEE\\Java\\TestProject";
            File f1 = new File(location);
            boolean chk = f1.mkdir();
            int x=1275;
            location = location + "\\"+x+".txt";
            f1 = new File(location);
            chk = f1.createNewFile();
            FileOutputStream f2 = new FileOutputStream(f1);
            ObjectOutputStream pw = new ObjectOutputStream(f2);
            //PrintWriter pw = new PrintWriter(f1);
            pw.writeObject("\nMy name is Java" + ", " + "How are you? Miss You My Dear.");
            pw.flush();
            pw.close();
        } catch (Exception e) {
            System.out.println(e);

        }
        try{
            String location = "F:\\Study\\JEE\\Java\\TestProject";
            String x="1275";
            location = location + "\\"+x+".txt";
            File f1 = new File(location);
            FileInputStream f2=new FileInputStream(f1);
            ObjectInputStream pw=new ObjectInputStream(f2);
            String pi=(String)pw.readObject();
            System.out.println(pi);
        }catch(Exception e){
            
        }
    }
}
