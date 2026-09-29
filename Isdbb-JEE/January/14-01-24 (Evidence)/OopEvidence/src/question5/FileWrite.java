package question5;

import java.io.FileWriter;

public class FileWrite {
    public static void main(String[] args) {
        int id;
        String name;
        try {
            FileWriter fw = new FileWriter("C:\\Users\\TRUST\\OneDrive\\Desktop\\myFile\\student.txt");
            fw.write("1280107,Md Syful Islam Sumon");
            fw.flush();
            fw.close();

        }catch (Exception e){
            System.out.println(e);
        }



    }
}
