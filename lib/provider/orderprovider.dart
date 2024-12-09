import 'package:cloud_kitchen/model/homemodel.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<MenuItem> _menuItems = [
    MenuItem(
      id: '1',
      name: 'Burger',
      imageUrl: 'assets/images/burger.png',
      price: 150.0,
      description: 'Juicy beef burger',
    ),
    MenuItem(
      id: '2',
      name: 'Pizza',
      imageUrl: 'assets/images/pizza.png',
      price: 250.0,
      description: 'Margherita pizza',
    ),
    MenuItem(
      id: '3',
      name: 'Pasta',
      imageUrl: 'assets/images/pasta.png',
      price: 200.0,
      description: 'Creamy alfredo pasta',
    ),
    MenuItem(
      id: '4',
      name: 'Salad',
      imageUrl: 'assets/images/salad.png',
      price: 120.0,
      description: 'Fresh garden salad',
    ),
    MenuItem(
      id: '5',
      name: 'Sandwich',
      imageUrl: 'assets/images/sandwich.png',
      price: 100.0,
      description: 'Classic club sandwich',
    ),
    MenuItem(
      id: '6',
      name: 'Smoothie',
      imageUrl: 'assets/images/smoothie.png',
      price: 80.0,
      description: 'Fresh fruit smoothie',
    ),
  ];

  List<Order> _orders = [];

  List<MenuItem> get menuItems => [..._menuItems];
  List<Order> get orders => [..._orders];

  void addOrder(List<OrderItem> items) {
    final totalPrice = items.fold(
      0.0,
      (sum, item) => sum + (item.menuItem.price * item.quantity)
    );
    final newOrder = Order(
      id: DateTime.now().toString(),
      items: items,
      createdAt: DateTime.now(),
      totalPrice: totalPrice,
    );
    _orders.add(newOrder);
    notifyListeners();
  }

  void updateOrderStatus(String orderId, OrderStatus newStatus) {
    final index = _orders.indexWhere((order) => order.id == orderId);
    if (index != -1) {
      _orders[index].status = newStatus;
      notifyListeners();
    }
  }
}