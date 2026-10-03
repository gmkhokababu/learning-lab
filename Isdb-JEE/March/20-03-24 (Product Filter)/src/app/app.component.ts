import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'products';

  products = [
    {
      id: 101,
      name: 'Fitness Smartwatch',
      stock: 40,
      price: 5000,
      image:"assets/61CZSoSnVPL._AC_SL1500_.jpg"
    },
    {
      id: 102,
      name: 'Amazfit GTR 3',
      stock: 30,
      price: 2000,
      image:"assets/61kENcORFCL._AC_SL1500_.jpg"
    },
    {
      id: 103,
      name: 'Military Smart Watches',
      stock: 50,
      price: 1500,
      image:"assets/51jyoJ5VMpL._AC_.jpg"
    },
    {
      id: 104,
      name: 'Military Smart Watches',
      stock: 50,
      price: 1500,
      image:"assets/51jyoJ5VMpL._AC_.jpg"
    },
    {
      id: 105,
      name: 'Military Smart Watches',
      stock: 50,
      price: 1500,
      image:"assets/51jyoJ5VMpL._AC_.jpg"
    },
    {
      id: 106,
      name: 'Military Smart Watches',
      stock: 50,
      price: 1500,
      image:"assets/51jyoJ5VMpL._AC_.jpg"
    },
    {
      id: 107,
      name: 'Military Smart Watches',
      stock: 50,
      price: 1500,
      image:"assets/51jyoJ5VMpL._AC_.jpg"
    },
    {
      id: 108,
      name: 'Military Smart Watches',
      stock: 50,
      price: 1500,
      image:"assets/51jyoJ5VMpL._AC_.jpg"
    }    
  ];
  product: any = { 
    id: 101,
    name:'Fitness Smartwatch',
    stock: 40,
    price: 5000,
    image:"assets/61CZSoSnVPL._AC_SL1500_.jpg"
  };

  m1(i:any){
 this.product = new Object();
 this.product.id = this.products[i].id;
 this.product.name = this.products[i].name;
 this.product.stock = this.products[i].stock;
 this.product.price = this.products[i].price;
 this.product.image = this.products[i].image;

  }
}
