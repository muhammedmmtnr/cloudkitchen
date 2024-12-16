import 'package:cloud_kitchen/constants/colors.dart';
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
    final groupedOrders = <String, List<OrderItem>>{};

    for (var order in widget.confirmedOrders) {
      groupedOrders.putIfAbsent(order.orderId, () => []).add(order);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Orders',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: groupedOrders.isEmpty
          ? const Center(
              child: Text(
                'No orders placed yet!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: groupedOrders.length,
              itemBuilder: (context, orderIndex) {
                final orderId = groupedOrders.keys.elementAt(orderIndex);
                final items = groupedOrders[orderId]!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Order $orderId',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    ...items.map((order) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                Text('₹${order.menuItem.price.toStringAsFixed(2)}'),
                                Text('Qty: ${order.quantity}'),
                              ],
                            ),
                          ),
                        )),

                    if (orderIndex < groupedOrders.length - 1)
                      const Divider(
                        thickness: 1,
                        color: ColorClass.greytext,
                      ),
                  ],
                );
              },
            ),
    );
  }
}
