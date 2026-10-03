package question5;

import java.io.File;

public class CreatefolderFile {
    public static void main(String[] args) {
        File dir = new File("C:\\Users\\TRUST\\OneDrive\\Desktop\\myFile");
        dir.mkdir();
        String path  = dir.getAbsolutePath();

        try {
            File file = new File(path+"\\student.txt");
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
