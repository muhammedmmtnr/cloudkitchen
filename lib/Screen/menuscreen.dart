import 'package:cloud_kitchen/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/iconclass.dart';
import '../constants/textstyle.dart';
import '../model/homemodel.dart';
import 'cartscreen.dart';

class CartProvider extends ChangeNotifier {
  final List<MenuItem> _cartItems = [];
  final List<CartItem> _cartItem = [];

  List<MenuItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItem.add(item);
    notifyListeners();
  }

  void clearCart() {}
}

class MenuScreen extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
        id: '1',
        name: 'Burger',
        imageUrl: 'assets/images/burger.png',
        price: 150.0,
        description: 'Juicy beef burger'),
    MenuItem(
        id: '2',
        name: 'Pizza',
        imageUrl: 'assets/images/pizza.png',
        price: 250.0,
        description: 'Margherita pizza'),
    MenuItem(
        id: '3',
        name: 'Pasta',
        imageUrl: 'assets/images/pasta.png',
        price: 200.0,
        description: 'Creamy alfredo pasta'),
    MenuItem(
        id: '4',
        name: 'Salad',
        imageUrl: 'assets/images/salad.png',
        price: 120.0,
        description: 'Fresh garden salad'),
    MenuItem(
        id: '5',
        name: 'Sandwich',
        imageUrl: 'assets/images/sandwich.png',
        price: 100.0,
        description: 'Classic club sandwich'),
    MenuItem(
        id: '6',
        name: 'Smoothie',
        imageUrl: 'assets/images/smoothie.png',
        price: 80.0,
        description: 'Fresh fruit smoothie'),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Scaffold(
        backgroundColor: ColorClass.white,
        appBar: AppBar(
          title: Text(
            'Cloud Kitchen',
            style: TextStyleClass.manrope700TextStyle(24, ColorClass.black),
          ),
          backgroundColor: ColorClass.amberlight,
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorClass.greytext),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        item.imageUrl,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyleClass.manrope600TextStyle(
                              14,
                              ColorClass.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '₹${item.price.toStringAsFixed(0)}',
                            style: TextStyleClass.manrope600TextStyle(
                              14,
                              ColorClass.darkRed,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  item.description,
                                  style: TextStyleClass.manrope600TextStyle(
                                    12,
                                    ColorClass.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                 
                                  final cartProvider =
                                      Provider.of<CartProvider>(context,
                                          listen: false);

                                 
                                  final cartItem = CartItem(
                                      id: item.id,
                                      name: item.name,
                                      description: item.description,
                                      price: item.price,
                                      imageUrl: item.imageUrl,
                                      quantity: 1);

                                  print(
                                      'DEBUG: Attempting to add item: ${item.name}');
                                  cartProvider.addToCart(cartItem);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('${item.name} added to cart'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                child: SvgPicture.asset(
                                  IconClass.AddIcon,
                                  width: 24.0,
                                  height: 24.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
