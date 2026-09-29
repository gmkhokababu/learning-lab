
package q1;
import java.io.FileWriter;


public class WriteFile {
    public static void main(String[] args) {
        int id;
        String name;
        try {
            FileWriter fw = new FileWriter("C:\\Users\\Administrator\\Desktop\\demo.txt");
            fw.write("1280309,Sazid Mahmud \n");
            fw.write("1280305,Miraz Mahmud \n");
            fw.flush();
            fw.close();

        }catch (Exception e){
            System.out.println(e);
        }



    }
}
