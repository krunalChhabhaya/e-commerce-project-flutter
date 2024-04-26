import 'package:flutter/material.dart';
import 'package:flutterprjgroup9/product_detail.dart';
import 'package:flutterprjgroup9/shoe.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Shoe> shoeList = [];
    shoeList.add(Shoe("Nike Air Max", 99.99, "images/product1.jpg", "Black & White", "Male", "Running", "The Nike Air Max is designed for maximum comfort and performance"));
    shoeList.add(Shoe("Adidas Superstar", 79.99, "images/product2.jpg", "White", "Unisex", "Casual", "The Adidas Superstar is an iconic sneaker with timeless style"));
    shoeList.add(Shoe("Nike Air Force 1", 89.99, "images/product3.jpg", "White", "Male", "Casual", "The Nike Air Force 1 is a classic sneaker known for its versatility and style."));
    shoeList.add(Shoe("Adidas Stan Smith", 84.99, "images/product4.jpg", "Green & White", "Unisex", "Casual", "The Adidas Stan Smith is an iconic tennis shoe loved for its simple design and comfort."));
    shoeList.add(Shoe("Converse Chuck Taylor All Star", 49.99, "images/product5.jpg", "Black", "Unisex", "Casual", "The Converse Chuck Taylor All Star is a timeless sneaker that never goes out of style."));
    shoeList.add(Shoe("Puma Suede Classic", 69.99, "images/product6.jpg", "Black", "Unisex", "Casual", "The Puma Suede Classic is a retro sneaker with a suede upper and signature Puma branding."));
    shoeList.add(Shoe("Vans Old Skool", 59.99, "images/product7.jpg", "Black", "Unisex", "Skateboarding", "The Vans Old Skool is a classic skate shoe featuring the iconic side stripe and durable canvas upper."));
    shoeList.add(Shoe("New Balance 574", 79.99, "images/product8.jpg", "Beige", "Male", "Casual", "The New Balance 574 is a popular sneaker known for its comfort and timeless design."));
    shoeList.add(Shoe("Reebok Classic Leather", 64.99, "images/product9.jpg", "White", "Unisex", "Casual", "The Reebok Classic Leather is an iconic sneaker loved for its clean, retro look and all-day comfort."));
    shoeList.add(Shoe("Under Armour HOVR Phantom", 119.99, "images/product10.jpg", "Black & White", "Male", "Running", "The Under Armour HOVR Phantom is a high-performance running shoe with responsive cushioning and a breathable upper."));
    shoeList.add(Shoe("Salomon Speedcross 5", 129.99, "images/product11.jpg", "Black", "Male", "Trail Running", "The Salomon Speedcross 5 is a trail running shoe designed for maximum grip and agility on rugged terrain."));
    shoeList.add(Shoe("Brooks Ghost 13", 129.99, "images/product12.jpg", "Grey", "Male", "Running", "The Brooks Ghost 13 is a neutral running shoe with plush cushioning and a smooth ride for long-distance runs."));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Products',
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: shoeList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(shoe: shoeList[index])
                  )
              );
            },
            child: Card(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          shoeList[index].image,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoeList[index].name,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$${shoeList[index].price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14, color: Colors.redAccent),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Color: ${shoeList[index].color}',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}