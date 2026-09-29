
package q2;

public class Truck extends Vehicle{
    int weight;

    public Truck(){
        
    }
    public Truck(int weight, double regularPrice) {
        this.weight = weight;
        this.regularPrice = regularPrice;
    }

  
    
    @Override
    double getSaleprice(){
        if(weight > 2000){
            double price = regularPrice - (regularPrice*0.10);
        return price;
        }else{
            return regularPrice;
        }
   
    }
}
