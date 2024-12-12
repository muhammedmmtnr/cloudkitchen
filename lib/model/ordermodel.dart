
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
  final MenuItem menuItem;
  final int quantity;

  OrderItem({
    required this.menuItem,
    required this.quantity,
  });
}

enum OrderStatus {
  pending,
  preparing,
  outForDelivery,
  delivered,
  cancelled
}
