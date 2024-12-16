import 'package:cloud_kitchen/model/homemodel.dart';

class Order {
  final String id;
  final List<OrderItem> items;
  final DateTime createdAt;
  final double totalPrice;
  OrderStatus status;

  Order({
    required this.id,
    required this.items,
    required this.createdAt,
    required this.totalPrice,
    this.status = OrderStatus.pending,
  });
}

class OrderItem {
  final String orderId; // Fixed: added a proper orderId field
  final MenuItem menuItem;
  final int quantity;

  OrderItem({
    required this.orderId, // Set during initialization
    required this.menuItem,
    required this.quantity,
  });

  static fromJson(orderJson) {}

  toJson() {}
}

enum OrderStatus {
  pending,
  preparing,
  outForDelivery,
  delivered,
  cancelled
}
