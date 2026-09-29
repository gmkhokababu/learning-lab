
package q1;

import java.io.File;


public class CreateFile {
    public static void main(String[] args) {
        try {
            File file = new File("C:\\Users\\Administrator\\Desktop\\demo.txt");
            file.createNewFile();
            if (file.exists()){
                System.out.println("file exists");
            }else {
                System.out.println("File does not exist");
            }

        }catch (Exception e){
            System.out.println(e);
        }
    }
}
