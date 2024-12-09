// lib/Screen/cartscreen.dart
import 'package:cloud_kitchen/model/cartmodel.dart';
import 'package:cloud_kitchen/provider/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/textstyle.dart';


class CartScreen extends StatelessWidget {
  final Map<String, dynamic>? details;

  CartScreen({this.details});

  @override
  Widget build(BuildContext context) {
    // If details are passed, add to cart
    if (details != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<CartProvider>(context, listen: false).addToCart(
          CartItem(
            id: details!['id'],
            name: details!['name'],
            price: details!['price'],
            imageUrl: details!['imageUrl'],
            description: details!['description'],
          ),
        );
      });
    }

    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Your Cart', style: TextStyle(color: Colors.white)),
            backgroundColor: ColorClass.amberlight,
            actions: [
              IconButton(
                icon: Icon(Icons.clear_all, color: Colors.white),
                onPressed: () => cartProvider.clearCart(),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: cartProvider.items.isEmpty
                    ? Center(
                        child: Text(
                          'Your cart is empty',
                          style: TextStyleClass.manrope600TextStyle(
                            16,
                            ColorClass.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartProvider.items.length,
                        itemBuilder: (context, index) {
                          final item = cartProvider.items[index];
                          return ListTile(
                            leading: Image.asset(
                              item.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              item.name,
                              style: TextStyleClass.manrope600TextStyle(
                                14,
                                ColorClass.black,
                              ),
                            ),
                            subtitle: Text(
                              '₹${item.price.toStringAsFixed(0)}',
                              style: TextStyleClass.manrope600TextStyle(
                                12,
                                ColorClass.darkRed,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove, color: ColorClass.darkRed),
                                  onPressed: () => cartProvider.decreaseQuantity(item.id),
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: TextStyleClass.manrope600TextStyle(
                                    14,
                                    ColorClass.black,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add, color: ColorClass.amberlight),
                                  onPressed: () => cartProvider.increaseQuantity(item.id),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: ₹${cartProvider.totalAmount.toStringAsFixed(2)}',
                      style: TextStyleClass.manrope600TextStyle(
                        16,
                        ColorClass.black,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorClass.amberlight,
                      ),
                      onPressed: cartProvider.items.isEmpty
                          ? null
                          : () {
                              // Implement checkout logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Checkout Implemented'),
                                  backgroundColor: ColorClass.amberlight,
                                ),
                              );
                            },
                      child: Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}