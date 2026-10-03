
package q5.text.readwrite;

import java.io.*;
import java.util.Scanner;
public class Textwrite {
    public static void main(String[] args) {
        String pragraph="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
        String name="Abu Hossain";
        String path="D:\\Test\\Textwrite.txt";
        File location=new File(path);
        try{
            location.createNewFile();
            FileOutputStream fo=new FileOutputStream(location);
            PrintWriter pw=new  PrintWriter(fo);
            pw.write(pragraph);
            pw.write("\n"+name);
            pw.flush();
            pw.close();
            Scanner sc=new Scanner(location);
            while(sc.hasNext()){
                System.out.println(sc.nextLine());
            }
            sc.close();
        }catch(Exception e){
            System.out.println(e);
        }
        
    }
}
