
class MenuItem {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  MenuItem({
    required this.name, 
    required this.imageUrl, 
    required this.price,
    this.description = '', required String id,
  });

  get id => null;
}
// lib/models/order.dart
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
