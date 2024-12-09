import 'package:cloud_kitchen/Screen/orderscreen.dart';
import 'package:cloud_kitchen/model/homemodel.dart';
import 'package:cloud_kitchen/provider/orderprovider.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure Provider is imported

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Kitchen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => OrderScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) {
          if (orderProvider.menuItems.isEmpty) {
            return const Center(
              child: Text('No items available'),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: orderProvider.menuItems.length,
            itemBuilder: (ctx, index) {
              final menuItem = orderProvider.menuItems[index];
              return MenuItemCard(menuItem: menuItem);
            },
          );
        },
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem; // Assuming MenuItem is your data model

  const MenuItemCard({required this.menuItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                menuItem.imageUrl, // Replace with actual field
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              menuItem.name, // Replace with actual field
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$${menuItem.price.toString()}'), // Replace with actual field
          ),
        ],
      ),
    );
  }
}
