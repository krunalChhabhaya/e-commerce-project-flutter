import 'package:flutter/material.dart';
import 'package:flutterprjgroup9/shoe.dart';

import 'checkout.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.shoe}) : super(key: key);

  final Shoe shoe;

  @override
  _ProductDetailState createState() => _ProductDetailState(shoe: shoe);
}

class _ProductDetailState extends State<ProductDetail> {
  _ProductDetailState({required this.shoe});

  final Shoe shoe;
  bool _size = true;
  int _quantity = 1;
  final int maxQuantity = 10;

  String _selectedSize = '7';
  List<String> shoeSizes = ['7', '8', '9', '10', '11'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedRotation(
                  turns: _size ? 0 : 3,
                  duration: const Duration(seconds: 1),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: _size ? 300 : 400,
                    height: _size ? 300 : 400,
                    alignment: _size ? Alignment.topLeft : Alignment.bottomRight,
                    child: Hero(
                      tag: shoe.image,
                      child: Image(
                        image: AssetImage(shoe.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _size = !_size;
                    });
                  },
                  child: Text(_size ? 'Zoom In' : 'Zoom Out'),
                ),
              ],
            ),
            SizedBox(width: 32),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Name: ${shoe.name}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Price: \$${shoe.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Color: ${shoe.color}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Gender: ${shoe.gender}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Category: ${shoe.category}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sizes:',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    DropdownButton<String>(
                      value: _selectedSize,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSize = newValue!;
                        });
                      },
                      items: shoeSizes.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Quantity:',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_quantity > 1) _quantity--;
                            });
                          },
                          child: Icon(Icons.remove),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '$_quantity',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_quantity < maxQuantity) _quantity++;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Description:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${shoe.description}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                              productImage: shoe.image,
                              productName: shoe.name,
                              productPrice: shoe.price,
                              selectedSize: _selectedSize,
                              quantity: _quantity,
                            ),
                          ),
                        );
                      },
                      child: Text('Buy Now', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}