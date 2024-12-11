import 'package:cloud_kitchen/model/cartmodel.dart';
import 'package:cloud_kitchen/provider/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/textstyle.dart';

class CartScreen extends StatefulWidget {
  final CartItem? menuItems;

  CartScreen({this.menuItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.menuItems != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<CartProvider>(context, listen: false)
            .addToCart(widget.menuItems!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Your Cart',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: ColorClass.amberlight,
            actions: [
              IconButton(
                icon: const Icon(Icons.clear_all, color: Colors.white),
                onPressed: cartProvider.items.isEmpty
                    ? null
                    : () {
                        cartProvider.clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cart cleared successfully!'),
                            backgroundColor: ColorClass.darkRed,
                          ),
                        );
                      },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: cartProvider.items.isEmpty
                    ? Center(
                        child: Text(
                          'Your cart is empty.',
                          style: TextStyleClass.manrope600TextStyle(
                            16,
                            ColorClass.grey,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: cartProvider.items.length,
                        separatorBuilder: (context, index) => const Divider(
                          color: ColorClass.greytext,
                        ),
                        itemBuilder: (context, index) {
                          final item = cartProvider.items[index];
                            print('DEBUG: Displaying item: ${item.name}, Quantity: ${item.quantity}');
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: ListTile(
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
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '₹${item.price.toStringAsFixed(2)}',
                                    style: TextStyleClass.manrope600TextStyle(
                                      12,
                                      ColorClass.darkRed,
                                    ),
                                  ),
                                  if (item.description != null)
                                    Text(
                                      item.description!,
                                      style: TextStyleClass.manrope400TextStyle(
                                        12,
                                        ColorClass.grey,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove,
                                        color: ColorClass.darkRed),
                                    onPressed: () =>
                                        cartProvider.decreaseQuantity(item.id),
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style: TextStyleClass.manrope600TextStyle(
                                      14,
                                      ColorClass.black,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add,
                                        color: ColorClass.amberlight),
                                    onPressed: () =>
                                        cartProvider.increaseQuantity(item.id),
                                  ),
                                ],
                              ),
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
                    GestureDetector(
                      onTap: cartProvider.items.isEmpty
                          ? null
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Checkout successfully implemented!'),
                                  backgroundColor: ColorClass.amberlight,
                                ),
                              );
                            },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        decoration: BoxDecoration(
                          color: cartProvider.items.isEmpty
                              ? ColorClass.greytext
                              : ColorClass.amberlight,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              color: cartProvider.items.isEmpty
                                  ? Colors.black45
                                  : Colors.white,
                            ),
                          ),
                        ),
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
