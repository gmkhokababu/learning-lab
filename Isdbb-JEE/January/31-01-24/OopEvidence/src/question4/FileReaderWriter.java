
package question4;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class FileReaderWriter {
    public static void main(String[] args) {
        Person p1 = new Person("sazid", 101, "male");
        Person p2 = new Person("mahmud", 102, "male");
        File dir = new File("C:\\Users\\Student\\Desktop\\Person");
//        dir.mkdir();
        
        try{
            FileOutputStream f = new FileOutputStream("C:\\Users\\Student\\Desktop\\Person\\demo.txt");
            ObjectOutputStream o = new ObjectOutputStream(f);
            
            o.writeObject(p1);
            o.writeObject(p2);
            
            o.close();
            f.close();
            
            //-----------------
            FileInputStream fi = new FileInputStream("C:\\Users\\Student\\Desktop\\Person\\demo.txt");
            ObjectInputStream oi = new ObjectInputStream(fi);
            
            Person pr1 = (Person)oi.readObject();
            Person pr2 = (Person)oi.readObject();
            
            System.out.println(pr1);
            System.out.println(pr2);
            
            oi.close();
            fi.close();

        }catch(Exception e){
            System.out.println(e);
        }
        
    }
}
