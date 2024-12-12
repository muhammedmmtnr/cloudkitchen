import 'package:flutter/material.dart';
import 'package:cloud_kitchen/model/ordermodel.dart';

class OrderScreen extends StatefulWidget {
  final List<OrderItem> confirmedOrders;

  OrderScreen({required this.confirmedOrders});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Orders',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: widget.confirmedOrders.isEmpty
          ? const Center(
              child: Text(
                'No orders placed yet!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: widget.confirmedOrders.length,
              itemBuilder: (context, index) {
                final order = widget.confirmedOrders[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(
                      order.menuItem.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(order.menuItem.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('₹${order.menuItem.price}'),
                        Text('Qty: ${order.quantity}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
