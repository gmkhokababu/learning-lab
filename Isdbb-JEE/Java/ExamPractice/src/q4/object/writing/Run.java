
package q4.object.writing;

import java.util.ArrayList;
import java.io.*;


public class Run {
    public static void main(String[] args) {
        SavingAccount sa1=new SavingAccount(1001245, "Abu Hossain", 1500);
        SavingAccount sa2=new SavingAccount(1001246, "Johir", 2500);
        SavingAccount sa3=new SavingAccount(1001247, "Farzan", 2000);
        ArrayList<SavingAccount> array=new ArrayList<>();
        array.add(sa1);
        array.add(sa2);
        array.add(sa3);
//        for(int i=0;i<array.size();i++){
//        System.out.println(array.get(i));
//    }
        String path="D:\\Test";
        File location=new File(path);
        location.mkdir();
        path=path+"\\Test.txt";
        location=new File(path);
        try{
            location.createNewFile();
            FileOutputStream fs=new FileOutputStream(location);
            ObjectOutputStream pw=new ObjectOutputStream(fs);
            pw.writeObject(sa1);
            pw.writeObject(sa2);
            pw.writeObject(sa3);
            pw.flush();
            pw.close();
            
            
            FileInputStream fi=new FileInputStream(location);
            ObjectInputStream ps=new ObjectInputStream(fi);
            SavingAccount s1=(SavingAccount)ps.readObject();
            SavingAccount s2=(SavingAccount)ps.readObject();
            SavingAccount s3=(SavingAccount)ps.readObject();
            System.out.println(s1+"\n"+s2+"\n"+s3);
        }catch(Exception e){
            System.out.println(e);
        }
}
}