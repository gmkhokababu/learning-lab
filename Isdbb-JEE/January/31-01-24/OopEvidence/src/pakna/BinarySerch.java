
package pakna;


public class BinarySerch {
    public static void main(String[] args) {
        int[] a = {10,12,18,40,50,65,75};
        int item = 60;
        int first = 0;
        int last = a.length-1;
        int mid = 0;
        
        while(first <= last){
            mid = first+(last-first)/2;
            if (a[mid] < item) {
                first = mid+1;
            }else if(a[mid] > item){
                last = mid-1;
            }else if(a[mid] == item){
                System.out.println("Item found at "+mid);
                break;
            }
        }
        
        
        if (first > last) {
            System.out.println("Item not found");
        }
    }
    
    
    
}
