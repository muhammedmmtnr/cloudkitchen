import 'package:cloud_kitchen/model/cartmodel.dart';
import 'package:cloud_kitchen/provider/cartprovider.dart';
import 'package:cloud_kitchen/provider/menuprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/iconclass.dart';
import '../constants/textstyle.dart';
import 'cartscreen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the menu items from Firestore when the screen is initialized
    Future.microtask(() =>
        Provider.of<MenuProvider>(context, listen: false).fetchMenu());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Consumer<MenuProvider>(
        builder: (context, menuProvider, _) {
          if (menuProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (menuProvider.menuItems.isEmpty) {
            return Center(
              child: Text(
                'No menu items available.',
                style: TextStyleClass.manrope600TextStyle(16, ColorClass.grey),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
              itemCount: menuProvider.menuItems.length,
              itemBuilder: (context, index) {
                final item = menuProvider.menuItems[index];
                return MenuCo(menuItem: item);
              },
            ),
          );
        },
      ),
    );
  }
}

class MenuCo extends StatelessWidget {
  final MenuItem menuItem;

  const MenuCo({required this.menuItem});

  @override
  Widget build(BuildContext context) {
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              menuItem.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.error, size: 50, color: ColorClass.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuItem.name,
                  style:
                      TextStyleClass.manrope600TextStyle(14, ColorClass.black),
                ),
                SizedBox(height: 5),
                Text(
                  '₹${menuItem.price.toStringAsFixed(0)}',
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
                        menuItem.description,
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
                            Provider.of<CartProvider>(context, listen: false);

                        final cartItem = CartItem(
                          id: menuItem.id,
                          name: menuItem.name,
                          description: menuItem.description,
                          price: menuItem.price,
                          imageUrl: menuItem.imageUrl,
                          quantity: 1,
                        );

                        cartProvider.addToCart(cartItem);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${menuItem.name} added to cart'),
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
  }
}
